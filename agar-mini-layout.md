# Agar mini — custom ZMK layout

Tailored to how I type: with the nails, using thumbs, index and middle fingers of both hands,
one key at a time. Ring fingers only reach the top corners (Esc, Backspace), with the pad.
No pinkies. Mostly prose in English and Italian (Claude Code, Reddit), Helix as editor,
mangowm as window manager (Super for everything, workspaces 1–0).

## Principles

1. **Thumbs hold, nails tap one key at a time.** Nothing needs a pinky, a ring finger or
   several fingers pressed together.
2. **Long-press vowels for Italian accents**, like a phone keyboard: hold `e` → è.
3. **Sticky modifiers.** Shift, Ctrl and Alt are tapped, then the next key is tapped.
4. **`'` and `"` always type plain characters**, even though the computer uses `us intl` dead keys.
5. **Super under the left thumb, a second sticky Shift under the right thumb.**
   Backspace stays top-right, as on the Q4.

## Physical layout

43 keys: 13 / 12 / 12 / 6. The bottom row is Ctrl, Alt, Space, Space, ←, ↓ on the stock layout.

## Layers

Legend: `·` = same as base. `(x)` = what the key gives when held. `1×` = sticky.

### Layer 0 — BASE

```
Esc    Q    W    E(è) R    T    Y    U(ù) I(ì) O(ò) P    '(é) Bksp
Tab    A(à) S    D    F    G    H    J    K    L    ;    Enter
Shift1× Z   X    C    V    B    N    M    ,    .    /    -
       Ctrl1× Super [Space/NAV]  [Space/NUM]  Shift1× ↑
```

- Vowels: tap = letter, hold = accented letter. Shift first gives the capital (È).
- `'`: tap = plain apostrophe, hold = é. Shift + `'` = plain `"`.
- `Shift`, `Ctrl`: sticky. Tap, then the next key. They can also be held normally.
- `Super`: plain key, no hold behaviour.
- `Space/NAV` (left thumb): tap = Space, hold = NAV.
- `Space/NUM` (right thumb): tap = Space, hold = NUM.
- `Shift` (stock ← key, right thumb): a second sticky Shift, for capitals, `?`, `"`, È and
  Shift+Enter without moving the left hand.
- `↑` (stock ↓ key): plain Up arrow, to recall the last command. Holding it repeats.
  The other arrows and Alt are on NAV.
- Hold both Spaces for FN.

### Layer 1 — NUM (hold right Space)

```
`      1    2    3    4    5    6    7    8    9    0    =    Del
·      ~    |    \    [    {    }    ]    (    )    _    ·
·      !    @    #    $    %    ^    &    *    ·    ·    ·
       ·    ·    ·              held      ·    ·
```

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

## Everyday actions

| Action | Sends | Keys |
|---|---|---|
| è à ì ò ù | | hold the vowel |
| é | | hold `'` |
| È | | tap Shift, hold `E` |
| Capital letter | | tap Shift (right thumb), tap letter |
| Apostrophe / quote | `'` / `"` | tap `'` / tap Shift, tap `'` |
| Newline in Claude Code | `Shift+Enter` | tap Shift, tap Enter |
| `?` | | tap Shift, tap `/` |
| `!` | | hold right Space, tap `Z` |
| Number | | hold right Space, tap the key above it (`Q` = 1 … `P` = 0) |
| Backspace | | top-right corner, as on the Q4 |
| Run the last command again | `Up`, `Enter` | tap ↑ (bottom right), tap Enter |
| Copy / paste | `Ctrl+C` / `Ctrl+V` | tap Ctrl, tap `C` / `V` |
| Kitty copy / paste | `Ctrl+Shift+C/V` | tap Ctrl, tap Shift, tap `C` / `V` |
| Switch workspace | `Super+3` | hold Super + hold right Space + tap `E` |
| Move window to workspace | `Super+Shift+3` | tap Shift, then hold Super + hold right Space + tap `E` |
| Other mango shortcuts | `Super+Return`, `Super+q`, … | hold Super + tap the key |
| Focus direction | `Super+Left` | hold left Space, tap `A`, tap `H` |
| Kitty tab | `Alt+3` | hold left Space, tap `S` (Alt), then hold right Space + tap `E` |
| Accept fish autosuggestion | `Right` | hold left Space, tap `L` |

