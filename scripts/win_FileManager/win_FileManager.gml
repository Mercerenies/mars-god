
function FileManager() : WindowContents() constructor {
  _folder = new Documents();
  _folder_name = new _FileManager_FolderNameBox(self);
  _folder_nav = new _FileManager_FolderListbox(self);
  _file_nav = new _FileManager_FileListbox(self);

  addChild(_folder_name);
  addChild(_folder_nav);
  addChild(_file_nav);

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

  static getFolder = function() {
    return _folder;
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

function _FileManager_FolderListbox(owner) : Listbox() constructor {
  _owner = owner;
  _fields = [new Documents(), new Music(), new Pictures(), new Videos()];

  static xPos = function() {
    return _owner.getOwner().x + 8;
  }

  static yPos = function() {
    return _owner.getOwner().y + sprite_get_height(spr_TitlebarActive) + 32;
  }

  static getWidth = function() {
    return 112;
  }

  static getHeight = function() {
    return 160;
  }

  static getOwner = function() {
    return _owner;
  }

  static getTextField = function(idx) {
    return _fields[idx].getName();
  }

  static getTextFieldCount = function() {
    return array_length(_fields);
  }

  static onClick = function(idx) {
    _owner.navigateToFolder(_fields[idx]);
  }

}

function _FileManager_FileListbox(owner) : Listbox() constructor {
  _owner = owner;

  static xPos = function() {
    return _owner.getOwner().x + 128;
  }

  static yPos = function() {
    return _owner.getOwner().y + sprite_get_height(spr_TitlebarActive) + 32;
  }

  static getWidth = function() {
    return 352;
  }

  static getHeight = function() {
    return 160;
  }

  static getOwner = function() {
    return _owner;
  }

  static _getFolder = function() {
    return ctrl_FileSystem.getFiles(_owner.getFolder());
  }

  static getTextField = function(idx) {
    return _getFolder()[| idx].getFullDisplay();
  }

  static getTextFieldCount = function() {
    return ds_list_size(_getFolder());
  }

  static onClick = function(idx) {}

}
