{ self, inputs, ... }:

{
    flake.nixosModules = {
        noctaliaSSH = { config, ... }:
            {
                programs.ssh = {
                    startAgent = true;
                };

                services.gnome = {
                    gcr-ssh-agent.enable = false;
                };
            };
    };
}
