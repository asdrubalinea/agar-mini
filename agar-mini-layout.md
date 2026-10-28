# Agar mini — custom ZMK layout

Tailored to how I type: with the nails, using thumbs, index and middle fingers of both hands,
one key at a time. Ring fingers only reach the top corners (Esc, Backspace), with the pad.
Pinkies press the edge keys with the back of the finger. Mostly prose in English and Italian (Claude Code, Reddit), Helix as editor,
mangowm as window manager (Super for everything, workspaces 1–0).

## Principles

1. **Thumbs hold, nails tap one key at a time.** Nothing needs a ring finger or several
   fingers pressed together; the only pinky key is the bottom-left corner (Shift).
2. **`'` is a dead key, as on `us intl`**: tap `'`, tap `e` → è; tap `'`, tap Space → `'`.
   Unlike `us intl`, the vowels get the grave accent Italian needs.
3. **Sticky modifiers.** Shift, Ctrl and Alt are tapped, then the next key is tapped.
4. **`"`, `` ` ``, `~` and `^` type plain characters**, even though the computer uses `us intl` dead keys.
5. **Shift where it always is**, bottom-left, to keep the muscle memory.
   Super under the left thumb, ← and → under the right. Backspace stays top-right, as on the Q4.

## Physical layout

43 keys: 13 / 12 / 12 / 6. The bottom row is Ctrl, Alt, Space, Space, ←, ↓ on the stock layout.

## Layers

Legend: `·` = same as base. `(x)` = what the key gives when held. `1×` = sticky.

### Layer 0 — BASE

```
Esc    Q    W    E    R    T    Y    U    I    O    P    '    Bksp
Tab    A    S    D    F    G    H    J    K    L    ;    Enter
Shift1× Z   X    C    V    B    N    M    ,    .    /    -
       Ctrl1× Super [Space/NAV]  [Space/NUM]  ←    →
```

- `Shift` (bottom-left corner, back of the left pinky, where Shift sits on any keyboard): the
  only Shift, sticky, for capitals, `?`, `"`, È and Shift+Enter.
- `'`: accent key, sticky. Tap it, then the vowel: `'`, `e` → è. Tap it, then Space, for a plain
  apostrophe. Shift + `'` = plain `"`. See the ACC layer.
- `Shift`, `Ctrl`: sticky. Tap, then the next key. They can also be held normally.
- `Super`: plain key, no hold behaviour.
- `Space/NAV` (left thumb): tap = Space, hold = NAV.
- `Space/NUM` (right thumb): tap = Space, hold = NUM.
- `←` / `→` (stock ← and ↓ keys, right thumb): plain arrows. With Super held they switch window
  (Super+← / Super+→); `→` alone accepts fish's autosuggestion. Holding them repeats.
  The other arrows and Alt are on NAV.
- Hold both Spaces for FN.

### Layer 1 — NUM (hold right Space)

```
`      1    2    3    4    5    6    7    8    9    0    =    ·
·      ~    |    \    [    {    }    ]    (    )    _    ·
·      !    @    #    $    %    ^    &    *    ·    ·    ·
       ·    ·    ·              held      ·    ·
```

- Backspace stays available, so a mistyped digit can be fixed without releasing the layer.
- `.`, `/` and `-` stay available, so `~/`, `1.5` and `192.168.…` type without releasing the layer.
- `` ` ``, `~` and `^` are sent as plain characters, not dead keys.
- Super + digit switches mango workspace.

### Layer 2 — NAV (hold left Space)

```
·      ·    ·    ·    ·    ·    Home PgDn PgUp End  ·    ·    Del
·      Sup1× Alt1× Ctl1× Sft1× · ←    ↓    ↑    →    ·    ·
·      ·    ·    ·    ·    ·    ·    ·    ·    ·    ·    ·
       ·    ·    held           ·         ·    ·
```

- Left home row: sticky modifiers for modified arrows (tap `D`, tap `L` = Ctrl+→).
- Home / PgDn / PgUp / End sit directly above ← ↓ ↑ →.

### Layer 3 — FN (hold both Spaces)

```
Boot   F1   F2   F3   F4   F5   F6   F7   F8   F9   F10  F11  F12
Caps   BT1  BT2  BT3  USB  BLE  Prev Vol- Vol+ Next Play Mute
·      ·    ·    ·    ·    ·    ·    ·    ·    ·    ·    ·
       ·    ·    held           held      ·    ·
```

- `Boot`: hold 3 s to enter the bootloader for flashing; a short tap restarts the keyboard.
- `BT1–3`: tap to select a Bluetooth profile, hold 3 s to clear its pairing.
  These are the stock KBDfans keys, so the status light reacts as before.
- `USB` / `BLE` switch the output.

### Layer 4 — ACC (tap `'`, then the key)

