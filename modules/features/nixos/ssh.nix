{ self, inputs, ... }:

{
    flake.nixosModules = {
        ssh = { config, ... }:
            {
                programs.ssh = {
                    startAgent = true;
                };

                services = {
                    openssh.enable = true;
                    gnome.gcr-ssh-agent.enable = false;
                };
            };
    };
}
