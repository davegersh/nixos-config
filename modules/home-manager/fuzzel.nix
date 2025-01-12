{ config, pkgs, ... }:

{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        width = 30;
        terminal = "kitty -e";
      };
      colors = {
        background = "222222c1";
        text = "ebdbb2ff";
        prompt = "8ec07cff";
        input = "ebdbb2ff";
        match = "feb32cff";
        selection = "83a598ff";
        selection-text = "282828ff";
        selection-match = "282828ff";
        border = "83a598ff";
      };
      border = {
        width = 2;
        radius = 10;
      };
    };
  };
}
