
function MessageBox() : WindowContents() constructor {
  _message = "";

  static getMessage = function() {
    return _message;
  }

  static setMessage = function(m) {
    _message = m;
  }

  static windowTitle = function() {
    return "Information";
  }

  static desiredWidth = function() {
    return 230;
  }

  static desiredHeight = function() {
    return 130;
  }

  static iconIndex = function() {
    return Icon.Message;
  }

  static windowId = function() {
    return "MessageBox";
  }

  static draw = function() {
    draw_set_font(fnt_Titlebar);
    draw_set_color(Colors.BLACK);
    draw_text_ext(getOwner().x + 8, getOwner().y + sprite_get_height(spr_TitlebarActive) + 8, getMessage(), -1, desiredWidth() - 16);
  }

}

function showMessageBox(message) {
  var box = Windows.addOrFindWindow(new MessageBox(), 160, 105, -1, -1);
  box.window_body.setMessage(message);
}
