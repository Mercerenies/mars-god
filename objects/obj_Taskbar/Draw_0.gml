
draw_self();

var CELL_WIDTH = 128;

var xx = x + 4;
var yy = y + 4;
var windows = ctrl_WindowManager.original_order;
for (var index = 0; index < ds_list_size(windows); index++) {
  draw_set_font(fnt_Titlebar);

  var title = windows[| index].window_body.windowTitle();
  title = Util.truncateText(title, CELL_WIDTH - 4);

  Util.drawRaisedBox(xx, yy, xx + CELL_WIDTH, yy + 20);
  draw_set_color(Colors.BLACK);
  draw_text(xx + 2, yy + 2, title);
  xx += CELL_WIDTH + 8;

}