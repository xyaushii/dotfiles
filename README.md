![screenshot](image.png)

<strong><p align="center">Hyprland-based rice with Waybar, Rofi, and Kitty.</p></strong>

## Components

| Component   | Description                          |
|-------------|--------------------------------------|
| **Hyprland** | Wayland compositor with modular config |
| **Waybar**   | Status bar with custom scripts       |
| **Rofi**     | App launcher, wallpaper & power menu |
| **Kitty**    | GPU-accelerated terminal emulator    |
| **Fastfetch** | System information display          |

## Installation

```bash
git clone https://github.com/xyaushii/dotfiles.git && cp -r dotfiles/.config/* ~/.config/
```

> [!WARNING]
> Backup your existing configs first and adjust paths to match your system.

## Configuration

### Hyprland
**Main entry point:** `~/.config/hypr/hyprland.conf`
- **Keybinds:** `~/.config/hypr/conf/keybinds.conf`
- **Monitors:** `~/.config/hypr/conf/monitors.conf`
- **Animations:** `~/.config/hypr/conf/animations.conf`
- **Window rules:** `~/.config/hypr/conf/windowrules.conf`

### Waybar Weather

> [!IMPORTANT]
> Edit `~/.config/waybar/scripts/weather.sh` and replace `YOURCITY` with your city for weather to display correctly.

## Dependencies

- `hyprland`
- `waybar`
- `rofi`
- `kitty`
- `fastfetch`
- `swaync`
- `awww` (wallpaper daemon)
- `yazi`
- `cliphist` (clipboard)

## Contact

Discord: cipsior
