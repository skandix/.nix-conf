{ config, pkgs, ... }:

{
  networking.networkmanager.enable = true;

  environment.systemPackages = with pkgs; [
    networkmanager
    networkmanagerapplet
    networkmanager-openvpn
    networkmanager-openconnect
    openvpn
  ];

  networking.nameservers = [ "1.1.1.1" "1.0.0.1" ];
  networking.enableIPv6 = false;
  networking.wireguard = { enable = true; };

  systemd.services.NetworkManager-wait-online.enable = false;
  systemd.network.wait-online.enable = false;
  boot.initrd.systemd.network.wait-online.enable = false;

  # systemd.network.wait-online.timeout = 0;

  # systemd.network.wait-online.ignoredInterfaces = [
  #   "docker0"
  #   "tailscale0"
  #   "lo"
  # ];

  services.tailscale = {
    enable = true;
    extraUpFlags = [ "--exit-node-allow-lan-access=true" ];
    useRoutingFeatures = "both";
    openFirewall = true;
    interfaceName = "tailscale0";
  };
}
