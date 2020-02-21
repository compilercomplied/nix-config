
{ config, pkgs, ... }:

{

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "box";
  networking.wireless.enable = true;

  # steam compatibility
  # hardware.steam-hardware.enable = true;
  # hardware.opengl.driSupport32Bit = true;
  # hardware.opengl.extraPackages32 = with pkgs.pkgsi686Linux; [ libva ];
  # hardware.pulseaudio.support32Bit = true;

  time.timeZone = "Europe/Madrid";

  sound.enable = true;
  hardware.pulseaudio.enable = true;
  
  services.openssh.enable = true;
  services.openssh.passwordAuthentication = false;
  # services.openssh.authorizedKeysFiles = [ "/etc/nixos/.ssh/authorized_keys" ];
  # services.openssh.forwardX11 = true;
  # services.openssh.permitRootLogin = "yes";
  # services.openssh.challengeResponseAuthentication = false;

  services.xserver.enable = false;
  # services.xserver.layout = "us";
  # services.xserver.libinput.enable = true;
  # services.xserver.desktopManager.xterm.enable = false;
  # services.xserver.displayManager.lightdm.enable = true;
  # services.xserver.windowManager.i3.enable = true;

  security.sudo.enable = true;
  security.sudo.extraConfig = with pkgs;''
    %wheel      ALL=(ALL:ALL) NOPASSWD: ${pkgs.systemd}/bin/poweroff
    %wheel      ALL=(ALL:ALL) NOPASSWD: ${pkgs.systemd}/bin/reboot
    %wheel      ALL=(ALL:ALL) NOPASSWD: ${pkgs.systemd}/bin/systemctl suspend
  '';

  users.users.sine = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    openssh.authorizedKeys.keyFiles = [ "/etc/nixos/.ssh/authorized_keys" ];
  };

  users.users.mpd = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  services.mopidy.enable = true;
  services.mopidy.extensionPackages = [ 
    pkgs.mopidy-spotify
  ];

  services.mopidy.configuration = builtins.readFile /etc/nixos/system/mopidy.conf;

}
