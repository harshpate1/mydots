![Arch Linux](https://img.shields.io/badge/OS-Arch%20Linux-1793D1?logo=arch-linux)

![Hyprland](https://img.shields.io/badge/WM-Hyprland-58E1FF)

![License](https://img.shields.io/github/license/harshpate1/mydots)

![Stars](https://img.shields.io/github/stars/harshpate1/mydots?style=social)

## Installation

### Clone
```bash
https://github.com/harshpate1/mydots.git ~/dotfiles
cd ~/dotfiles
```

### Stow Packages

```bash
stow hypr
stow waybar
stow kitty
stow fish
...
```

Or install everything:

```bash
stow */
```

---

## Creating a New Stow Package 

The repository mirrors your `$HOME`.

Example for Hyprland:

Current config:

```
~/.config/hypr/
```

Move it into the repository:

```bash
mkdir -p ~/dotfiles/hypr/.config
mv ~/.config/hypr ~/dotfiles/hypr/.config/
```

Then create the symlinks:

```bash
cd ~/dotfiles
stow hypr
```
Result:

```
~/dotfiles
└── hypr
    └── .config
        └── hypr

~/.config/hypr
    ↳ ~/dotfiles/hypr/.config/hypr
```

To update configs later, simply edit the files inside `~/dotfiles`.

---

## Repository Structure

```
dotfiles/
├── hypr/
├── kitty/
├── fish/
├── cava/
├── waybar/
├── rofi/
├── fastfetch/
└── ...
```

Each folder is an independent GNU Stow package.

---

## Updating

Pull the latest changes:

```bash
git pull
```

Restow if necessary:

```bash
stow --restow hypr
```

Or everything:

```bash
stow --restow */
```

---

## Removing

```bash
stow -D hypr
```

---

## Dependencies

- Hyprland
- Waybar
- Kitty
- Fish
- Rofi
- Cava
- Fastfetch
- GNU Stow
- Git

---

## Resources

These videos helped me understand GNU Stow:

[![GNU Stow Guide](https://i.ytimg.com/vi/y6XCebnB9gs/maxresdefault.jpg)](https://youtu.be/y6XCebnB9gs?si=4OtA_Rt13QgfSj03)

[![Managing Dotfiles with Stow](https://i.ytimg.com/vi/NoFiYOqnC4o/maxresdefault.jpg)](https://youtu.be/NoFiYOqnC4o?si=B1K1qTzWv1JHufNB)

---

## License

MIT