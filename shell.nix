{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/refs/tags/22.11.tar.gz") { } }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    dhall
    dhall-json
    font-awesome_4
    fontconfig
    gnumake
    lato
    pandoc
    poppler_utils
    texlive.combined.scheme-full
  ];
  FONTCONFIG_FILE = pkgs.makeFontsConf { fontDirectories = with pkgs; [ font-awesome_4 lato ]; };
}
