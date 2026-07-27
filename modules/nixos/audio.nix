{ config, pkgs, ... }:

{
  services.pipewire = {
    enable = true;
    audio.enable = true;
    pulse.enable = true;

    alsa.enable = true;
    alsa.support32Bit = true;

    wireplumber.enable = true;

    jack.enable = true;

    # Ensure extra Bluetooth audio codecs (AAC, SBC-XQ, LDAC) are loaded
    extraConfig.pipewire = {
      "10-bluetooth" = {
        "bluez5.enable-sbc-xq" = true;
        "bluez5.enable-msbc" = true;
        "bluez5.enable-hw-volume" = true;
        "bluez5.roles" = [
          "a2dp_sink"
          "a2dp_source"
          "hsp_hs"
          "hsp_ag"
          "hfp_hf"
          "hfp_ag"
        ];
      };
    };
  };
  security.rtkit.enable = true;

  environment.systemPackages = with pkgs; [
    pavucontrol # audio gui
    pamixer # changing volume, muting
    playerctl # play, pause
  ];
}
