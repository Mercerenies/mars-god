
function FileDecryptor() : WindowContents() constructor {
  _password_box = new _FileDecryptor_PasswordBox(self);
  _open_button = new _FileDecryptor_OpenButton(self);

  addChild(_password_box);
  addChild(_open_button);

  static windowTitle = function() {
    return "File is Encrypted!";
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
    return "FileDecryptor";
  }

}

function _FileDecryptor_PasswordBox(owner) : PasswordBox() constructor {
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

  static getFont = function() {
    return fnt_Calculator;
  }

}

function _FileDecryptor_OpenButton(owner) : SpriteButton() constructor {
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
    var text = _owner._password_box.getText();
    text = string_lower(text);
    var pwgood = (text == "green olives") || (text == "greenolives") || (text == "green olive") || (text == "greenolive");
    if (pwgood && ctrl_GameManager.can_see_password) {
      showMessageBox("File decrypted successfully!");
      ctrl_GameManager.decrypted = true;
      ctrl_WindowManager.close(_owner.getOwner());
    } else {
      showErrorBox("Invalid encryption password; file could not be decrypted.");
    }
  }

}
