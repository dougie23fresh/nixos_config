
{
    environment.systemPackages = with pkgs; [
        fscan # An intranet comprehensive scanning tool
        iperf3 # Tool to measure IP bandwidth using UDP or TCP
        ethtool # Utility for controlling network drivers and hardware
        netcat-gnu # Utility which reads and writes data across network connections
        # dogdns # Command-line DNS client
        wget # Tool for retrieving files using HTTP, HTTPS, and FTP
        mtr-gui # A network diagnostics tool

        mtr # A network diagnostics tool
        wakelan # Send a wake-on-lan packet
        # miniserve # CLI tool to serve files and directories over HTTP
        q # A tiny and feature-rich command line DNS client with support for UDP, TCP, DoT, DoH, DoQ, and ODoH
        nali # An offline tool for querying IP geographic information and CDN provider
        dnsutils # dns tools dig nslookup
        ngrep # Network packet analyzer
        gping # Ping, but with a graph
        httping # ping with HTTP requests
        traceroute # Tracks the route taken by packets over an IP network

        # sing-box # The universal proxy platform
        # rathole # Reverse proxy for NAT traversal
        # tor # Anonymizing overlay network
        # arti # An implementation of Tor in Rust
        # tuic # Delicately-TUICed 0-RTT proxy protocol
        # phantomsocks # A cross-platform proxy client/server for Linux/Windows/macOS
    ];
}
