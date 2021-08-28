
function FileManager() : WindowContents() constructor {
  _folder = new Documents();
  _folder_name = new _FileManager_FolderNameBox(self);

  addChild(_folder_name);

  static windowTitle = function() {
    return _folder.getName();
  }

  static desiredWidth = function() {
    return 512;
  }

  static desiredHeight = function() {
    return 200;
  }

  static iconIndex = function() {
    return _folder.getIcon();
  }

  static windowId = function() {
    return "FileManager";
  }

  static navigateToFolder = function(folder) {
    _folder = folder;
    _folder_name.setText(folder.getName());
  }

  navigateToFolder(_folder);
}

function FileManagerEntry(folder) : StartMenuEntry() constructor {
  _folder = folder;

  static getIcon = function() {
    return _folder.getIcon();
  }

  static getName = function() {
    return _folder.getName();
  }

  static onClick = function() {
    var mgr = Windows.addOrFindWindow(new FileManager(), 96, 96, -1, -1);
    mgr.window_body.navigateToFolder(_folder);
  }

}

// TODO Other entries

function _FileManager_FolderNameBox(owner) : Textbox() constructor {
  _owner = owner;

  static xPos = function() {
    return _owner.getOwner().x + 8;
  }

  static yPos = function() {
    return _owner.getOwner().y + sprite_get_height(spr_TitlebarActive) + 8;
  }

  static getWidth = function() {
    return 480;
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
