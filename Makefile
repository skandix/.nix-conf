check:
	nix flake check

update:
	nix flake update

switch:
	sudo nixos-rebuild switch --flake .
