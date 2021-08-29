
function MacrosoftExceed() : WindowContents() constructor {
  _had_focus = false;
  _current_cell = "";

  static windowTitle = function() {
    return "Macrosoft Exceed";
  }

  static _hasFocus = function() {
    return ctrl_WindowManager.isActiveWindow(getOwner());
  }

  static desiredWidth = function() {
    return 420;
  }

  static desiredHeight = function() {
    return 250;
  }

  static iconIndex = function() {
    return Icon.Exceed;
  }

  static windowId = function() {
    return "MacrosoftExceed";
  }

  static draw = function() {
    var x1 = getOwner().x + 8;
    var y1 = getOwner().y + sprite_get_height(spr_TitlebarActive) + 8;
    var x2 = x1 + desiredWidth() - 16;
    var y2 = y1 + desiredHeight() - 16;

    var xcenter = mean(x1, x2);

    draw_set_font(fnt_Titlebar);

    draw_set_color(Colors.WHITE);
    draw_rectangle(x1, y1, x2, y2, false);
    Util.drawSunkenBox(x1, y1, x2, y2);

    var t = _current_cell;
    t = Util.truncateText(t, x2 - xcenter - 4);

    draw_set_color(Colors.BLACK);
    draw_line(xcenter, y1, xcenter, y2);
    draw_text(xcenter + 2, y1 + 2, t);

    // Caret
    if ((_hasFocus()) && (ctrl_Screen.showCarets())) {
      var caret_x = xcenter + 2 + string_width(_current_cell);
      if (caret_x < x2) {
        draw_line(caret_x, y1 + 2, caret_x, y1 + 2 + string_height("M"));
      }
    }

  }

  static step = function() {
    var focus = _hasFocus();
    if (focus) {
      if (!_had_focus) {
        // Rising edge
        ctrl_Screen.resetCaretTick();
        keyboard_string = _current_cell;
      }
      _current_cell = keyboard_string;
    }
    _had_focus = focus;
  }

}

function MacrosoftExceedEntry() : StartMenuEntry() constructor {

  static getIcon = function() {
    return Icon.Exceed;
  }

  static getName = function() {
    return "Macrosoft Exceed";
  }

  static onClick = function() {
    Windows.addOrFindWindow(new MacrosoftExceed(), 130, 150, -1, -1);
  }

}