```
·      ·    ·    è    ·    ·    ·    ù    ì    ò    ·    é    ·
·      à    ·    ·    ·    ·    ·    ·    ·    ·    ·    ·
·      ·    ·    ·    ·    ·    ·    ·    ·    ·    ·    ·
       ·    ·    '              '         ·    ·
```

- `'` is a sticky layer: it applies to the next key only and expires after 1.5 s.
- Either Space types the apostrophe, with no space after it: `l`, `'`, Space, `a` → `l'a`.
- `'` twice types é.
- For the capital, tap Shift after `'`: `'`, Shift, `e` → È. Shift before `'` gives `"`.
- Any other key passes through unchanged and the apostrophe is lost: `'`, `t` → `t`.
  Waiting more than 1.5 s before Space loses it too.

## Everyday actions

| Action | Sends | Keys |
|---|---|---|
| è à ì ò ù | | tap `'`, tap the vowel |
| é | | tap `'` twice |
| È | | tap `'`, tap Shift, tap `E` |
| Backtick | `` ` `` | hold right Space, tap `Esc` |
| Capital letter | | tap Shift (bottom left), tap letter |
| Apostrophe / quote | `'` / `"` | tap `'`, tap Space / tap Shift, tap `'` |
| Newline in Claude Code | `Shift+Enter` | tap Shift, tap Enter |
| `?` | | tap Shift, tap `/` |
| `!` | | hold right Space, tap `Z` |
| Number | | hold right Space, tap the key above it (`Q` = 1 … `P` = 0) |
| Backspace | | top-right corner, as on the Q4 |
| Run the last command again | `Up`, `Enter` | hold left Space, tap `K`, tap Enter |
| Copy / paste | `Ctrl+C` / `Ctrl+V` | tap Ctrl, tap `C` / `V` |
| Kitty copy / paste | `Ctrl+Shift+C/V` | tap Ctrl, tap Shift, tap `C` / `V` |
| Switch workspace | `Super+3` | hold Super + hold right Space + tap `E` |
| Move window to workspace | `Super+Shift+3` | tap Shift, then hold Super + hold right Space + tap `E` |
| Other mango shortcuts | `Super+Return`, `Super+q`, … | hold Super + tap the key |
| Focus left / right | `Super+Left` / `Super+Right` | hold Super, tap ← / → |
| Focus up / down | `Super+Up` | hold left Space, tap `A`, tap `K` |
| Kitty tab | `Alt+3` | hold left Space, tap `S` (Alt), then hold right Space + tap `E` |
| Accept fish autosuggestion | `Right` | tap → (bottom right) |

No mango config changes are needed.

## Timing

| Key | Flavor | tapping-term-ms | quick-tap-ms | require-prior-idle-ms |
|---|---|---|---|---|
| Space/NAV | balanced | 200 | 175 | 150 |
| Space/NUM | balanced | 200 | 175 | — |

| Sticky keys | release-after-ms | quick-release |
|---|---|---|
| Shift, Ctrl, Alt (base and NAV) | 1500 | yes |
| `'` (sticky layer) | 1500 | no |

- Sticky keys apply to the next key only and expire after 1.5 s. Tapping Ctrl then Shift stacks them.
- `'` ignores modifiers, so Shift tapped between `'` and the vowel still gives the capital.
  Letters have no hold behaviour: they type on press.
- Space/NUM has no `require-prior-idle-ms`; otherwise typing `port 8080` quickly would give letters.

## Requires `us intl` on the computer

The keyboard types accents and plain quotes by sending `us intl` dead-key sequences
(checked against the system compose table):

| Output | Sequence sent |
|---|---|
| è à ì ò ù | `` ` `` + vowel |
| È | `` ` `` + Shift+E |
| é / É | `'` + `e` / `'` + Shift+E |
| `'` | `'` + Space |
| `"` | Shift+`'` + Space |
| `` ` `` / `~` / `^` | the dead key + Space |

On a device with a plain US layout (e.g. over Bluetooth), accents come out as `` `e `` and
quotes get an extra space.

## Status light

The single RGB light comes from KBDfans' indicator code. Steady colours show what is active,
listed from highest priority:

| Light | Meaning |
|---|---|
| Steady yellow | `'` is waiting for a vowel or Space |
| Steady cyan | A modifier is active: a sticky Shift, Ctrl, Alt or Super waiting, or Super held |
| Steady white | FN layer |
| Steady blue | NUM layer |
| Steady green | NAV layer |
| Steady magenta | Caps Lock on |

The blinking patterns come first, and these steady colours win over the low-battery blink:

| Light | Meaning |
|---|---|
| Yellow / cyan / magenta blinking | Bluetooth profile 1 / 2 / 3: 3 blinks when connected, ~15 s while connecting |
| Profile colour alternating with red | That profile isn't paired yet |
| Profile colour alternating with blue | Paired, but the device isn't connecting |
| Red blinking | Battery at 10% or less, on battery power |

