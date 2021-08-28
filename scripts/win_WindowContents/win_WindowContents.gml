
// Parent class for window objects
function WindowContents() constructor {
  _owner = undefined;

  static windowTitle = function() {
    return "";
  }

  static desiredWidth = function() {
    return 128;
  }

  static desiredHeight = function() {
    return 128;
  }

  static iconIndex = function() {
    return Icon.Null;
  }

  static step = function() {
    _textbox.step();
  }

  static draw = function() {}

  static getOwner = function() {
    return _owner;
  }

  static setOwner = function(owner) {
    _owner = owner;
  }

  static mouseDown = function() {}

  static gMouseDown = function() {}

  static gMouseUp = function() {}

}

// TODO Set up a proper forwarding interface for controls tomorrow, so
// we aren't explicitly delegating the whole universe (/////)
