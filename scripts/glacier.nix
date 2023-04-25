# glacier
#   creates new generations of nixOS.
#   written for the Nightshade project.
{
    inputs = {
        nixpkgs = {
            inherit (builtins) fetchurl;
            name = "nixpkgs";
        };
    };
    outputs = {
        default = {
            buildInputs = with inputs; [
                nixpkgs
                notify-desktop
                nixos-rebuild
            ];
        };
    };
    # create the generation script
    shellScript = ''
        # nightshade vars
        ns = "nightshade" 
        tag = "glacier-23.1"
        gen = 23
        label = "$gen - $ns $tag - $(date -I)"

        # create notification
        notificationTitle = "Glacier"
        notificationDescription = "Your Glacier has been created. Please restart $HOSTNAME for the changes to take effect."

        # create new Nix generation
        echo "Glacier generation starting..." && sleep 1
        echo "Preparation: $label" && sleep 1
        sudo nixos-rebuild switch --label="$label"
        echo "New Glacier created. Restart $HOSTNAME for changes to take effect." && sleep 1

        # display the notification
        notify-desktop "$notificationTitle" "$notificationDescription" 
        '';
}
