{
  bluetooth = import ./bluetooth.nix;
  cpu-amd = import ./cpu-amd.nix;
  cpu-intel = import ./cpu-intel.nix;
  firmware = import ./firmware.nix;
  gpu-amd = import ./gpu-amd.nix;
  gpu-intel-nvidia = import ./gpu-intel-nvidia.nix;
  gpu-intel = import ./gpu-intel.nix;
  gpu-nvidia = import ./gpu-nvidia.nix;
  i2c = import ./i2c.nix;
  keyboard-backlight = import ./keyboard-backlight.nix;
  logitech = import ./logitech.nix;
  power-management = import ./power-management.nix;
  scanner = import ./scanner.nix;
  sounds = import ./sounds.nix;
  vulkan = import ./vulkan.nix;
}
