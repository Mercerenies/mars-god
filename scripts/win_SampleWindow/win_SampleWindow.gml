
// Parent class for window objects
function SampleWindow(title) : WindowContents() constructor {
  _title = title;
  _textbox = new _SampleWindow_Textbox1(self);

  static windowTitle = function() {
    return _title;
  }

  static desiredWidth = function() {
    return 240;
  }

  static desiredHeight = function() {
    return 120;
  }

  static iconIndex = function() {
    return Icon.Sample;
  }

  static step = function() {
    _textbox.step();
  }

  static draw = function() {
    _textbox.draw();
  }

  static mouseDown = function() {
    _textbox.mouseDown();
  }

  static gMouseDown = function() {
    _textbox.gMouseDown();
  }

  static gMouseUp = function() {
    _textbox.gMouseUp();
  }

}

function _SampleWindow_Textbox1(owner) : Textbox() constructor {
  _owner = owner;

  static xPos = function() {
    return _owner.getOwner().x + 32;
  }

  static yPos = function() {
    return _owner.getOwner().y + 32;
  }

  static getWidth = function() {
    return 128;
  }

}

function _SampleWindow_Textbox2(owner) : PasswordBox() constructor {
  _owner = owner;

  static xPos = function() {
    return _owner.getOwner().x + 32;
  }

  static yPos = function() {
    return _owner.getOwner().y + 64;
  }

  static getWidth = function() {
    return 128;
  }

}
