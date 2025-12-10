{
  pkgs ? let
    lock = (builtins.fromJSON (builtins.readFile ./flake.lock)).nodes.nixpkgs.locked;
    nixpkgs = fetchTarball {
      url = "https://github.com/nixos/nixpkgs/archive/${lock.rev}.tar.gz";
      sha256 = lock.narHash;
    };
  in
    import nixpkgs {overlays = [];},
  ...
}:
pkgs.stdenv.mkDerivation {
  name = "sygnal-dev";

  nativeBuildInputs = with pkgs; [
    git
    just

    # Latest statix
    (
      statix.overrideAttrs
      (_o: rec {
        src = fetchFromGitHub {
          owner = "oppiliappan";
          repo = "statix";
          rev = "e9df54ce918457f151d2e71993edeca1a7af0132";
          hash = "sha256-duH6Il124g+CdYX+HCqOGnpJxyxOCgWYcrcK0CBnA2M=";
        };

        cargoDeps = pkgs.rustPlatform.importCargoLock {
          lockFile = src + "/Cargo.lock";
          allowBuiltinFetchGit = true;
        };
      })
    )

    nixd
    deadnix
    alejandra
  ];

  # Bootstrapping commands
  shellHook = ''
    # Fetch latest changes
    git pull
  '';

  # Nix related configurations
  NIX_CONFIG = "extra-experimental-features = nix-command flakes pipe-operators";
}
