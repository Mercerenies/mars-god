
function DefaultSite() : Website() constructor {
  addChild(new _DefaultSite_Text(self));

  // owner will be a Firedog instance (the web browser WindowContents struct)
  static getOwner = function() {
    return _owner;
  }

  static setOwner = function(owner) {
    _owner = owner;
  }

}

function _DefaultSite_Text(owner) : MultilineTextArea() constructor {
  _owner = owner;
  setText("ERROR!\n\nThis website has been blocked by corporate policy for the following reason:\n\nExplicit content\n\nContact your IT department for more information.");

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

