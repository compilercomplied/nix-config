
{ config, pkgs, options, ... }:

{

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = 
    with pkgs; 
    let 
      common = [
        cargo
        ctags
        curl
        git
        htop
        jq
        neovim
        networkmanager
        nodejs
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
      ];

      xorg = [
        compton
        discord
        dunst
        feh
        firefox
        haskellPackages.tidal
        i3
        kitty
        pavucontrol
        redshift
        rxvt_unicode
        scrot
        spotify
        supercollider
        tdesktop
        vscode
      ];

      in 
        common ++ 
        (
          if config.services.xserver.enable then xorg 
          else noxorg
        );

}
