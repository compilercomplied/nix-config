
{ config, pkgs, options, ... }:

{

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages =
    with pkgs;
    let 
      core = [
        cargo
        ctags
        curl
        git
        htop
        httpie
        jq
        neovim
        networkmanager
        nodejs
        pv
        python27
        python37
        python37Packages.pynvim
        ripgrep
        rustc
        rustup
        tmux
        tree
        udiskie
        unzip
        vim
        wget
        yarn
        zsh
      ];

      extra = [
        compton
        discord
        dunst
        feh
        firefox
        haskellPackages.tidal
        i3
        kitty
        libnotify
        pavucontrol
        postman
        redshift
        rxvt_unicode
        scrot
        spotify
        supercollider
        tdesktop
        vscode
      ];
    in
      core ++ extra;
}
