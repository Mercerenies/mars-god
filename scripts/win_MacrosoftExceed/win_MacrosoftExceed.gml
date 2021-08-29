
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

  static cellX = function(xx, yy) {
    if (xx > 0) {
      return getOwner().x + mean(8, desiredWidth() - 8);
    } else {
      return getOwner().x + 8;
    }
  }

  static cellY = function(xx, yy) {
    var y1 = getOwner().y + sprite_get_height(spr_TitlebarActive) + 8;
    return y1 + cellHeight() * yy;
  }

  static cellCount = function() {
    return 10;
  }

  static cellWidth = function() {
    return (desiredWidth() - 16) / 2;
  }

  static cellHeight = function() {
    return (desiredHeight() - 16) / cellCount();
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

    // Draw the cell lines
    draw_set_color(Colors.BLACK);
    draw_line(xcenter, y1, xcenter, y2);
    for (var ycell = 0; ycell < cellCount(); ycell++) {
      draw_line(x1, cellY(0, ycell), x2, cellY(0, ycell));
    }

    // User input box
    draw_text(xcenter + 2, y1 + 2, t);

    // Queued up entries on the left-hand side
    for (var ycell = 0; ycell < cellCount(); ycell++) {
      var localx = cellX(0, ycell);
      var localy = cellY(0, ycell);
      var text = ctrl_WordFeed.get(ycell);
      text = Util.truncateText(text, x2 - xcenter - 4);
      draw_text(localx + 2, localy + 2, text);
    }

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

      if (keyboard_check_released(vk_enter)) {
        _dataEntered();
      }

    }

    _had_focus = focus;
  }

  static _dataEntered = function() {
    var text = _current_cell;
    if (string_lower(text) == string_lower(ctrl_WordFeed.get(0))) {
      onSuccess();
      ctrl_WordFeed.pop();
    }
    _current_cell = "";
    keyboard_string = "";
  }

  static onSuccess = function() {
    ctrl_GameManager.data_entered += 1;
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
    if (ctrl_GameManager.themis_account_made) {
      Windows.addOrFindWindow(new MacrosoftExceed(), 130, 150, -1, -1);
    } else {
      showErrorBox("Error! Could not connect to the company database. Are you logged in?");
    }
  }

}
