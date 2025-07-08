function nix-rebuild-home
    set -q FLAKE_USER; or set FLAKE_USER $USER
    set -q DOTFILES_DIR; or set DOTFILES_DIR $HOME/.dotfiles
    home-manager switch --flake $DOTFILES_DIR#$FLAKE_USER $argv
end
