default:
  @just --list

# Add --option eval-cache false if you end up caching a failure you can't get around
rebuild:
	scripts/system-flake-rebuild.sh

#requires sops to be running, must have reboot after inital rebuild
rebuild-full:
	scripts/system-flake-rebuild.sh

#requires sops to be running, must have reboot after inital rebuild
rebuild-trace:
	#just rebuild-pre
	scripts/system-flake-rebuild-trace.sh
	#just rebuild-post

update:
	nix flake update

rebuild-update:
	just update
	just rebuild