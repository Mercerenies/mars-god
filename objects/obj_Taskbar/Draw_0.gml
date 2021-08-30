
if (disabled) {
  exit;
}

draw_self();

var cell_width = currentCellWidth();
var cell_height = TASKBAR_CELL_HEIGHT;

var windows = ctrl_WindowManager.original_order;
for (var index = 0; index < ds_list_size(windows); index++) {
  draw_set_font(fnt_Titlebar);

  var x1 = cellStartX(index);
  var y1 = cellStartY(index);
  var x2 = cellEndX(index);
  var y2 = cellEndY(index);

  if (ctrl_WindowManager.isActiveWindow(windows[| index])) {
    draw_set_color(Colors.LIGHT_GRAY);
  } else {
    draw_set_color(Colors.GRAY);
  }
  draw_rectangle(x1, y1, x2, y2, false);

  var icon_index = windows[| index].window_body.iconIndex();
  if (cell_width > ICON_WIDTH + 6) {
    draw_sprite(spr_Icon, icon_index, x1 + 2, y1 + 2);
  }

  var room_for_title = cell_width - 4 - ICON_WIDTH;
  var title = windows[| index].window_body.windowTitle();
  title = Util.truncateText(title, room_for_title);

  if (ctrl_WindowManager.isActiveWindow(windows[| index])) {
    Util.drawSunkenBox(x1, y1, x2, y2);
  } else {
    Util.drawRaisedBox(x1, y1, x2, y2);
  }
  draw_set_color(Colors.BLACK);
  if (title != "...") {
    draw_text(x1 + 2 + ICON_WIDTH, y1 + 4, title);
  }

}

start_button.event("draw");
