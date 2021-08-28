
function StartButton() : SpriteButton() constructor {

  static getSprite = function() {
    return spr_ButtonStart;
  }

  static xPos = function() {
    return obj_Taskbar.x + 2;
  }

  static yPos = function() {
    return obj_Taskbar.y + 2;
  }

  static onClick = function() {
    obj_StartMenu.setActive(true);
  }

}
