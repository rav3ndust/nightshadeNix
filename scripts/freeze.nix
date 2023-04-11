# freeze.nix
#	Freeze automatically creates derivations from Git repositories.
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
				git
			];
		};
	}:
	# create the freeze script.
	shellScript = ''
		# input for derivation information
		repositoryName = readInput "Enter the name of the git repo: "
		brachOrTag = readInput "Enter the branch or tag of the git repo: "
		outputDirectory = readInput "Enter the directory you'd like to store the derivation in: "
		# clone the repo
		echo "Cloning $repositoryName now..." && sleep 1
		git clone "$repositoryName" "$outputDirectory" 
		# begin the derivation creation
		echo "Creating new derivation..." && sleep 1
		nix-instantiate --flake "$outputDirectory"
		# add files from the repo to the derivation
		nix-store add-outputs --recursive "$outputDirectory"
		# now we set the version of the derivation to match that of the git repo.
		nix-set-version --output-name "$outputDirectory" "$branchOrTag"
		# now we build the derivation
		echo "Building the new derivation..." && sleep 1
		nix-build "$outputDirectory"
		'';
}

