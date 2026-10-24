{
  description = "ZMK firmware for the KBDfans Agar mini (dual-mode)";

  inputs = {
    zmk-nix.url = "github:lilyinstarlight/zmk-nix";

    # One nixpkgs for everything: the one zmk-nix is tested against
    nixpkgs.follows = "zmk-nix/nixpkgs";
  };

  outputs = { self, nixpkgs, zmk-nix }: let
    forAllSystems = nixpkgs.lib.genAttrs (nixpkgs.lib.attrNames zmk-nix.packages);
  in {
    packages = forAllSystems (system: let
      pkgs = nixpkgs.legacyPackages.${system};

      # ARM compiler built from source for the nRF52840's Cortex-M4, instead of
      # nixpkgs' gcc-arm-embedded, which repackages ARM's prebuilt binaries.
      cortexM4 = import nixpkgs {
        localSystem = system;
        crossSystem = {
          # Hard-float ABI, as Zephyr builds the nRF52840 with its FPU on; the
          # compiler's own libraries must match or linking fails.
          config = "arm-none-eabihf";
          libc = "newlib";
          # Not gcc.mode = "thumb": the compiler wrapper turns it into an invalid
          # -mmode=thumb. Cortex-M only runs Thumb code, so GCC picks it anyway.
          gcc = {
            cpu = "cortex-m4";
            fpu = "fpv4-sp-d16";
          };
        };
      };

      # nixpkgs' wrapper adds -fno-omit-frame-pointer on every target. On the
      # firmware it only costs flash (about 14 KB) and differs from upstream
      # toolchains, so drop it.
      gcc = cortexM4.buildPackages.gcc.overrideAttrs (old: {
        postFixup = (old.postFixup or "") + ''
          substituteInPlace $out/nix-support/cc-cflags-before \
            --replace-fail -fno-omit-frame-pointer ""
        '';
      });

      # Zephyr's gnuarmemb toolchain support looks for arm-none-eabi-* tools
      toolchain = pkgs.runCommand "arm-none-eabi-toolchain" { } ''
        mkdir -p $out/bin
        # The gcc wrapper already links most binutils; take the rest from binutils
        for tool in ${gcc}/bin/* ${cortexM4.buildPackages.binutils}/bin/*; do
          name=$(basename "$tool")
          link="$out/bin/''${name/arm-none-eabihf-/arm-none-eabi-}"
          [ -e "$link" ] || ln -s "$tool" "$link"
        done
      '';

      zmk = zmk-nix.lib.buildersFor (pkgs.extend (final: prev: { gcc-arm-embedded = toolchain; }));
    in rec {
      default = firmware;

      inherit toolchain;

      firmware = zmk.buildKeyboard {
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

      # ZMK's settings_reset firmware for this board: wipes stored settings such
      # as Bluetooth pairings. Flash it, then flash the firmware again.
      settings-reset = zmk.buildKeyboard {
        name = "agar-mini-settings-reset";
        inherit (firmware) src westDeps;
        board = "klink//zmk";
        shield = "settings_reset";
        zephyrDepsHash = firmware.westDeps.outputHash;
        meta = firmware.meta;
      };

      flash = zmk-nix.packages.${system}.flash.override { inherit firmware; };
      update = zmk-nix.packages.${system}.update;
    });
  };
}
