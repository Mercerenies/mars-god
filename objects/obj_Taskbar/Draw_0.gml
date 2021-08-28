
draw_self();

var cell_width = TASKBAR_CELL_WIDTH;
var cell_height = TASKBAR_CELL_HEIGHT;

var xx = x + 4;
var yy = y + 4;
var windows = ctrl_WindowManager.original_order;
for (var index = 0; index < ds_list_size(windows); index++) {
  draw_set_font(fnt_Titlebar);

  if (ctrl_WindowManager.isActiveWindow(windows[| index])) {
    draw_set_color(Colors.LIGHT_GRAY);
  } else {
    draw_set_color(Colors.GRAY);
  }
  draw_rectangle(xx, yy, xx + cell_width, yy + cell_height, false);

  var icon_index = windows[| index].window_body.iconIndex();
  draw_sprite(spr_Icon, icon_index, xx + 2, yy + 2);

  var room_for_title = cell_width - 4 - ICON_WIDTH;
  var title = windows[| index].window_body.windowTitle();
  title = Util.truncateText(title, room_for_title);

  if (ctrl_WindowManager.isActiveWindow(windows[| index])) {
    Util.drawSunkenBox(xx, yy, xx + cell_width, yy + cell_height);
  } else {
    Util.drawRaisedBox(xx, yy, xx + cell_width, yy + cell_height);
  }
  draw_set_color(Colors.BLACK);
  draw_text(xx + 2 + ICON_WIDTH, yy + 4, title);
  xx += cell_width + 8;

}