check:
	nix flake check

update:
	nix flake update

switch:
	sudo nixos-rebuild switch --flake .

macos:
	nix build .#darwinConfigurations."SpaceCruiser".system \
	   --extra-experimental-features 'nix-command flakes'

