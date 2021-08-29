
draw_self();

if (current_message != "") {
  var xx, yy;
  if (x > room_width / 2) {
    if (y > room_height / 2) {
      // LR
      draw_sprite_ext(spr_StapleyBox, 0, x - sprite_width / 2 - sprite_get_width(spr_StapleyBox), y, 1, -1, 0, c_white, 1);
      xx = x - sprite_width / 2 - sprite_get_width(spr_StapleyBox) + 16;
      yy = y - sprite_get_height(spr_StapleyBox) + 16;
    } else {
      // UR
      draw_sprite_ext(spr_StapleyBox, 0, x - sprite_width / 2 - sprite_get_width(spr_StapleyBox), y, 1, 1, 0, c_white, 1);
      xx = x - sprite_width / 2 - sprite_get_width(spr_StapleyBox) + 16;
      yy = y + 16;
    }
  } else {
    if (y > room_height / 2) {
      // LL
      draw_sprite_ext(spr_StapleyBox, 0, x + sprite_width / 2 + sprite_get_width(spr_StapleyBox), y, -1, -1, 0, c_white, 1);
      xx = x + sprite_width / 2 + 16;
      yy = y - sprite_get_height(spr_StapleyBox) + 16;
    } else {
      // UL
      draw_sprite_ext(spr_StapleyBox, 0, x + sprite_width / 2 + sprite_get_width(spr_StapleyBox), y, -1, 1, 0, c_white, 1);
      xx = x + sprite_width / 2 + 16;
      yy = y + 16;
    }
  }
  draw_set_font(fnt_Titlebar);
  draw_set_color(Colors.BLACK);
  draw_text_ext(xx, yy, current_message, -1, sprite_get_height(spr_StapleyBox) - 16);
}
