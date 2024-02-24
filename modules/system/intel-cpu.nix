{  lib, config, pkgs, ... }:
{
  hardware.cpu.intel.updateMicrocode = config.hardware.enableRedistributableFirmware;
}