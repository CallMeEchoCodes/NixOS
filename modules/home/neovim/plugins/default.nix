{ ... }:
{
  imports = [
    ./lsp.nix
    ./treesitter.nix
  ];
  programs.nixvim = {
    plugins.noice.enable = true;
    plugins.neo-tree = {
      enable = true;
    };
   plugins.web-devicons.enable = true;

    keymaps = [
      {
        key = "\\";
        action = "<cmd>Neotree reveal<cr>";
        options = {
          desc = "NeoTree reveal";
        };
      }
    ];
  };
}
