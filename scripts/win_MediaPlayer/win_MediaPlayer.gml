
function MediaPlayer() : WindowContents() constructor {
  _file_name = new _MediaPlayer_FileNameBox(self);
  _open_button = new _MediaPlayer_OpenButton(self);
  _play_button = new _MediaPlayer_PlayButton(self);
  _image = noone;
  _audio = noone;

  addChild(_file_name);
  addChild(_open_button);
  addChild(_play_button);

  static windowTitle = function() {
    return "Media Player";
  }

  static desiredWidth = function() {
    return 420;
  }

  static desiredHeight = function() {
    return 250;
  }

  static iconIndex = function() {
    return Icon.Pictures;
  }

  static windowId = function() {
    return "MediaPlayer";
  }

  // Should be a MediaFile
  static openFile = function(file) {
    _file_name.setText(file.getName());
    _image = file.getSprite();
    _audio = file.getSound();
  }

  static getAudio = function() {
    return _audio;
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

function MediaPlayerEntry() : StartMenuEntry() constructor {

  static getIcon = function() {
    return Icon.Music;
  }

  static getName = function() {
    return "Media Player";
  }

  static onClick = function() {
    Windows.addOrFindWindow(new MediaPlayer(), 200, 82, -1, -1);
  }

}

function _MediaPlayer_FileNameBox(owner) : Textbox() constructor {
  _owner = owner;

  static xPos = function() {
    return _owner.getOwner().x + 8;
  }

  static yPos = function() {
    return _owner.getOwner().y + sprite_get_height(spr_TitlebarActive) + 8;
  }

  static getWidth = function() {
    return 352;
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

function _MediaPlayer_OpenButton(owner) : SpriteButton() constructor {
  _owner = owner;

  static getSprite = function() {
    return spr_ButtonOpen;
  }

  static xPos = function() {
    return _owner.getOwner().x + 364;
  }

  static yPos = function() {
    return _owner.getOwner().y + sprite_get_height(spr_TitlebarActive) + 8;
  }

  static onClick = function() {
    var mgr = Windows.addOrFindWindow(new FileManager(), 128, 104, -1, -1);
    mgr.window_body.navigateToFolder(new Music());
  }

}

function _MediaPlayer_PlayButton(owner) : SpriteButton() constructor {
  _owner = owner;

  static getSprite = function() {
    return spr_ButtonPlay;
  }

  static xPos = function() {
    return _owner.getOwner().x + 392;
  }

  static yPos = function() {
    return _owner.getOwner().y + sprite_get_height(spr_TitlebarActive) + 8;
  }

  static onClick = function() {
    var file = _owner.getAudio();
    if (audio_exists(file)) {
      audio_play_sound(file, 0, false);
    } else {
      /////
    }
  }

}
