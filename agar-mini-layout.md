# Agar mini — custom ZMK layout

Designed around mangowm (Super for everything, workspaces 1–0), kitty (`Alt+1–9` tabs),
Helix, fish/git/nix in the shell, and tmux/zellij.

## Principles

1. **Super is a plain key under the left thumb** (stock Alt position). No hold-tap, so fast
   typing can never fire `Super+q` (kill window) or `Super+n` (Dolphin).
2. **One layer per thumb.** Left Space: tap = Space, hold = NAV. Right Space: tap = Space, hold = NUM.
3. **Ctrl on the home row**: hold Tab or hold Enter.
4. **The arrow cluster is gone.** Arrows live on hjkl in NAV; the freed keys hold `'`, `/` and `-`.

## Physical layout

43 keys: 13 / 12 / 12 / 6. The bottom row is Ctrl, Alt, Space, Space, ←, ↓ on the stock layout.

## Layers

Legend: `*` = tap / hold, `·` = same as base.

### Layer 0 — BASE

```
Esc    Q    W    E    R    T    Y    U    I    O    P    '    Bksp
Tab*   A    S    D    F    G    H    J    K    L    ;    Enter*
Shift  Z    X    C    V    B    N    M    ,    .    /    -
       Alt  Super [Space/NAV]  [Space/NUM]  FN  AltGr
```

- `Tab*` and `Enter*`: tap = Tab / Enter, hold = Ctrl.
- `Space/NAV` (left thumb): tap = Space, hold = NAV.
- `Space/NUM` (right thumb): tap = Space, hold = NUM.
- `FN` (stock ← key): hold = FN.
- `AltGr` (stock ↓ key): Right Alt.

### Layer 1 — NUM (hold right Space)

```
`      1    2    3    4    5    6    7    8    9    0    =    Del
·      ~    |    \    [    {    }    ]    (    )    _    ·
·      !    @    #    $    %    ^    &    *    ·    ·    ·
       ·    ·    ·              held           ·    ·
```

`.`, `/` and `-` stay available, so `~/`, `1.5` and `192.168.…` type without releasing the layer.

### Layer 2 — NAV (hold left Space)

```
·      ·    ·    ·    ·    ·    Home PgDn PgUp End  ·    ·    Del
·      Sup  Alt  Ctl  Sft  ·    ←    ↓    ↑    →    ·    ·
·      ·    ·    ·    ·    ·    ·    ·    ·    ·    ·    ·
       ·    ·    held           ·              ·    ·
```

Left home row holds plain modifiers (Super, Alt, Ctrl, Shift) for modified arrows.
Home / PgDn / PgUp / End sit directly above ← ↓ ↑ →.

### Layer 3 — FN (hold FN)

```
Boot   F1   F2   F3   F4   F5   F6   F7   F8   F9   F10  F11  F12
Caps   BT1  BT2  BT3  USB  BLE  Prev Vol- Vol+ Next Play Mute
·      BTclr ·  ·    ·    ·    ·    ·    ·    ·    ·    ·
       ·    ·    ·              ·              held ·
```

- `Boot` enters the bootloader for flashing.
- `BT1–3` select Bluetooth profiles; `BTclr` clears the current profile's pairing.
- `USB` / `BLE` switch the output.

## Everyday shortcuts

| Action | Keys |
|---|---|
| Switch workspace (`Super+3`) | left thumb Super, right thumb holds Space, tap `E` |
| Move window to workspace (`Super+Shift+3`) | same, plus left pinky Shift |
| Workspaces 6–0 | same, right-hand fingers; nothing pinned |
| `Super+Return`, `Super+q`, `Super+e`, Super+mouse drag | left thumb + one key |
| `Super+Left` (focusdir) | hold left Space, `A` (Super) + `H` (←) |
| `Super+Shift+Left` (exchange_client) | hold left Space, `A` + `F` (Shift) + `H` |
| Kitty tab (`Alt+3`) | Alt + hold right Space + `E` |
| `Ctrl+C`, `Ctrl+R`, tmux `Ctrl+P` | hold Tab, tap the letter |
| Kitty copy / paste (`Ctrl+Shift+C/V`) | hold Enter (Ctrl) + Shift + C / V |
| Accept fish autosuggestion | hold left Space + `L` (→), or `Ctrl+F` |

No mango config changes are needed.

## Hold-tap tuning

| Key | Flavor | tapping-term-ms | quick-tap-ms | require-prior-idle-ms |
|---|---|---|---|---|
| Space/NAV | balanced | 200 | 175 | 150 |
| Space/NUM | balanced | 200 | 175 | — |
| Tab/Ctrl, Enter/Ctrl | balanced | 200 | 175 | 150 |

- `quick-tap-ms` lets tap-then-hold repeat the tap key (e.g. hold Space for repeated spaces).
- `require-prior-idle-ms` makes the key a plain tap mid-word, preventing misfires.
- Space/NUM deliberately has no `require-prior-idle-ms`; otherwise typing `port 8080`
  quickly would produce letters instead of digits.

## Optional extras

- **Combo J+K = Esc**, popular with Helix users.
- **xkb variant**: `us intl` makes `'` `"` `` ` `` `~` `^` dead keys, which is awkward in a shell.
  `altgr-intl` keeps accents behind AltGr and types those symbols directly.

## Dropped from the stock layout

Mouse keys (trackpad available), `Win+V`, Print Screen (mango uses `Super+Shift+S`),
Insert, Pause, Scroll Lock.
