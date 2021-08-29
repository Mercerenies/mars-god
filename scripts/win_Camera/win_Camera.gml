
function Camera() : WindowContents() constructor {
  _file_name = new _Camera_FileNameBox(self);
  _snap_button = new _Camera_SnapButton(self);
  _image = noone;

  addChild(_file_name);
  addChild(_snap_button);

  static windowTitle = function() {
    return "Camera";
  }

  static desiredWidth = function() {
    return 420;
  }

  static desiredHeight = function() {
    return 250;
  }

  static iconIndex = function() {
    return Icon.Camera;
  }

  static windowId = function() {
    return "Camera";
  }

  // Should be an ImageFile
  static openFile = function(file) {
    _file_name.setText(file.getName());
    _image = file.getSprite();
  }

  static draw = function() {
    var x1 = getOwner().x + 8;
    var y1 = getOwner().y + sprite_get_height(spr_TitlebarActive) + 36;
    var x2 = x1 + 404;
    var y2 = y1 + 210;
    if (sprite_exists(_image)) {
      var xx = (x2 + x1 - sprite_get_width(_image)) / 2;
      var yy = (y2 + y1 - sprite_get_height(_image)) / 2;
      draw_sprite(_image, 0, xx, yy);
    }
  }

}

function CameraEntry() : StartMenuEntry() constructor {

  static getIcon = function() {
    return Icon.Camera;
  }

  static getName = function() {
    return "Camera";
  }

  static onClick = function() {
    Windows.addOrFindWindow(new Camera(), 201, 96, -1, -1);
  }

}

function _Camera_FileNameBox(owner) : Textbox() constructor {
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

function _Camera_SnapButton(owner) : SpriteButton() constructor {
  _owner = owner;

  static getSprite = function() {
    return spr_ButtonCamera;
  }

  static xPos = function() {
    return _owner.getOwner().x + 392;
  }

  static yPos = function() {
    return _owner.getOwner().y + sprite_get_height(spr_TitlebarActive) + 8;
  }

  static onClick = function() {
    var file = ctrl_FileSystem.findFileByName(new Pictures(), "Photograph.jpg");
    if (is_undefined(file)) {
      file = new ImageFile("Photograph.jpg", 7, spr_Image_Selfie);
      ctrl_FileSystem.addFile(new Pictures(), file);
    }
    _owner.openFile(file);
  }

}
