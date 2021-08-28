
function Button() constructor {
  _clicking = false;

  static mouseWithin = function() {
    return point_in_rectangle(cursor_x(), cursor_y(), xPos(), yPos(), xPos() + getWidth(), yPos() + getHeight());
  }

  event = function(ev) {
    Events.callOn(self, ev);
  }

  static gMouseDown = function() {
    if (mouseWithin()) {
      _clicking = true;
    }
  }

  static gMouseUp = function() {
    if (_clicking && mouseWithin()) {
      onClick();
    }
    _clicking = false;
  }

  static draw = function() {}

  static isClicking = function() {
    return _clicking;
  }

  static xPos = function() {
    return 0;
  }

  static yPos = function() {
    return 0;
  }

  static getWidth = function() {
    return 0;
  }

  static getHeight = function() {
    return 0;
  }

  static onClick = function() {}

}
