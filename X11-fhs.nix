{ pkgs ? import <nixpkgs> {} }:

(pkgs.buildFHSEnv {
  name = "X11-fhs";
  targetPkgs = pkgs: (with pkgs; [
    udev
    alsa-lib
    vulkan-loader
    libGL
    libxkbcommon
  ]) ++ (with pkgs.xorg; [
    libX11
    libXcursor
    libXinerama
    libXext
    libXrandr
    libXrender
    libXi
    libXfixes
  ]);
  multiPkgs = pkgs: (with pkgs; [
    udev
    alsa-lib
  ]);
  runScript = "bash";
})
