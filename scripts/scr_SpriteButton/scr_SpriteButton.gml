
function SpriteButton() : Button() constructor {

  static getSprite = function() {
    return spr_Null;
  }

  static draw = function() {
    draw_sprite(getSprite(), (isClicking() ? 1 : 0), xPos(), yPos());
  }

  static getWidth = function() {
    return sprite_get_width(getSprite());
  }

  static getHeight = function() {
    return sprite_get_height(getSprite());
  }

}