No mango config changes are needed.

## Timing

| Key | Flavor | tapping-term-ms | quick-tap-ms | require-prior-idle-ms |
|---|---|---|---|---|
| Space/NAV | balanced | 200 | 175 | 150 |
| Space/NUM | balanced | 200 | 175 | — |
| Vowels and `'` | tap-preferred | 250 | — | — |

| Sticky keys | release-after-ms | quick-release |
|---|---|---|
| Shift, Ctrl, Alt (base and NAV) | 1500 | yes |

- Vowels are decided by time only: shorter than 250 ms types the letter, longer gives the accent.
  They type on release. If accents appear by mistake, raise the term; if they're slow to come, lower it.
- Sticky keys apply to the next key only and expire after 1.5 s. Tapping Ctrl then Shift stacks them.
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

The single RGB light comes from KBDfans' indicator code and is unchanged:

| Light | Meaning |
|---|---|
| Yellow / cyan / magenta blinking | Bluetooth profile 1 / 2 / 3: 3 blinks when connected, ~15 s while connecting |
| Profile colour alternating with red | That profile isn't paired yet |
| Profile colour alternating with blue | Paired, but the device isn't connecting |
| Red blinking | Battery at 10% or less, on battery power |
| Steady magenta | Caps Lock on |

## Firmware

The firmware is ZMK, built from KBDfans' own config for the dual-mode Agar mini
([openkbd/zmk-config-agar-mini-ble](https://github.com/openkbd/zmk-config-agar-mini-ble)),
on yangdigi's ZMK fork and `klink` board, with ZMK Studio enabled.

| File | What it is |
|---|---|
| `config/agar_mini_ble.keymap` | This layout |
| `config/boards/shields/klink_kbd/` | KBDfans' shield: matrix, physical layout, status light, stock keymap |
| `config/west.yml` | ZMK fork and board, pinned to exact commits |
| `flake.nix` | Nix build via [zmk-nix](https://github.com/lilyinstarlight/zmk-nix) |

Changes to KBDfans' files: sticky keys re-enabled in `common.keymap` (KBDfans omits them),
and two status-light callbacks in `klink_indicator.c` now return a value as ZMK expects.

### Build

```
nix build
```

The firmware lands in `result/zmk.uf2`. After changing `config/west.yml`, run `nix run .#update`
to refresh the dependency hash.

### Flash

1. Connect the keyboard by USB.
2. Enter the bootloader. It appears as a USB drive.
   - From this layout: hold both Spaces and hold `Esc` (`Boot`) for 3 seconds.
   - From the stock KBDfans firmware: hold the stock → key (layer 3) and hold `B` for 3 seconds.
     That's where KBDfans' source puts it; if nothing happens, their published file may differ.
3. Run `nix run .#flash` (or copy `result/zmk.uf2` onto the drive). The keyboard restarts with the new layout.

To go back to stock, flash KBDfans' `agar_mini-klink-zmk.uf2` from the
[product page](https://kbdfans.com/products/agar-mini) the same way.

### Implementation notes

- Vowels: hold-tap (tap-preferred, 250 ms). Tap `&kp E`; hold = mod-morph between two macros
  (`` ` `` E and `` ` `` Shift+E).
- `'`: hold-tap. Tap = mod-morph (`'` Space / Shift+`'` Space); hold = mod-morph (`'` E / `'` Shift+E).
- Sticky modifiers: `&sk` with `release-after-ms = 1500` and `quick-release`.
- FN: conditional layer, active when NAV and NUM are both active.
- Layers 4–7 are reserved so ZMK Studio can add layers later.

## Dropped from the stock layout

Mouse keys (trackpad available), `Win+V`, Print Screen (mango uses `Super+Shift+S`),
Insert, Pause, Scroll Lock, right Alt, arrow cluster (↑ kept bottom right, the rest on NAV).
