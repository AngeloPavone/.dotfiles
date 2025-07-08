function nix-edit-config
    # Open config file relative to your dotfiles directory env var or default path
    set -q DOTFILES_DIR; or set DOTFILES_DIR $HOME/.dotfiles
    nvim $DOTFILES_DIR/$argv
end
