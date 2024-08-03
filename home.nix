{ pkgs, username, ... }:
let
	isLinux = pkgs.stdenv.hostPlatform.isLinux;
	isDarwin = pkgs.stdenv.hostPlatform.isDarwin;
	unsupported = builtins.abort "Unsupported platform";
in
{
	home.username = username;

	#WARNING: Don't change this without reading docs
	home.stateVersion = "23.11";
	programs.home-manager.enable = true; # Let home manager manage itself

	home.homeDirectory = 
		if isLinux then "/home/${username}" else
		if isDarwin then "/Users/${username}" else unsupported;

	fonts.fontconfig.enable = true; # Enable fonts

	nix = { # Configure the Nix package manager itself
		package = pkgs.nix;
		settings.experimental-features = [ "nix-command" "flakes" ];
	};
}
