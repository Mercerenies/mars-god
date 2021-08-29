
// Note: This class is abstract. It must be extended to be used.
function Listbox() constructor {

  static xPos = function() {
    return 0;
  }

  static yPos = function() {
    return 0;
  }

  static getWidth = function() {
    return 64;
  }

  static getHeight = function() {
    return 64;
  }

  static getFont = function() {
    return fnt_Titlebar;
  }

  static getOwner = function() {
    return undefined;
  }

  static getLineHeight = function() {
    draw_set_font(getFont());
    return string_height("M");
  }

  static cellWidth = function() {
    return getWidth() - 4;
  }

  static cellHeight = function() {
    return getLineHeight() + 2;
  }

  static cellCount = function() {
    var total_height = getHeight() - 4;
    return floor(total_height / cellHeight());
  }

  static getTextField = function(idx) {
    return "";
  }

  static getTextFieldCount = function() {
    return 0;
  }

  static onClick = function(idx) {}

  static cellX = function(idx) {
    return xPos() + 2;
  }

  static cellY = function(idx) {
    return yPos() + 2 + idx * cellHeight();
  }

  static event = function(ev) {
    Events.callOn(self, ev);
  }

  static doesDrawRect = function() {
    return true;
  }

  static highlightedCell = function() {
    if (!ctrl_WindowManager.isActiveWindow(getOwner().getOwner())) {
      return -1;
    }
    var cx = cursor_x();
    var cy = cursor_y();
    for (var idx = 0; idx < cellCount(); idx++) {
      if (point_in_rectangle(cx, cy, cellX(idx), cellY(idx), cellX(idx) + cellWidth(), cellY(idx) + cellHeight())) {
        return idx;
      }
    }
    return -1;
  }

  static mouseDown = function() {
    var highlighted = highlightedCell();
    if ((highlighted >= 0) && (highlighted < getTextFieldCount())) {
      onClick(highlighted);
    }
  }

  static draw = function() {

    var highlighted = highlightedCell();

    var x1 = xPos();
    var y1 = yPos();
    var x2 = x1 + getWidth();
    var y2 = y1 + getHeight();
    draw_set_color(Colors.WHITE);
    if (doesDrawRect()) {
      draw_rectangle(x1, y1, x2, y2, false);
      Util.drawSunkenBox(x1, y1, x2, y2);
    }

    var fields_to_show = min(getTextFieldCount(), cellCount());
    for (var idx = 0; idx < fields_to_show; idx++) {
      var xx = cellX(idx);
      var yy = cellY(idx);

      var fgcolor = Colors.BLACK;
      if (highlighted == idx) {
        fgcolor = Colors.WHITE;
        draw_set_color(Colors.BLUE);
        draw_rectangle(xx, yy, xx + cellWidth(), yy + cellHeight(), false);
      }

      var field = getTextField(idx);
      field = Util.truncateText(field, getWidth() - 4);
      draw_set_font(getFont());
      draw_set_color(fgcolor);
      draw_text(xx, yy, field);
    }

  }

}
