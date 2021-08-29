
function ExampleSite() : Website() constructor {
  addChild(new _ExampleSite_Text(self));

  // owner will be a Firedog instance (the web browser WindowContents struct)
  static getOwner = function() {
    return _owner;
  }

  static setOwner = function(owner) {
    _owner = owner;
  }

}

function _ExampleSite_Text(owner) : MultilineTextArea() constructor {
  _owner = owner;
  setText("Example page. Congratulations, you found it, I guess :)");

  static xPos = function() {
    return _owner.getOwner().contentX();
  }

  static yPos = function() {
    return _owner.getOwner().contentY();
  }

  static getWidth = function() {
    return WEBSITE_WIDTH;
  }

  static getHeight = function() {
    return WEBSITE_HEIGHT;
  }

  static doesDrawRect = function() {
    return false;
  }

}
