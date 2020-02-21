{ config, pkgs, options, ... }:

{

  imports = [ <nixos-hardware/lenovo/thinkpad/x220> ];

  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/sda";

  networking.hostName = "flappy";
  networking.wireless.enable = true;

  time.timeZone = "Europe/Madrid";

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  services.xserver.enable = true;
  services.xserver.layout = "es";
  services.xserver.libinput.enable = true;
  services.xserver.desktopManager.xterm.enable=false;
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.windowManager.i3.enable=true;

  security.sudo.enable = true;
  security.sudo.extraConfig = with pkgs;''
    %wheel      ALL=(ALL:ALL) NOPASSWD: ${pkgs.systemd}/bin/poweroff
    %wheel      ALL=(ALL:ALL) NOPASSWD: ${pkgs.systemd}/bin/reboot
    %wheel      ALL=(ALL:ALL) NOPASSWD: ${pkgs.systemd}/bin/systemctl suspend
    %wheel      ALL=(ALL:ALL) NOPASSWD: /home/sine/.scripts/status.sh
  '';

  users.users.sine = {
    isNormalUser = true;
    home = "/home/sine";
    createHome = true;
    extraGroups = [ "wheel" ];
  };

}
