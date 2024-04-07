#{  lib, config, pkgs, ... }:
{
  # earlyoom #Enable the early OOM (Out Of Memory) killer service.
  services.earlyoom.enable = true;
  services.earlyoom.freeMemThreshold = 5; # When free memory falls below 15%, earlyoom acts to prevent system slowdown or freezing.
}
