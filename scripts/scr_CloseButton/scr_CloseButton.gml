
// owner should be an obj_DisplayedWindow instance
function CloseButton(owner) : SpriteButton() constructor {
  _owner = owner;

  static getSprite = function() {
    return spr_ButtonClose;
  }

  static xPos = function() {
    var rhs = _owner.x + _owner.getTotalWidth();
    return rhs - 2 - getWidth();
  }

  static yPos = function() {
    return _owner.y + 2;
  }

  static onClick = function() {
    ctrl_WindowManager.close(_owner);
  }

}
