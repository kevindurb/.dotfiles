FLAGS=-d ~/.dotfiles -t ~

install:
	stow $(FLAGS) zsh
	stow $(FLAGS) nvim
	stow $(FLAGS) alacritty
	stow $(FLAGS) ctags
	stow $(FLAGS) git
	stow $(FLAGS) mycli
	stow $(FLAGS) starship
	stow $(FLAGS) tmux
