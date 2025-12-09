{ ... }:
{
  programs.kitty = {
    enable = true;

    settings = {
      font_size = 11.5;
      mouse_hide_wait = -3;
      notify_on_cmd_finish = "invisible 20";
      window_padding_width = 16;
    };
  };
}
