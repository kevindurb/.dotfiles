fish_add_path ~/.local/bin

if status is-interactive

abbr --add c clear
abbr --add g git

starship init fish | source

end
