
function ThemisLaw() : Website() constructor {
  _username = new _ThemisLaw_Username(self);
  _password = new _ThemisLaw_Password(self);
  _password_confirm = new _ThemisLaw_PasswordConfirm(self);
  _login = new _ThemisLaw_LoginButton(self);
  _error_box = new _ThemisLaw_ErrorBox(self);

  addChild(_username);
  addChild(_password);
  addChild(_password_confirm);
  addChild(_login);
  addChild(_error_box);

  // owner will be a Firedog instance (the web browser WindowContents struct)
  static getOwner = function() {
    return _owner;
  }

  static setOwner = function(owner) {
    _owner = owner;
  }

  static onReady = function() {
    if (ctrl_GameManager.themis_account_made) {
      getOwner().openSite(ThemisLaw_Success());
    }
  }

  static doLogin = function() {
    var pw = _password.getText();
    var pw1 = _password_confirm.getText();
    if (pw != pw1) {
      _error_box.setText("Error! Password and confirmation field do not match! Please enter the same password into both fields.");
    } else if (string_pos("password", string_lower(pw)) > 0) {
      _error_box.setText("Error! Password cannot contain the word 'password'!");
    } else if (string_pos(" ", string_lower(pw)) > 0) {
      _error_box.setText("Error! Password cannot contain spaces!");
    } else if (string_pos("_", string_lower(pw)) <= 0) {
      _error_box.setText("Error! Password must contain an underscore!");
    } else if (string_lower(pw) == pw) {
      _error_box.setText("Error! Password must contain a capital letter!");
    } else if (string_upper(pw) == pw) {
      _error_box.setText("Error! Password must contain a lowercase letter!");
    } else if (string_length(string_digits(pw)) < 1) {
      _error_box.setText("Error! Password must contain a number!");
    } else if (string_length(string_digits(pw)) < 2) {
      _error_box.setText("Error! Password must contain at least two numbers!");
    } else if (string_length(string_digits(pw)) < 3) {
      _error_box.setText("Error! Password must contain at least three numbers!");
    } else if (string_length(string_digits(pw)) < 4) {
      _error_box.setText("Error! Password must contain at least four numbers!");
    } else if (string_length(string_digits(pw)) > 4) {
      _error_box.setText("Error! Password must contain no more than four numbers!");
    } else {
      if (is_undefined(ctrl_GameManager.bad_password_char)) {
        ctrl_GameManager.bad_password_char = string_copy(pw, string_length(pw), 1);
      }
      if (ctrl_GameManager.bad_password_char == string_copy(pw, string_length(pw), 1)) {
        _error_box.setText("Error! Password must not end in '" + ctrl_GameManager.bad_password_char + "'");
      } else {
        // Good password
        ctrl_GameManager.themis_account_made = true;
        getOwner().openSite(ThemisLaw_Success());
      }
    }
  }

}

function ThemisLaw_Success() {
  return new StaticSite("Welcome to Themis Law!\n\nWe're ecstatic to have you on our team.\n\nRemember, your office is your family.");
}

function _ThemisLaw_Username(owner) : Textbox() constructor {
  _owner = owner;

  static xPos = function() {
    return _owner.getOwner().contentX() + 32;
  }

  static yPos = function() {
    return _owner.getOwner().contentY() + sprite_get_height(spr_TitlebarActive) + 32;
  }

  static getWidth = function() {
    return 380;
  }

  static getHeight = function() {
    return 20;
  }

  static getFont = function() {
    return fnt_Calculator;
  }

  static isEditable = function() {
    return false;
  }

  setText("Mars");
}

function _ThemisLaw_Password(owner) : PasswordBox() constructor {
  _owner = owner;

  static xPos = function() {
    return _owner.getOwner().contentX() + 32;
  }

  static yPos = function() {
    return _owner.getOwner().contentY() + sprite_get_height(spr_TitlebarActive) + 62;
  }

  static getWidth = function() {
    return 380;
  }

  static getHeight = function() {
    return 20;
  }

  static getFont = function() {
    return fnt_Calculator;
  }

}

function _ThemisLaw_PasswordConfirm(owner) : PasswordBox() constructor {
  _owner = owner;

  static xPos = function() {
    return _owner.getOwner().contentX() + 32;
  }

  static yPos = function() {
    return _owner.getOwner().contentY() + sprite_get_height(spr_TitlebarActive) + 92;
  }

  static getWidth = function() {
    return 380;
  }

  static getHeight = function() {
    return 20;
  }

  static getFont = function() {
    return fnt_Calculator;
  }

}

function _ThemisLaw_LoginButton(owner) : SpriteButton() constructor {
  _owner = owner;

  static getSprite = function() {
    return spr_ButtonLogin;
  }

  static xPos = function() {
    return _owner.getOwner().contentX() + 32;
  }

  static yPos = function() {
    return _owner.getOwner().contentY() + sprite_get_height(spr_TitlebarActive) + 122;
  }

  static onClick = function() {
    _owner.doLogin();
  }

}

function _ThemisLaw_ErrorBox(owner) : MultilineTextArea() constructor {
  _owner = owner;

  setText("Enter and confirm your password to continue.");

  static xPos = function() {
    return _owner.getOwner().contentX() + 32;
  }

  static yPos = function() {
    return _owner.getOwner().contentY() + sprite_get_height(spr_TitlebarActive) + 152;
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
