
// owner should be an obj_DisplayedWindow instance
function MinButton(owner) : SpriteButton() constructor {
  _owner = owner;

  static getSprite = function() {
    return spr_ButtonMin;
  }

  static xPos = function() {
    var rhs = _owner.x + _owner.getTotalWidth();
    return rhs - 4 - getWidth() * 2;
  }

  static yPos = function() {
    return _owner.y + 2;
  }

  static onClick = function() {
    ctrl_WindowManager.minimize(_owner);
  }

}
