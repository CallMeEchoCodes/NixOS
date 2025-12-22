{ inputs, ... }:
{
  imports = [
    inputs.nixvim.homeModules.nixvim
    ./plugins
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    viAlias = true;
    vimAlias = true;

    colorschemes.catppuccin = {
      enable = true;
      settings = {
        flavour = "mocha";
        integrations = {
          treesitter = true;
          neotree = true;
        };
      };
    };

    plugins = {
      lsp = {
        enable = true;
        servers = {
          nixd = {
            enable = true;
          };
        };
      };
    };
  };
}
