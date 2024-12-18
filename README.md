# Dotbase - Base Dotfiles

Welcome to the Dotbase repository, a collection of essential dotfiles that I use and recommend. These configurations are tested on both macOS and Linux.

## Philosophy

My approach to dotfiles centers around simplicity (KISS), modularity, and consistency. I avoid using plugins I don't understand and refrain from installing unnecessary software. If I don't like a program, I uninstall it immediately.

## Included Configurations

This repository includes configurations for:

- Neovim
- tmux
- Kitty
- Fish

These are my baseline configurations, kept minimal and stable. For other programs, I maintain separate repositories with their configurations. By default, I prefer to use the standard configurations unless there's a compelling reason to do otherwise.

## Installation

To separate system-specific configurations while using these base dotfiles, you can create a new repository and add this one as a submodule:

```bash
git submodule add https://github.com/chagel/Dotbase.git Dotbase
```

Check what [dotmac](https://github.com/chagel/dotmac) does on my macOS setup and installation there.

---

Feel free to adjust further to match your personal style or preferences.
