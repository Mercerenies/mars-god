
function StaticSite(t) : Website() constructor {
  addChild(new _StaticSite_Text(self, t));
}

function _StaticSite_Text(owner, t) : MultilineTextArea() constructor {
  _owner = owner;
  setText(t);

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
