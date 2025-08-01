# Configuration.nix
#
# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{ pkgs, inputs, ... }:

{
  imports = [ inputs.wsl.nixosModules.default ];

  wsl = {
    enable = true;
    defaultUser = "angelo";
  };

  programs.hyprland = {
    # Install the packages from nixpkgs
    enable = true;
    # Whether to enable XWayland
    xwayland.enable = true;
  };

  # Install fish globally for better portability accross systems outside of WSL
  environment.systemPackages = with pkgs; [
    fish
    mesa
    hyprland
    hyprland-protocols
    wayland
    wayland-protocols
  ];

  users.users.angelo = {
    shell = "${pkgs.fish}/bin/fish";
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  # Uncomment if i decide i want to use home-manager as a module
  # home-manager = {
  #   useUserPackages = true;
  #   useGlobalPkgs = true;
  #   backupFileExtension = "bak";
  #   users.angelo = import ./home.nix { inherit pkgs neovim11; };
  # };

  # Enable experimental-features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
