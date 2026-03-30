{ config, lib, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  system.stateVersion = "25.11"; 

  nixpkgs.config.allowUnfree = true;

  services.xserver.videoDrivers = ["nvidia"];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages;

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };

  console.keyMap = "br-abnt2";

  services.xserver.xkb = {
    layout = "br";
    variant = "";
  };

  time.timeZone = "America/Sao_Paulo";

  programs.zsh = {
    enable = true;
    ohMyZsh = {
      enable = true;
      plugins = [ "git" "tmux" "extract" ];
      theme = "norm";
    };
  };

  users.defaultUserShell = pkgs.zsh;

  services.openssh.enable = true;
  networking.networkmanager.enable = true;
  networking.hostName = "nixos";

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    wireplumber.enable = true;
    pulse.enable = true;
    # jack.enable = true;
  };  

  services.libinput.enable = true;

  users.users.guilherme = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" "audio" ];
  };

  services.flatpak.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  xdg.portal.config.common.default = "gtk";

  environment.systemPackages = with pkgs; [
    zig
    gcc

    tree-sitter
    curl
    wget
    fd
    fzf
    ripgrep
    fastfetch
    btop
    ffmpeg
    zip
    unzip
    unrar
    git
    gnupg
    pinentry-curses

    ungoogled-chromium
    neovim
    nautilus
    foot
    pass

    inter
    noto-fonts
    noto-fonts-color-emoji
    fira-code
    colloid-icon-theme
    apple-cursor

    gnome-control-center
    papers
    gnome-tweaks
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.caskaydia-cove
  ];

  programs.tmux.enable = true;
  programs.steam = {
    enable = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };

  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
  services.gnome.core-apps.enable = false;
  services.gnome.core-developer-tools.enable = false;
  services.gnome.games.enable = false;
  environment.gnome.excludePackages = with pkgs; [ gnome-tour gnome-user-docs ];
  # services.displayManager.autoLogin.enable  = true;
  # services.displayManager.autoLogin.user = "guilherme";
}
