#! /usr/bin/env bash

set -euo pipefail

OS="$(uname -s)"
ARCHITECTURE="$(uname -m)"
CURRENT_HOST="$(hostname)"
REQUESTED_MODE="${1:-auto}"

if [[ -n "${SWITCHBOARD_REPO:-}" ]]; then 
    REPO_DIR="$SWITCHBOARD_REPO"
else 
    SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
    REPO_DIR="$SCRIPT_DIR"
    while [[ "$REPO_DIR" != "/" && ! -f "$REPO_DIR/flake.nix" ]]; do 
        REPO_DIR="$(dirname "$REPO_DIR")"
    done 
fi

if [[ ! -f "$REPO_DIR/flake.nix" ]]; then
    echo "Error: Unable to locate flake.nix"
    exit 1
fi

cd "$REPO_DIR"
IS_NIXOS=false

if [[ -r /etc/os-release ]] && grep -q '^ID=nixos$' /etc/os-release; then
    IS_NIXOS=true
fi

IS_NIXOS_INSTALLER=false

if [[ "$IS_NIXOS" == true ]] && [[ "$CURRENT_HOST" == "nixos" ]] && command -v nixos-install >/dev/null 2>&1; then
    IS_NIXOS_INSTALLER=true
fi 

case "$REQUESTED_MODE" in 
    auto)
        if [[ "$IS_NIXOS_INSTALLER" == true ]]; then 
            MODE="install"
        else
            MODE="switch"
        fi
        ;;
    
    switch|boot|test|build|install)
        MODE="$REQUESTED_MODE"
        ;;
    
    *)
        echo "Usage: $0 [switch|boot|test|build|install]"
        exit 1
        ;;
esac

echo "=================================================="
echo "Multi-Host Switchboard"
echo "=================================================="
echo "▶ OS:                 $OS ($ARCHITECTURE)"
echo "▶ Local Hostname:     $CURRENT_HOST"
echo "▶ Operation:          $MODE"

if [[ "$IS_NIXOS_INSTALLER" == true ]]; then
    echo "▶ Environment:        NixOS Installation Media"
else
    echo "▶ Environment:        Active System"
fi 

echo "=================================================="
echo "Discovering host configurations..."

mapfile -t HOSTS < <(
    nix eval \
        --raw \
        --apply 'hosts: builtins.concatStringsSep "\n" (builtins.attrNames hosts)' \
        .#nixosConfigurations
)

if (( ${#HOSTS[@]} == 0 )); then
    echo "Error: No nixosConfigurations exported by flake"
    exit 1
fi

DEFAULT_INDEX=0

echo
echo "Avaliable Host Configurations:"

for i in "${!HOSTS[@]}"; do
    if [[ "${HOSTS[$i]}" == "$CURRENT_HOST" ]]; then
        DEFAULT_INDEX="$i"
        printf '    [*] [%d] %s (Current System)\n' "$i" "${HOSTS[$i]}"
    else
        printf '        [%d] %s\n' "$i" "${HOSTS[$i]}"
    fi
done 

echo

read -rp "Select configuration [Default: $DEFAULT_INDEX]: " HOST_INDEX
HOST_INDEX="${HOST_INDEX:-$DEFAULT_INDEX}"

if ! [[ "$HOST_INDEX" =~ ^[0-9]+$ ]]; then
    echo "Error: Selection requires a numeric"
    exit 1 
fi 

if (( HOST_INDEX >= ${#HOSTS[@]} )); then 
    echo "Error: Configuration index out of range"
    exit 1 
fi 

TARGET_HOST="${HOSTS[$HOST_INDEX]}"
FLAKE_TARGET="$REPO_DIR#$TARGET_HOST"

echo 
echo "Configuration Selected:   .#$TARGET_HOST"
echo "--------------------------------------------------"

discover_disks() {
    echo "Discovering installation targets..."
    echo

    mapfile -t DISKS < <(
        lsblk \
            --nodeps \
            --noheadings \
            --paths \
            --output NAME,TYPE |
        awk '$2 == "disk" { print $1 }'
    )

    if (( ${#DISKS[@]} == 0 )); then 
        echo "Error: No installation disks detected"
        exit 1
    fi 

    echo "Avaliable Installation Targets:"

    for i in "${!DISKS[@]}"; do 
        DISK="${DISKS[$i]}"
        SIZE="$(lsblk --nodeps --noheadings --output SIZE "$DISK" | xargs)"
        MODEL="$(lsblk --nodeps --noheadings --output MODEL "$DISK" | xargs)"
        if [[ -z "$MODEL" ]]; then 
            MODEL="Unknown Model"
        fi 
        printf '        [%d] %s | %s | %s\n' \
        "$i" \
        "$DISK" \
        "$SIZE" \
        "$MODEL"
    done

    echo 

    read -rp "Select installation target: " DISK_INDEX

    if ! [[ "$DISK_INDEX" =~ ^[0-9]+$ ]]; then 
        echo "Error: Selection requires a numeric"
        exit 1 
    fi 

    if (( DISK_INDEX >= ${#DISKS[@]} )); then 
        echo "Error: Disk index out of range"
        exit 1 
    fi 

    TARGET_DISK="${DISKS[$DISK_INDEX]}"

    echo
    echo "Select Installation Target:"
    lsblk "$TARGET_DISK"
    echo 
}

show_disk_layout() {
    echo "--------------------------------------------------"
    echo "Selected Disk Layout"
    echo "--------------------------------------------------"

    lsblk \
        --paths \
        --output NAME,SIZE,FSTYPE,TYPE,MOUNTPOINTS \
        "$TARGET_DISK"
    
    echo "--------------------------------------------------"
    echo
}

confirm_disk() {
    echo "=================================================="
    echo "WARNING: DESTRUCTIVE INSTALLATION TARGET"
    echo "=================================================="
    echo "Host:     $TARGET_HOST"
    echo "Disk:     $TARGET_DISK"
    echo 
    echo "Future provisioning will erase all data on this disk"
    echo 

    read -rp "Type '$TARGET_DISK' to confirm: " CONFIRMATION

    if [[ "$CONFIRMAION" != "$TARGET_DISK" ]]; then 
        echo "Installation cancelled"
        exit 1
    fi

    echo 
    echo "Installation target confirmed."
}

provision_disk() {
    echo "--------------------------------------------------"
    echo "Disk Provisioning"
    echo "--------------------------------------------------"
    echo "Host:     $TARGET_HOST"
    echo "Disk:     $TARGET_DISK"
    echo
    echo "Running disko in dry-run mode..."
    echo

    sudo disko-install \
        --dry-run \
        --flake "$REPO_DIR#$TARGET_HOST" \
        --disk main "$TARGET_DISK"
}

case "$MODE" in 
    switch)
        echo "Switching active system..."
        sudo nixos-rebuild switch --flake "$FLAKE_TARGET"
        ;;
    
    boot)
        echo "Building next boot generation..."
        sudo nixos-rebuild boot --flake "$FLAKE_TARGET"
        ;;
    
    test)
        echo "Testing configuration..."
        sudo nixos-rebuild test --flake "$FLAKE_TARGET"
        ;;
    
    build)
        echo "Building configuration..."
        nixos-rebuild build --flake "$FLAKE_TARGET"
        ;;
    
    install)
        echo "Installation Initialised"
        echo

        discover_disks
        show_disk_layout
        confirm_disk
        provision_disk

        echo 
        echo "Installation halted before nixos-install"
        ;;
esac
