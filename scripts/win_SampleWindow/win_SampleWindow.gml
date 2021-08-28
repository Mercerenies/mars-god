
// Parent class for window objects
function SampleWindow(title) : WindowContents() constructor {
  _title = title;
  _textbox = new _SampleWindow_Textbox1(self);
  _pwbox = new _SampleWindow_Textbox2(self);

  addChild(_textbox);
  addChild(_pwbox);

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

  static windowId = function() {
    return "SampleWindow";
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
