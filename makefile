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
	stow $(FLAGS) tmate
	stow $(FLAGS) kitty
	stow $(FLAGS) prettier
	stow $(FLAGS) polybar
	stow $(FLAGS) todotxt
	stow $(FLAGS) i3
	stow $(FLAGS) gh
