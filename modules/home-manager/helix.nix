{ config, pkgs, ... }:

{
  programs.helix = {
    enable = true; 
    themes = {
      gruvbox = {
        "inherits" = "gruvbox_dark_hard";
        "ui.background" = {};
      };
    };

    settings = {
      theme = "gruvbox";
      editor.cursor-shape = {
        insert = "bar";
      };
    };

    languages = {
      language-server = {

        # python LSP
        pylsp = with pkgs.python312Packages; {
          command = "${python-lsp-server}/bin/pylsp";
        };

        # python linter
        ruff.command = "${pkgs.ruff}/bin/ruff";
        ruff.args = ["server"];

        # rust LSP + linter
        rust-analyzer = {
          command = "${pkgs.rust-analyzer}/bin/rust-analyzer";
        };
      };

      language = [
        {
          name = "nix";
          auto-format = true;
          formatter.command = "${pkgs.nixfmt}/bin/nixfmt";
        }

        {
          name = "python";
          language-servers = ["pylsp" "ruff"];
        }

        {
          name = "rust";
          language-servers = ["rust-analyzer"];
        }
      ];
    };
  };
}
