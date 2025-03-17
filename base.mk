DOTS := $(shell ls dots)
CONFIGS := $(shell ls configs)
BASE := $(shell pwd)

all: init setup 

init: 
	## make .config folder
	@mkdir -pv ${HOME}/.config

setup:
	## link dotfile under ${HOME} and ${XDG_CONFIG_HOME}
	@for item in $(DOTS); do ln -vsfn ${BASE}/dots/$$item ${HOME}/.$$item; done
	@for item in $(CONFIGS); do ln -vsfn ${BASE}/configs/$$item ${HOME}/.config/$$item; done
	## link vim 
	@ln -vsfn ${BASE}/dotbase/nvim ${HOME}/.config/nvim
	## link tmux
	@ln -vsfn ${BASE}/dotbase/tmux ${HOME}/.tmux
	@ln -vsf ${BASE}/dotbase/tmux/tmux.conf ${HOME}/.tmux.conf
	## link fish 
	@ln -vsfn ${BASE}/dotbase/fish ${HOME}/.config/fish
	@ln -vsfn ${BASE}/configs/fish/user.fish ${HOME}/.config/fish/user.fish
	## link ghostty 
	@ln -vsfn ${BASE}/dotbase/ghostty ${HOME}/.config/ghostty
	## config tmux 
	@mkdir -pv ${HOME}/.tmux/plugins
	@if [ ! -d "${HOME}/.tmux/plugins/tpm" ]; then \
		git clone https://github.com/tmux-plugins/tpm ${HOME}/.tmux/plugins/tpm; \
	fi

update:
	## update vim plugins
	@nvim --headless "+Lazy! update" +qa
	## update tmux plugins 
	~/.tmux/plugins/tpm/bin/install_plugins
	~/.tmux/plugins/tpm/bin/update_plugins all
