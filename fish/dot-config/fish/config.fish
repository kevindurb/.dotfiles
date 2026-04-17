fish_add_path ~/.local/bin

if status is-interactive

theme_gruvbox dark medium

abbr --add c clear
abbr --add g git

starship init fish | source

end
