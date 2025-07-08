function nix-reload-config
    home-manager switch --flake /home/angelo/.dotfiles#angelo$argv
end
