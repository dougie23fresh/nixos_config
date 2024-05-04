{}:
{
    # Optimise Linux system performance on demand
    # https://github.com/FeralInteractive/GameMode
    # https://wiki.archlinux.org/title/Gamemode
    #
    # Usage:
    #   1. For games/launchers which integrate GameMode support:
    #      https://github.com/FeralInteractive/GameMode#apps-with-gamemode-integration
    #      simply running the game will automatically activate GameMode.
    #   2. For others, launching the game through gamemoderun: `gamemoderun ./game`
    #   3. For steam: `gamemoderun steam-runtime`
    programs.gamemode = {
        enable = true;
        settings = {
        general = {
            softrealtime = "auto";
            renice = 15;
        };
        };
    };
    # see https://github.com/fufexan/nix-gaming/#pipewire-low-latency
    services.pipewire.lowLatency.enable = true;
    imports = [
        nix-gaming.nixosModules.pipewireLowLatency
    ];
}
