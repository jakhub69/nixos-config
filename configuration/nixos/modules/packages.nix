{ pkgs, ... }:

{
  programs.firefox.enable = true;

  services.flatpak.enable = true;

  environment.systemPackages = with pkgs; [

    (pkgs.steam.override {
      extraPkgs = pkgs: [
        pkgs.noto-fonts-cjk-sans
        pkgs.noto-fonts
        pkgs.dejavu_fonts
      ];
    })

    filezilla
    discord
    google-chrome
    teamspeak3

    obs-studio
    vlc
    spotify
    youtube-music

    htop
    ncdu
    nload
    yt-dlp
    ffmpeg
    fastfetch
    gparted
    headsetcontrol

    pkgs.kdePackages.filelight
    pkgs.kdePackages.kcalc
    pkgs.kdePackages.ark
    pkgs.kdePackages.spectacle
    pkgs.kdePackages.kate

    zip
    unzip
    inxi
    wget
    lshw
    pciutils
    unrar
    lm_sensors
    #glxinfo
    mesa-demos
    git
  ];
}
