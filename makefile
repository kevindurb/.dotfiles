FLAGS=-d ~/.dotfiles -t ~

install: link vim_install_plugins

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

starship:
	curl -fsSL https://starship.rs/install.sh | bash
