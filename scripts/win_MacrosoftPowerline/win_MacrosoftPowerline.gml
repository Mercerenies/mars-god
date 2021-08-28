
function MacrosoftPowerline() : WindowContents() constructor {
  _file_name = new _MacrosoftPowerline_FileNameBox(self);
  _open_button = new _MacrosoftPowerline_OpenButton(self);
  _slides = noone;
  _slide_index = 0;

  addChild(_file_name);
  addChild(_open_button);

  static windowTitle = function() {
    return "Macrosoft Powerline";
  }

  static desiredWidth = function() {
    return 420;
  }

  static desiredHeight = function() {
    return 250;
  }

  static iconIndex = function() {
    return Icon.Powerline;
  }

  static windowId = function() {
    return "MacrosoftPowerline";
  }

  // Should be a SlideshowFile
  static openFile = function(file) {
    _file_name.setText(file.getName());
    _slides = file.getSprite();
    _slide_index = 0;
  }

  static mouseDown = function() {
    if (cursor_y() > getOwner().y + sprite_get_height(spr_TitlebarActive) + 36) {
      if (sprite_exists(_slides)) {
        _slide_index = min(_slide_index + 1, sprite_get_number(_slides) - 1);
      }
    }
  }

  static draw = function() {
    var xx = getOwner().x + 8;
    var yy = getOwner().y + sprite_get_height(spr_TitlebarActive) + 36;
    if (sprite_exists(_slides)) {
      draw_sprite(_slides, _slide_index, xx, yy);
    }
  }

}

function MacrosoftPowerlineEntry() : StartMenuEntry() constructor {

  static getIcon = function() {
    return Icon.Powerline;
  }

  static getName = function() {
    return "Macrosoft Powerline";
  }

  static onClick = function() {
    Windows.addOrFindWindow(new MacrosoftPowerline(), 156, 140, -1, -1);
  }

}

function _MacrosoftPowerline_FileNameBox(owner) : Textbox() constructor {
  _owner = owner;

  static xPos = function() {
    return _owner.getOwner().x + 8;
  }

  static yPos = function() {
    return _owner.getOwner().y + sprite_get_height(spr_TitlebarActive) + 8;
  }

  static getWidth = function() {
    return 380;
  }

  static getHeight = function() {
    return 20;
  }

  static isEditable = function() {
    return false;
  }

  static getFont = function() {
    return fnt_Calculator;
  }

}

function _MacrosoftPowerline_OpenButton(owner) : SpriteButton() constructor {
  _owner = owner;

  static getSprite = function() {
    return spr_ButtonOpen;
  }

  static xPos = function() {
    return _owner.getOwner().x + 392;
  }

  static yPos = function() {
    return _owner.getOwner().y + sprite_get_height(spr_TitlebarActive) + 8;
  }

  static onClick = function() {
    var mgr = Windows.addOrFindWindow(new FileManager(), 128, 104, -1, -1);
    mgr.window_body.navigateToFolder(new Documents());
  }

}
