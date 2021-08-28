
function MultilineTextArea() constructor {
  _text = "";

  static getText = function() {
    return _text;
  }

  static setText = function(t) {
    _text = t;
  }

  static event = function(ev) {
    Events.callOn(self, ev);
  }

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
    var t = getText();
    draw_text_ext(x1 + 2, y1 + 2, t, -1, getWidth() - 4);

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

  static getFont = function() {
    return fnt_Titlebar;
  }

}
