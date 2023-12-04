hardware = {
    logitech = {
      wireless = {
        enable = true;
        enableGraphical = true;
      };
    };
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
      extraPackages = with pkgs; [
        vaapiVdpau
        libvdpau-va-gl
      ];
      extraPackages32 = with pkgs.pkgsi686Linux; [ libva ];
      setLdLibraryPath = true;
    };
    pulseaudio = {
      enable = false;
      support32Bit = true;
    };
  };
