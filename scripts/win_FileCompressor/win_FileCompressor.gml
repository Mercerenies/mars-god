
function FileCompressor() : WindowContents() constructor {
  _filename_box = new _FileCompressor_FileNameBox(self);
  _open_button = new _FileCompressor_OpenButton(self);
  _compress_button = new _FileCompressor_CompressButton(self);
  _target_file = undefined;

  addChild(_filename_box);
  addChild(_open_button);
  addChild(_compress_button);

  static windowTitle = function() {
    return "File Compressor";
  }

  static desiredWidth = function() {
    return 240;
  }

  static desiredHeight = function() {
    return 120;
  }

  static iconIndex = function() {
    return Icon.Zip;
  }

  static windowId = function() {
    return "FileCompressor";
  }

  static setFile = function(file) {
    _target_file = file;
    if (!is_undefined(file)) {
      _filename_box.setText(file.getName());
    } else {
      _filename_box.setText("");
    }
  }

  static getFile = function() {
    return _target_file;
  }

}

function FileCompressor_FileManager() : FileManager() constructor {

  static iconIndex = function() {
    return Icon.Zip;
  }

  static windowTitle = function() {
    return "Choose a File";
  }

  static windowId = function() {
    return "FileCompressor_FileManager";
  }

  static doOpenFile = function(file) {
    var mgr = Windows.addOrFindWindow(new FileCompressor(), 102, 160, -1, -1);
    mgr.window_body.setFile(file);
    ctrl_WindowManager.close(getOwner());
  }

}

function FileCompressorEntry() : StartMenuEntry() constructor {

  static getIcon = function() {
    return Icon.Zip;
  }

  static getName = function() {
    return "File Compressor";
  }

  static onClick = function() {
    Windows.addOrFindWindow(new FileCompressor(), 102, 160, -1, -1);
  }

}

function _FileCompressor_FileNameBox(owner) : Textbox() constructor {
  _owner = owner;

  static xPos = function() {
    return _owner.getOwner().x + 8;
  }

  static yPos = function() {
    return _owner.getOwner().y + sprite_get_height(spr_TitlebarActive) + 8;
  }

  static getWidth = function() {
    return 200;
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

function _FileCompressor_OpenButton(owner) : SpriteButton() constructor {
  _owner = owner;

  static getSprite = function() {
    return spr_ButtonOpen;
  }

  static xPos = function() {
    return _owner.getOwner().x + 216;
  }

  static yPos = function() {
    return _owner.getOwner().y + sprite_get_height(spr_TitlebarActive) + 8;
  }

  static onClick = function() {
    var mgr = Windows.addOrFindWindow(new FileCompressor_FileManager(), 120, 111, -1, -1);
    mgr.window_body.navigateToFolder(new Documents());
  }

}

function _FileCompressor_CompressButton(owner) : SpriteButton() constructor {
  _owner = owner;

  static getSprite = function() {
    return spr_ButtonCompress;
  }

  static xPos = function() {
    return _owner.getOwner().x + 8;
  }

  static yPos = function() {
    return _owner.getOwner().y + sprite_get_height(spr_TitlebarActive) + 32;
  }

  static onClick = function() {
    var file = _owner.getFile();
    if (is_undefined(file)) {
      showErrorBox("Please select a file to compress.");
    } else {
      showMessageBox("File successfully compressed!");
      _owner.setFile(undefined);
      file.compress();
    }
  }

}
