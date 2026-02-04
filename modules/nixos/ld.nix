{ config, pkgs, ... }:

# handle linked libraries / DLLs
{
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      zlib
      stdenv.cc.cc.lib
      glib
    ];
  };
}
