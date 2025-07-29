# home.nix
#
# Empty import as i dont need any atm
{ pkgs, ... }: {
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "angelo";
  home.homeDirectory = "/home/angelo";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    black
    btop
    cargo
    clang
    clang-tools
    cloc
    cmake
    curl
    delve
    emacs
    eza
    fastfetch
    fd
    fzf
    firefox
    jack2
    alsa-lib
    gdb
    gh
    git
    gnumake
    go
    gofumpt
    gopls
    gotools
    ispell
    lazygit
    libtool
    libvterm
    lldb
    libcxx
    luarocks
    neovim
    hyperfine
    nerd-fonts._0xproto
    nerd-fonts.code-new-roman
    nerd-fonts.d2coding
    nerd-fonts.envy-code-r
    nerd-fonts.fantasque-sans-mono
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
    nerd-fonts.sauce-code-pro
    nerd-fonts.symbols-only
    nerd-fonts.ubuntu
    nerd-fonts.victor-mono
    nerd-fonts.zed-mono
    ninja
    nodejs
    noto-fonts-color-emoji
    pkg-config
    pyright
    python313
    python313Packages.pip
    python313Packages.venvShellHook
    ripgrep
    starship
    stow
    stylua
    trash-cli
    unzip
    vim
    wget
    zellij
    zoxide
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # pkgs.config.packageOverrides = pkgs: {
  #   emacs = pkgs.emacs.override {
  #     name = "emacs-30.1-stable";
  #     # src = /usr/bin/env;
  #   };
  # };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
    # ~/.config/
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/angelo/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = { };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
