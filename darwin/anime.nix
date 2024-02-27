{ config, pkgs, ... }:

#INFO: Version 4.0.1 of Anime4k
let 
	fetchFromGitHub = pkgs.fetchFromGitHub;
in 
{
# Note, to use with IINA must edit settings to point to mpv configuration
	home.file.".config/mpv" = {
		source = fetchFromGitHub {
			owner = "Tama47";
			repo = "Anime4K";
			rev = "v4.0.1";
			sha256 = "1d50zzqwyh264rbqj3dr9hdylcjs4xbji95hrna5icl3a2fmy7q2"; # nix-preferch-url --unpack hash
		};
		recursive = true;
	};

	home.file."/usr/local/bin/jerry" = {
		source = pkgs.fetchurl {
			url = "https://github.com/justchokingaround/jerry/raw/main/jerry.sh";
			sha256 = "1jcc0cakrdxarqps6r2v03xvdqd3hmj63qw0fbzzgda0ydinappq"; # nix-preferch-url hash
			# sha256 = "0zjwwcjgydklsri1i03widgkjyfw1003i9jqml8nnr7q8xl3s6ly";
		};
		executable = true;
	};
	#
	# home.packages = [ 
	# 	(fetchFromGitHub { # https://github.com/justchokingaround/jerry/raw/main/jerry.sh
	# 			owner = "justchokingaround";
	# 			repo = "jerry";
	# 			rev = "main";
	# 			sha256 = "1jcc0cakrdxarqps6r2v03xvdqd3hmj63qw0fbzzgda0ydinappq"; # nix-preferch-url hash
	# 	}) 
	# ];

	home.packages = with pkgs; [
		ani-cli # anime CLI
		iina # Video player for MAC
		mpv # Video player for cli
		aria2 # Download manager for cli
		yt-dlp # m3u8 downloader
		fzf # Fuzzy finder for jerry
	];
}
