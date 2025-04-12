# Dotbase - Base Dotfiles

Multi-system Dotfiles management for minimalist.

## Philosophy

My approach to dotfiles centers around simplicity, modularity, and consistency - Yes, I believe in KISS and the Unix philosophy. 
I bloged why I chose to use this approach [here](https://gchen.co/2024/06/07/dotfiles.html).

## What is this?

This repository is a collection of my base dotfiles and configurations that I use across multiple systems. 
For other programs, I maintain separate repositories across specific OS.

I have been using [Linux](https://gchen.co/2024/06/06/why-i-choose-linux.html), tmux and Vi/Vim for two decades, and I maintained my own dotfiles for a long time. If you are new to Neovim from Vi/Vim, you may find my another [repo](https://github.com/chagel/nvim-bootstrap) useful.

Windows(OS) > Panes(Multiplexer) > Buffers(Editor)

I abstracted the concept of computers daily drive into three layers. I have a consistent system to master them. 
This repository curates configs for my minimalist setup which I live by - Fish shell, tmux, Neovim and other limited tools.


## How to use

Each Windows(OS) is a project with [submodule](https://git-scm.com/book/en/v2/Git-Tools-Submodules) of this repository. 
You should run from there. Check out how I use them:

- [dotmac](https://github.com/chagel/dotmac) - macOS
- [dotnux](https://github.com/chagel/dotnux) - Linux

You need GNU [Make](https://www.gnu.org/software/make/) tools to build the dotfiles. `base.mk` is a base makefile that can be included in inherited projects. No other dependencies are required.

If you want to use this repository as a base for your own dotfiles, you can do so by adding it as a submodule to your own repository.

```bash
git submodule add https://github.com/chagel/Dotbase.git Dotbase
```

Run 'make' to install the dotfiles from your system project.


---

Feel free to fork and I'd like to hear your feedback.
