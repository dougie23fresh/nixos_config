{  pkgs, ... }:
{
  #nixpkgs.config.packageOverrides =
  #  pkgs: {
  #    vaapiIntel = pkgs.vaapiIntel.override {
  #    enableHybridCodec = true;
  #  };
  #};

  # OpenGL
  # opengl
  #hardware.opengl.enable = true;
  #hardware.opengl.driSupport = true;
  #hardware.opengl.driSupport32Bit = true;
  #hardware.opengl = {
  #  extraPackages = with pkgs; [
  #    intel-media-driver
  #    vaapiIntel
  #    vaapiVdpau
  #    libvdpau-va-gl
  #  ];
  #  extraPackages32 = with pkgs.pkgsi686Linux; [
  #    vaapiVdpau
  #    libvdpau-va-gl
  #  ];
  #};
}
