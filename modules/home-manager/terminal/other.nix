butler # Terminal Itch.io API client
      chafa # Terminal image viewer
Terminal webcam
      asciinema-agg # Convert asciinema to .gif
      asciinema # Terminal recorder
      bandwhich # Modern Unix `iftop`
      bmon # Modern Unix `iftop`
      breezy # Terminal bzr client
      butler # Terminal Itch.io API client
      chafa # Terminal image viewer
      chroma # Code syntax highlighter
      clinfo # Terminal OpenCL info
      cpufetch # Terminal CPU info
      croc # Terminal file transfer
      curlie # Terminal HTTP client
      dconf2nix # Nix code from Dconf files
      difftastic # Modern Unix `diff`
      dogdns # Modern Unix `dig`
      dotacat # Modern Unix lolcat
      dua # Modern Unix `du`
      duf # Modern Unix `df`
      du-dust # Modern Unix `du`
      editorconfig-core-c # EditorConfig Core
      entr # Modern Unix `watch`
      fastfetch # Modern Unix system info
      fd # Modern Unix `find`
      frogmouth # Terminal mardown viewer
      glow # Terminal Markdown renderer
      gping # Modern Unix `ping`
      h # Modern Unix autojump for git projects
      hexyl # Modern Unix `hexedit`
      hr # Terminal horizontal rule
      httpie # Terminal HTTP client
      hyperfine # Terminal benchmarking
      iperf3 # Terminal network benchmarking
      jpegoptim # Terminal JPEG optimizer
      jiq # Modern Unix `jq`
      lima-bin # Terminal VM manager
      mdp # Terminal Markdown presenter
      mtr # Modern Unix `traceroute`
      neo-cowsay # Terminal ASCII cows
      netdiscover # Modern Unix `arp`
      nixpkgs-review # Nix code review
      nix-prefetch-scripts # Nix code fetcher
      nurl # Nix URL fetcher
      nyancat # Terminal rainbow spewing feline
      onefetch # Terminal git project info
      optipng # Terminal PNG optimizer
      procs # Modern Unix `ps`
      quilt # Terminal patch manager
      rclone # Modern Unix `rsync`
      sd # Modern Unix `sed`
      speedtest-go # Terminal speedtest.net
      terminal-parrot # Terminal ASCII parrot
      tldr # Modern Unix `man`
      tokei # Modern Unix `wc` for code
      ueberzugpp # Terminal image viewer integration
      upterm # Terminal sharing
      wget2 # Terminal HTTP client
      wthrr # Modern Unix weather
      wormhole-william # Terminal file transfer
      yq-go # Terminal `jq` for YAML
  
      figlet # Terminal ASCII banners
      iw # Terminal WiFi info
      libva-utils # Terminal VAAPI info
  
      python310Packages.gpustat # Terminal GPU info
      ramfetch # Terminal system info
      vdpauinfo # Terminal VDPAU info
      wavemon # Terminal WiFi monitor

micro";
    };
  };

  programs = {
    aria2 = {
      enable = true;
    };
    atuin = {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
      enableZshIntegration = true;
      flags = [
        "--disable-up-arrow"
      ];
      package = pkgs.atuin;
      settings = {
        auto_sync = true;
        dialect = "uk";
        show_preview = true;
        style = "compact";
        sync_frequency = "1h";
        sync_address = "https://api.atuin.sh";
        update_check = false;
      };
    };
bottom = {
      enable = true;
      settings = {
        colors = {
          high_battery_color = "green";
          medium_battery_color = "yellow";
          low_battery_color = "red";
        };
        disk_filter = {
          is_list_ignored = true;
          list = [ "/dev/loop" ];
          regex = true;
          case_sensitive = false;
          whole_word = false;
        };
        flags = {
          dot_marker = false;
          enable_gpu_memory = true;
          group_processes = true;
          hide_table_gap = true;
          mem_as_value = true;
          tree = true;
        };
      };
    };
  yt-dlp = {
      enable = true;
      package = pkgs.unstable.yt-dlp;
      settings ={
        audio-format = "best";
        audio-quality = 0;
        embed-chapters = true;
        embed-metadata = true;
        embed-subs = true;
        embed-thumbnail = true;
        remux-video = "aac>m4a/mov>mp4/mkv";
        sponsorblock-mark = "sponsor";
        sub-langs = "all";
      };
    };

