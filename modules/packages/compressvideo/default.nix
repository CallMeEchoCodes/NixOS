{
  writeShellApplication,
  ffmpeg,
  bc,
  bash,
  coreutils,
  ...
}:
writeShellApplication {
  name = "compressvideo";
  runtimeInputs = [
    ffmpeg
    bc
    coreutils
    bash
  ];
  text = builtins.readFile ./compressvideo.sh;
}
