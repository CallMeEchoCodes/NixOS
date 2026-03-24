{
  writeShellApplication,
  slurp,
  grim,
  hyprpicker,
  wl-clipboard,
  xdg-user-dirs,
  coreutils,
  ...
}:
writeShellApplication {
  name = "screenshooter";
  runtimeInputs = [
    slurp
    grim
    hyprpicker # used to freeze the screen, very hacky
    wl-clipboard
    xdg-user-dirs
    coreutils
  ];
  text = builtins.readFile ./screenshooter.sh;
}
