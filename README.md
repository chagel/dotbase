# Dotbase - Base Dotfiles

A collection of essential dotfiles drives my daily workflow. macOS and Linux are supported.

## Philosophy

My approach to dotfiles centers around simplicity, modularity, and consistency - Yes, KISS and the Unix philosophy are a no-brianer. I avoid using plugins I don't understand and refrain from installing unnecessary software. If I don't like a program, I uninstall it.

## Included Configurations

This repository curates configs for:

- Neovim
- tmux
- Fish
- Ghostty

These are my must required packages and configs, kept minimal and stable. For other programs, I maintain separate repositories across specific OS. 

## Installation

To separate system-specific configurations, I create a new repository for each OS and add this repository as a Git submodule:

```bash
git submodule add https://github.com/chagel/Dotbase.git Dotbase
```

`base.mk` is a base makefile can be included too. Check what [dotmac](https://github.com/chagel/dotmac) does on my macOS setup and installation there.

---

Feel free to fork and I'd like to hear your feedback.
