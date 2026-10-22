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

        src = nixpkgs.lib.sourceFilesBySuffices self [ ".board" ".c" ".cmake" ".conf" ".defconfig" ".dts" ".dtsi" ".json" ".keymap" ".overlay" ".shield" ".txt" ".yml" "_defconfig" ];

        board = "klink";
        shield = "agar_mini_ble";
        enableZmkStudio = true;

        # The nanopb bundled with this ZMK fork still imports pkg_resources,
        # which setuptools no longer ships.
        postConfigure = ''
          sed -i \
            -e 's/import pkg_resources/import importlib.resources/' \
            -e "s|pkg_resources.resource_filename('grpc_tools', '_proto')|str(importlib.resources.files('grpc_tools') / '_proto')|" \
            ../modules/lib/nanopb/generator/proto/{__init__,_utils}.py

          # hog.h and hog.c still test the old CONFIG_ZMK_MOUSE name. In hog.h
          # that hides the mouse report prototype, which GCC 15 rejects; in
          # hog.c it miscounts the Bluetooth HID attributes, so power/sleep
          # keys are sent to the wrong attribute.
          sed -i 's/IS_ENABLED(CONFIG_ZMK_MOUSE)/IS_ENABLED(CONFIG_ZMK_POINTING)/' \
            ../zmk/app/include/zmk/hog.h ../zmk/app/src/hog.c
        '';

        zephyrDepsHash = "sha256-AlK6foSeozV6mMDEFRRWVlCVnqw5bF9g03ryjMQ/ffw=";

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
