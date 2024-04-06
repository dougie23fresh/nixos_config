{  lib, config, pkgs, ... }:
{
  # logind - laptop lid
  services.logind.lidSwitch = "suspend";
  services.logind.lidSwitchExternalPower = "lock";
  # Battery
  services.system76-scheduler.settings.cfsProfiles.enable = true; # Better scheduling for CPU cycles - thanks System76
  services.tlp.enable = true; # Enable TLP (better than gnomes internal power manager)
  services.tlp.settings = {
      CPU_BOOST_ON_AC = 1;
      CPU_BOOST_ON_BAT = 0;
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
  };
  services.power-profiles-daemon.enable = false; # Disable GNOMEs power management
  #powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  powerManagement.powertop.enable = true; # Enable powertop
  services.thermald.enable = true; # Enable thermald (only necessary if on Intel CPUs)
}
