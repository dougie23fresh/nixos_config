butler # Terminal Itch.io API client
      chafa # Terminal image viewer
Terminal webcam
glxinfo
bc
cmatrix                       # Simulates the falling characters theme from The Matrix movie
      duf                           # Disk Usage/Free Utility
      fd                            # A simple, fast and user-friendly alternative to find
      figlet                        # Program for making large letters out of ordinary text
      htop                          # An interactive process viewer
            inotify-tools                 # A set of command-line programs providing a simple interface to inotify.
                                    # inotifywait   inotifywatch
                                    # Source:  https://github.com/inotify-tools/inotify-tools/wiki
lfs                           # Get information on your mounted disks
      lsd                           # The next gen ls command
      lsdvd                         # Display information about audio, video, and subtitle tracks on a DVD
      ncdu                          # Disk usage analyzer with an ncurses interface
      neofetch                      # A fast, highly customizable system info script
      pciutils                      # A collection of programs for inspecting and manipulating configuration of PCI devices
      pfetch                        # A pretty system information tool written in POSIX sh
      pmutils                       # A small collection of scripts that handle suspend and resume on behalf of HAL
      psmisc                        # A set of small useful utilities that use the proc filesystem (such as fuser, killall and pstree)
      usbutils                       # Tools for working with USB devices, such as lsusb

      atool     # a script for managing file archives of various types 
                # provides: apack arepack als adiff atool aunpack acat
                #
                # examples: atool -x WPS-FONTS.zip    ==> this extracts the compressed file
                #           atool -l WPS-FONTS.zip    ==> this lists the contents of the compressed file
                #           atool -a name-your-compression.rar 1.pdf 2.pdf 3.sh    ==> this adds indovidual files to the compressed file

      gzip      # GNU zip compression program
                # provides: gunzip zmore zegrep zfgrep zdiff zcmp uncompress gzip znew zless zcat zforce gzexe zgrep

      lz4       # GNU zip compression program
                # provides: lz4c lz4 unlz4 lz4cat

      lzip      # A lossless data compressor based on the LZMA algorithm
                # provides: lzip

      lzo       # Real-time data (de)compression library

      lzop      # Fast file compressor
                # provides: lzop

      p7zip     # A new p7zip fork with additional codecs and improvements (forked from https://sourceforge.net/projects/p7zip/)
                # provides: 7zr 7z 7za

      rar       # Utility for RAR archives

      rzip      # Compression program
                # provides: rzip

      unzip     # An extraction utility for archives compressed in .zip format
                # provides: zipinfo unzipsfx zipgrep funzip unzip

      xz        # A general-purpose data compression software, successor of LZMA
                # provides: lzfgrep lzgrep lzma xzegrep xz unlzma lzegrep lzmainfo lzcat xzcat xzfgrep xzdiff
                #           lzmore xzgrep xzdec lzdiff xzcmp lzmadec xzless xzmore unxz lzless lzcmp

      zip       # Compressor/archiver for creating and modifying zipfiles
                # provides: zipsplit zipnote zip zipcloak

      zstd      # Zstandard real-time compression algorithm
                # provides: zstd pzstd zstdcat zstdgrep zstdless unzstd zstdmt
      droidcam               # Linux client for DroidCam app
      scrcpy                 # Display and control Android devices over USB or TCP/IP
           android-file-transfer  # Reliable MTP client with minimalistic UI         
                             # provides: aft-mtp-cli android-file-transfer aft-mtp-mount
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
      youtube-dl                     # Command-line tool to download videos from YouTube.com and other sites

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

