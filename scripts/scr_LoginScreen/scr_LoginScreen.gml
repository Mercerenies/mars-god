
// Start menu entry for shutdown screen
function LogoutEntry() : StartMenuEntry() constructor {

  static getIcon = function() {
    return Icon.Logout;
  }

  static getName = function() {
    return "Logout";
  }

  static onClick = function() {
    var override = instance_create_layer(0, 0, "Instances_Override", obj_LoginScreen);
    ctrl_WindowManager.setOverride(override);
  }

}

function _LoginScreen_Username() : Textbox() constructor {

  static xPos = function() {
    return ScreenRegion.LEFT + 128;
  }

  static yPos = function() {
    return ScreenRegion.TOP + 128;
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

  setText("Mars");
}

function _LoginScreen_Password() : PasswordBox() constructor {

  static xPos = function() {
    return ScreenRegion.LEFT + 128;
  }

  static yPos = function() {
    return ScreenRegion.TOP + 158;
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

function _LoginScreen_LoginButton() : SpriteButton() constructor {

  static getSprite = function() {
    return spr_ButtonLogin;
  }

  static xPos = function() {
    return ScreenRegion.LEFT + 278;
  }

  static yPos = function() {
    return ScreenRegion.TOP + 188;
  }

  static onClick = function() {
    obj_LoginScreen.doLogin();
  }

}

function _LoginScreen_ShutdownButton() : SpriteButton() constructor {

  static getSprite = function() {
    return spr_ButtonShutdown;
  }

  static xPos = function() {
    return ScreenRegion.RIGHT - 32;
  }

  static yPos = function() {
    return ScreenRegion.BOTTOM - 32;
  }

  static onClick = function() {
    var override = instance_create_layer(0, 0, "Instances_Override", obj_ShutdownScreen);
    ctrl_WindowManager.setOverride(override);
    instance_destroy(obj_LoginScreen);
  }

}

function _LoginScreen_ErrorBox() : MultilineTextArea() constructor {
  setText("");

  static xPos = function() {
    return ScreenRegion.LEFT + 128;
  }

  static yPos = function() {
    return ScreenRegion.TOP + 218;
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
