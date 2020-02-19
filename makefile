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

vim_install_plugins:
	vim +PlugInstall +qa

install: link vim_install_plugins
