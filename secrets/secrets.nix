let 
    user = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKOwnMfxmSBjdjcq/KLvKn/KoVbmrAiMAcrb8pry2CM5";
    system = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEX/MKV0GfdpJxxpwN/b2MAnkT+dVQcRsAtXxKeARnPD";
in
    {
        "steam_api_key.age".publicKeys = [
            user
            system
        ];
    }
