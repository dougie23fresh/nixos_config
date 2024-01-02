{ pkgs, libs, ...}:

let 
  cfg = config.
{
    option1.enable = true
    systemPackages = with pkgs; [
        neovim
    ];
}


environment.systemPackages = with pkgs; [
    vulkan-loader
    vulkan-validation-layers
    vulkan-extension-layers
    vulkan-tools
    libva-utils
    cudatoolkit
  ];

  hardware.nvidia.prime = {
    offload.enable = true;
    nvidiaBusId = "PCI:1:0:0";
    intelBusId = "PCI:0:2:0"; 
    sync.enable = true;
  };
  hardware.nvidia.nvidiaSettings = true;
  hardware.nvidia.modesetting.enable = true;
  hardware.nvidia.nvidiaPersistenced = true;
  hardware.nvidia.powerManagement = {
    enable = true;
    finegrained = true;
  };

    programs.hyprland.nvidiaPatches = true;