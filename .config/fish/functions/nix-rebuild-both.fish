function nix-rebuild-both
    set -q FLAKE_SYSTEM; or set FLAKE_SYSTEM (hostname)
    set -q DOTFILES_DIR; or set DOTFILES_DIR $HOME/.dotfiles
    sudo nixos-rebuild switch --flake $DOTFILES_DIR#$FLAKE_SYSTEM $argv

    set -q FLAKE_USER; or set FLAKE_USER $USER
    set -q DOTFILES_DIR; or set DOTFILES_DIR $HOME/.dotfiles
    home-manager switch --flake $DOTFILES_DIR#$FLAKE_USER $argv
end