## Firmware

The firmware is official [ZMK](https://zmk.dev) (main, on Zephyr 4.1), built with Nix.
The Agar mini isn't in ZMK itself, so this repo carries its description, ported from KBDfans'
own config ([openkbd/zmk-config-agar-mini-ble](https://github.com/openkbd/zmk-config-agar-mini-ble))
and board ([yangdigi/zmk-keyboards-klink](https://github.com/yangdigi/zmk-keyboards-klink)).

| File | What it is |
|---|---|
| `config/agar_mini_ble.keymap` | This layout |
| `config/device_keys.dtsi` | Bluetooth slot, USB and reset keys, as on the stock firmware |
| `config/west.yml` | ZMK and Zephyr, pinned to exact commits |
| `boards/kbdfans/klink/` | The controller board (nRF52840) |
| `boards/shields/agar_mini/` | Key matrix, physical layouts, settings, status-light code |
| `flake.nix` | Nix build via [zmk-nix](https://github.com/lilyinstarlight/zmk-nix) |

What changed from KBDfans' files:

- The board is ported to the current Zephyr board format. Pins and flash layout are unchanged,
  so KBDfans' bootloader accepts the firmware.
- The shield drops an RGB strip the board doesn't have, and the keymap drops KBDfans' unused
  mouse keys, mod-taps and diagnostic combo (Q + the key right of P, which sat on `'`).
- The status-light code follows ZMK's current API, no longer hides key presses from other
  ZMK features, and keeps working if an unexpected Bluetooth slot is selected. It also shows
  the active layer and modifiers.

Nothing is patched at build time, and nothing is a prebuilt binary: the ARM compiler is built
from source by Nix for the nRF52840's Cortex-M4.

### Build

```
nix build
```

The firmware lands in `result/zmk.uf2`. `nix build --rebuild` builds it again and fails if
the result isn't byte-identical.

To update ZMK, change the commits in `config/west.yml`, then run `nix run .#update`
(or set `zephyrDepsHash` to `nixpkgs.lib.fakeHash` and copy the hash from the error).

### Flash

1. Connect the keyboard by USB.
2. Enter the bootloader. It appears as a USB drive named `KLINK-BOOT`.
   - From this layout: hold both Spaces and hold `Esc` (`Boot`) for 3 seconds.
   - From the stock KBDfans firmware: hold the stock → key (layer 3) and hold `B` for 3 seconds.
     That's where KBDfans' source puts it; if nothing happens, their published file may differ.
   - By hardware, whatever firmware is on it: reset the controller twice within half a second.
     KBDfans' PCB renders show no reset button; the reset pin (P0.18, pad 26 of the E73 radio
     module on the back of the PCB) would have to be shorted to ground twice with tweezers.
     The bootloader also stays in flashing mode on its own if the application area is empty.
3. Run `nix run .#flash` (or copy `result/zmk.uf2` onto the drive). The keyboard restarts with the new layout.

The bootloader is YDKB's build of the Adafruit nRF52 bootloader
([yangdigi/Adafruit_nRF52_Bootloader](https://github.com/yangdigi/Adafruit_nRF52_Bootloader),
board `klink`). It only ever writes the application area, so a bad firmware can't damage it;
recovery is always "enter the bootloader again, flash something else". KBDfans' stock
`agar_mini-klink-zmk.uf2` uses family `0x59952840` and starts at `0x26000`, the same as our build.

Bluetooth pairings live in a separate part of the flash and normally survive a flash. If
Bluetooth misbehaves after switching firmware, wipe the stored settings: build
`nix build .#settings-reset`, flash its `zmk.uf2` the same way, then flash the firmware
again and re-pair your devices.

To go back to stock, flash KBDfans' `agar_mini-klink-zmk.uf2` from the
[product page](https://kbdfans.com/products/agar-mini) the same way.

### Implementation notes

- `'`: mod-morph (`&sl ACC` / Shift+`'` Space); with Ctrl, Alt or Super active it sends a plain
  `'` with the mods kept, so shortcuts still work. `&sl` has `release-after-ms = 1500`.
- ACC layer: each vowel is a mod-morph between two macros (`` ` `` E and `` ` `` Shift+E); `'` is
  the same with `'` E / `'` Shift+E, and both Spaces send `'` Space.
  The morph masks Shift while the macro runs, so the dead key itself is never shifted.
- Sticky modifiers: `&sk` with `release-after-ms = 1500` and `quick-release`.
- FN: conditional layer, active when NAV and NUM are both active.
- Layers 5–7 are reserved so ZMK Studio can add layers later.

## Dropped from the stock layout

Mouse keys (trackpad available), `Win+V`, Print Screen (mango uses `Super+Shift+S`),
Insert, Pause, Scroll Lock, right Alt, arrow cluster (← → kept bottom right, all four on NAV).
