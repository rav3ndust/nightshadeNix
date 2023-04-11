# glacier
#   generates new generations of nixOS.
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
    notify-desktop "Glacier" "New nightshadeNix generation created. Restart $HOSTNAME for changes to take effect."
    # create new nix generation
    echo "$ns generation starting..." && sleep 1
    echo "Preparation: $label" && sleep 1
    sudo nixos-rebuild switch --label="$label"
    echo "New $ns generation created. Restart $HOSTNAME for changes to take effect." && sleep 1
    '';
}
