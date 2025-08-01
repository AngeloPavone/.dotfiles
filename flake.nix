# flake.nix
#
{
  description = "NixOS configuration for WSL with specific packages";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    wsl.url = "github:nix-community/NixOS-WSL";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import inputs.nixpkgs { inherit system; };
      neovim11 = inputs.neovimPkgs.legacyPackages.${system}.neovim;
    in
    {
      nixosConfigurations = {
        # Hostname: <nixos> can be changed
        nixos = inputs.nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit inputs;
            inherit neovim11;
          };
          modules = [
            ./configuration.nix
            {
              environment.systemPackages = with pkgs; [ ];

              system.stateVersion = "24.11";
            }
          ];
        };
      };

      homeConfigurations = {
        angelo = inputs.home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./home.nix ];
          extraSpecialArgs = { };
        };
      };
    };
}
