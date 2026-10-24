# Agar mini firmware

Personal ZMK firmware and layout for a KBDfans Agar mini (dual-mode, nRF52840 "klink"
controller). The owner types with long nails, mostly with thumbs, index and middle
fingers, writes English and Italian prose, and uses Helix and mangowm.
`agar-mini-layout.md` holds the design and its reasons: read it before changing the layout.

## Rules

- **Never flash the keyboard** (`nix run .#flash`, copying a `.uf2`, entering the bootloader)
  unless the owner asks for it in this session.
- Never push or add a remote without asking.
- Show NixOS/home-manager changes before applying them.
- Keep the build reproducible: pin every source to a commit or hash, and don't add
  prebuilt binaries. If something must be patched, use a patch file that fails loudly
  when it no longer applies, never a silent `sed`.

## Files

| Path | What it is |
|---|---|
| `config/agar_mini_ble.keymap` | The layout |
| `config/device_keys.dtsi` | Bluetooth slot, USB and reset keys, kept from KBDfans' stock keymap |
| `config/west.yml` | Official ZMK and Zephyr, pinned to exact commits |
| `boards/kbdfans/klink/` | The controller board, ported from KBDfans' `zmk-keyboards-klink` |
| `boards/shields/agar_mini/` | The Agar mini: key matrix, physical layouts, settings, status-light code |
| `CMakeLists.txt`, `zephyr/module.yml` | Make this repo a ZMK module so the board, shield and light code are found |
| `flake.nix` | Nix build via zmk-nix, with an ARM compiler built from source |
| `agar-mini-layout.md` | Layout spec: principles, layers, timings, firmware notes |
| `agar-mini-layout.html` → `.pdf` | Two-page printable manual drawn from the same layout |
| `agar mini 按键说明-电子版.pdf` | KBDfans' stock manual, for reference |

Git history keeps KBDfans' original files: the vendor import commits come before our changes.

## Invariants

- **Flash layout** in `boards/kbdfans/klink/klink_nrf52840_zmk.dts`: the application starts
  at `0x26000` and settings live at `0xec000`. KBDfans' bootloader expects exactly this;
  changing it can stop the keyboard booting.
- **UF2 family** `0x59952840` (`boards/kbdfans/klink/klink_nrf52840_zmk_defconfig`): the bootloader
  rejects other values.
- **Accents rely on the computer using xkb `us intl`**, where `' " \` ~ ^` are dead keys.
  Plain characters are sent as dead key + Space, accents as dead key + letter.
- **The layout is written in three places**: the keymap, `agar-mini-layout.md`, and
  `agar-mini-layout.html`. Change all three together, then re-render the PDF.

## Build and check

```sh
nix build                     # result/zmk.uf2
nix build --rebuild           # rebuilds and fails if the output isn't byte-identical
nix build .#settings-reset    # firmware that wipes stored settings (Bluetooth pairings)
```

The ARM compiler (GCC + newlib, hard-float Cortex-M4) is built from source by the flake,
so the first build on a machine compiles GCC. Zephyr builds with the FPU on and the
hard-float ABI; the toolchain must match or the link fails with "uses VFP register arguments".

After changing `config/west.yml`, set `zephyrDepsHash` to `nixpkgs.lib.fakeHash`, run
`nix build`, and paste the hash from the error (or run `nix run .#update`).

Render the manual:

```sh
google-chrome-stable --headless=new --no-pdf-header-footer \
  --print-to-pdf=agar-mini-layout.pdf agar-mini-layout.html
```

Nothing here is tested on hardware until the owner flashes it; say so when reporting.
