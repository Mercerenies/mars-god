
function RomanGods_Login() : Website() constructor {
  addChild(new _RomanGods_Login_HeaderBox(self));
  addChild(new _RomanGods_Login_OpenButton(self));
}

function _RomanGods_Login_HeaderBox(owner) : MultilineTextArea() constructor {
  _owner = owner;

  setText("To complete your login, please upload a photograph of yourself.");

  static xPos = function() {
    return _owner.getOwner().contentX() + 32;
  }

  static yPos = function() {
    return _owner.getOwner().contentY() + sprite_get_height(spr_TitlebarActive) + 8;
  }

  static getWidth = function() {
    return 380;
  }

  static getHeight = function() {
    return 80;
  }

  static doesDrawRect = function() {
    return false;
  }

}

function RomanGods_Login_FileManager() : FileManager() constructor {

  static iconIndex = function() {
    return Icon.Camera;
  }

  static windowTitle = function() {
    return "Choose a File";
  }

  static windowId = function() {
    return "RomanGods_Login_FileManager";
  }

  static doOpenFile = function(file) {
    ctrl_WindowManager.close(getOwner());
    if (file.getBaseName() != "Photograph.jpg") {
      showErrorBox("That is not a picture of you.");
    } else if (file.getCompressionCount() == 0) {
      showErrorBox("That file is too large. Consider compressing it.");
    } else if (file.getCompressionCount() == 1) {
      showErrorBox("That file is still too large. Consider compressing it.");
    } else {
      ctrl_GameManager.logged_in_to_gods = true;
      var mgr = Windows.addOrFindWindow(new Firedog(), 130, 104, -1, -1);
      mgr.window_body.openSite(new RomanGods_Gods());
    }
  }

}

function _RomanGods_Login_OpenButton(owner) : SpriteButton() constructor {
  _owner = owner;

  static getSprite = function() {
    return spr_ButtonOpen;
  }

  static xPos = function() {
    return _owner.getOwner().contentX() + 8;
  }

  static yPos = function() {
    return _owner.getOwner().contentY() + sprite_get_height(spr_TitlebarActive) + 48;
  }

  static getWidth = function() {
    return 300;
  }

  static getHeight = function() {
    return 200;
  }

  static getTextFieldCount = function() {
    return 3;
  }

  static onClick = function(idx) {
    _owner.doClick(idx);
  }

  static onClick = function() {
    var mgr = Windows.addOrFindWindow(new RomanGods_Login_FileManager(), 120, 111, -1, -1);
    mgr.window_body.navigateToFolder(new Pictures());
  }

}
