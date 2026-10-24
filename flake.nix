{
  description = "ZMK firmware for the KBDfans Agar mini (dual-mode)";

  inputs = {
    zmk-nix.url = "github:lilyinstarlight/zmk-nix";

    # Use the nixpkgs zmk-nix is tested against: gcc-arm-embedded from a
    # newer nixpkgs-unstable (2026-10) segfaults on startup.
    nixpkgs.follows = "zmk-nix/nixpkgs";
  };

  outputs = { self, nixpkgs, zmk-nix }: let
    forAllSystems = nixpkgs.lib.genAttrs (nixpkgs.lib.attrNames zmk-nix.packages);
  in {
    packages = forAllSystems (system: rec {
      default = firmware;

      firmware = zmk-nix.legacyPackages.${system}.buildKeyboard {
        name = "agar-mini-firmware";

        src = nixpkgs.lib.fileset.toSource {
          root = ./.;
          fileset = nixpkgs.lib.fileset.unions [ ./boards ./config ./zephyr ./CMakeLists.txt ];
        };

        board = "klink//zmk";
        shield = "agar_mini_ble";
        enableZmkStudio = true;

        zephyrDepsHash = "sha256-zDnYk7iavZLcuPRrl8QUMROnvikwBGOrDa5prc2cFtk=";

        meta = {
          description = "ZMK firmware";
          license = nixpkgs.lib.licenses.mit;
          platforms = nixpkgs.lib.platforms.all;
        };
      };

      flash = zmk-nix.packages.${system}.flash.override { inherit firmware; };
      update = zmk-nix.packages.${system}.update;
    });

    devShells = forAllSystems (system: {
      default = zmk-nix.devShells.${system}.default;
    });
  };
}
