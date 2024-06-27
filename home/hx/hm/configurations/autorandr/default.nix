{pkgs, ...}:
{
  services.autorandr = {
    enable = true;
    profiles = {
      "work" = {
      fingerprint = {
        eDP1 = "<EDID>";
        DP1 = "<EDID>";
      };
      config = {
        eDP1.enable = false;
        DP1 = {
          enable = true;
          crtc = 0;
          primary = true;
          position = "0x0";
          mode = "3840x2160";
          gamma = "1.0:0.909:0.833";
          rate = "60.00";
          rotate = "left";
        };
      };
      # hooks.postswitch = r eadFile ./work-postswitch.sh;
  };
    }
  }
}