{ pkgs, ... }:
{
  programs.obs-studio = {
    enable = true;

    # required for hw accel, hydra doesnt build this config for some reason so may be a good idea to disable this on my laptop in future?
    package = pkgs.obs-studio.override {
      cudaSupport = true;
    };

    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-pipewire-audio-capture
    ];
  };
}
