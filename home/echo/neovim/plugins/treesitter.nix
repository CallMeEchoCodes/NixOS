{ ... }:
{
  programs.nixvim.plugins.treesitter = {
    enable = true;

    settings = {
      folding = true;
      indent.enable = true;
      highlight.enable = true;
    };
  };
}
