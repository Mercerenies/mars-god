
function Textbox() constructor {
  _focused = false;
  _text = "";

  static mouseWithin = function() {
    return point_in_rectangle(cursor_x(), cursor_y(), xPos(), yPos(), xPos() + getWidth(), yPos() + getHeight());
  }

  static event = function(ev) {
    Events.callOn(self, ev);
  }

  static isFocused = function() {
    return _focused;
  }

  static step = function() {
    if (_focused) {
      _text = keyboard_string;
    }
  }

  static mouseDown = function() {
    if ((mouseWithin()) && (isEditable())) {
      _focused = true;
      ctrl_Screen.resetCaretTick();
      keyboard_string = _text;
    }
  }

  static gMouseDown = function() {
    _focused = false;
  }

  static gMouseUp = function() {
    if (mouseWithin()) {
      _focused = true;
      ctrl_Screen.resetCaretTick();
      keyboard_string = _text;
    } else {
      _focused = false;
    }
  }

  static gMouseUp = function() {}

  static draw = function() {
    var x1 = xPos();
    var y1 = yPos();
    var x2 = x1 + getWidth();
    var y2 = y1 + getHeight();
    draw_set_color(Colors.WHITE);
    draw_rectangle(x1, y1, x2, y2, false);
    Util.drawSunkenBox(x1, y1, x2, y2);

    draw_set_color(Colors.BLACK);
    draw_set_font(getFont());
    var t = getDisplayText();
    t = Util.truncateText(t, getWidth() - 4);
    draw_text(x1 + 2, y1 + 2, t);
    if (_focused && (t == getDisplayText()) && (ctrl_Screen.showCarets())) {
      var caret_x = x1 + 2 + string_width(t);
      if (caret_x < x2) {
        draw_line(caret_x, y1 + 2, caret_x, y1 + string_height("M"));
      }
    }

  }

  static isEditable = function() {
    return true;
  }

  static getFont = function() {
    return fnt_Titlebar;
  }

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
    return 20;
  }

  static getText = function() {
    return _text;
  }

  static setText = function(t) {
    _text = t;
    if (_focused) {
      keyboard_string = _text;
    }
  }

  static getDisplayText = function() {
    return _text;
  }

}
