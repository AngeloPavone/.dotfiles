function nix-rebuild-system
    set -q FLAKE_SYSTEM; or set FLAKE_SYSTEM (hostname)
    set -q DOTFILES_DIR; or set DOTFILES_DIR $HOME/.dotfiles
    sudo nixos-rebuild switch --flake $DOTFILES_DIR#$FLAKE_SYSTEM $argv
end
