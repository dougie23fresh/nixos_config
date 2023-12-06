{ config, pkgs, ... }:
{
  services.system76-scheduler.settings.cfsProfiles.enable = true;

  services.tlp.enable = true;
  services.tlp.settings = {
    CPU_BOOST_ON_AC = 1;
    CPU_BOOST_ON_BAT = 0;
    CPU_SCALING_GOVERNOR_ON_AC = "performance";
    CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

    #CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
    #CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

    #CPU_MIN_PERF_ON_AC = 0;
    #CPU_MAX_PERF_ON_AC = 100;
    #CPU_MIN_PERF_ON_BAT = 0;
    #CPU_MAX_PERF_ON_BAT = 20;
  };
  # Battery power management
  #services.upower.enable = true;
  services.power-profiles-daemon.enable = false;
  powerManagement.powertop.enable = true;
  services.thermald.enable = true;
}