#!/usr/bin/env nix-shell
set -euo pipefail
###################
ns="nightshade"
tag="gen-21.3"
gen=23
label="$gen - $ns $tag - $(date -I)"
####################
# - functions
####################
notify () {
	# sends notifications
	local n1="GlacierGen"
	local n2="New nightshadeNix generation created. Restart computer for changes to take effect."
	notify-desktop "$n1" "$n2"
}
create_generation () {
	# creates a new Nix generation with custom label.
	# We're in nightshade23.
	echo "nightshadeNix generation starting..."
	sleep 1
	echo "Preparation: $label"
	sleep 1
	sudo NIXOS_LABEL="$label" nixos-rebuild switch
	sleep 1
	echo "New nightshadeNix generation created. You'll need to restart your machine for changes to take effect."
	sleep 1
}
main () {
	# main function
	create_generation
	notify
	exit
}
###############################
# script entry
###############################
main
