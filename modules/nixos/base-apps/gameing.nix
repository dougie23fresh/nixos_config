{ pkgs, ...}:
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
    program.steam.enable = true;
    program.steam.gamescopeSession.enable = true;
    environment.systemPackages = with pkgs; [
        mangohud
        protonup-qt
        heroic
        lutris
        bottles
        prismlauncher

        xdotool
        xxd
        yad
        mangohud
        mesa
        steam
        steam-run
        vkbasalt

        wine
        wineWowPackages.stable
        winetricks
        gamemode
        steam-with-pkgs
        gamescope
        protontricks

    ];
    programs.gamescope.enable = true;
    programs.gamemode = {
        enable = true;
        settings = {
            general = {
                softrealtime = "auto";
                renice = 15;
            };
        };
    };
    users.users.melvin = {
        extraGroups = ["gamemode"];
    };

    environment.sessionVariables = {
        STEAM_EXTRA_COMPAT_TOOL_PATHS = "/home/melvin/.steam/root/compatibilitytools.d";
    }

    # gamemoderun %command%
    # mangohud %command%
    # gamescope %command%


    # see https://github.com/fufexan/nix-gaming/#pipewire-low-latency
    services.pipewire.lowLatency.enable = true;
    imports = [
        nix-gaming.nixosModules.pipewireLowLatency
    ];
}
