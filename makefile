FLAGS=-d ~/.dotfiles -t ~

link:
	stow $(FLAGS) zsh
	stow $(FLAGS) nvim
	stow $(FLAGS) alacritty
	stow $(FLAGS) ctags
	stow $(FLAGS) git
	stow $(FLAGS) mycli
	stow $(FLAGS) starship
	stow $(FLAGS) tmux
	stow $(FLAGS) watson
	stow $(FLAGS) razer
	stow $(FLAGS) ssh

vim_install_plugins:
	vim +PlugInstall +qa

install_starship:
	curl -fsSL https://starship.rs/install.sh | FORCE=true bash

install_antigen:
	curl -L git.io/antigen > ~/antigen.zsh
