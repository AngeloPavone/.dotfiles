function nix-reload-config
    sudo nixos-rebuild switch --flake /home/angelo/.dotfiles#nixos$argv
end
