{ pkgs,... }:
{
	nixpkgs.config.allowUnfree = true; # Allow unfree licensed packages, like discord
	nixpkgs.config.permittedInsecurePackages = [
		"electron-25.9.0" # Required for obsidian for some reason
	];

	home.packages = with pkgs; (
		# General packages for system-wide use
		[
			fira-code-nerdfont # decent nerd font
			neofetch # Show os info and such

			# nodejs

			# Used in neovim telescope, as well as just generally useful
			ripgrep # Fast grep
			fd # Advanced find
		]

		# Personal stuff (also system-wide)
		++ [
			obsidian # MD note taker editor
			discord # Voicechat and social app
		]
	);
}
