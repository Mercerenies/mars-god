
function RomanGods() : Website() constructor {
  addChild(new _RomanGods_HeaderBox(self));
  addChild(new _RomanGods_Listbox(self));
  addChild(new _RomanGods_Password(self));

  static onReady = function() {
    if (!ctrl_GameManager.can_visit_gods) {
      getOwner().openSite(new DefaultSite());
    } else {
      switch (ctrl_GameManager.tried_to_visit_gods++) {
      case 0:
        getOwner().openSite(new StaticSite("ERROR!\n\nThis website has been marked as insecure and blocked to protect your computer.\n\nDo NOT attempt to visit this site again."));
        break;
      case 1:
        getOwner().openSite(new StaticSite("Seriously! This site is dangerous!"));
        break;
      case 2:
        getOwner().openSite(new StaticSite("Turn back now!"));
        break;
      case 3:
        getOwner().openSite(new StaticSite("You're not listening, are you?"));
        break;
      case 4:
        getOwner().openSite(new StaticSite("The IT department will be notified of your noncompliance."));
        break;
      default:
        if (ctrl_GameManager.logged_in_to_gods) {
          getOwner().openSite(new RomanGods_Gods());
        }
        break;
      }
    }
  }

  static doClick = function(idx) {
    switch (idx) {
    case 0:
      // Login
      if (!ctrl_GameManager.on_waitlist) {
        showMessageBox("Due to high traffic, we cannot process your request. You've been added to the waitlist.");
        ctrl_GameManager.on_waitlist = true;
      } else if (!ctrl_GameManager.past_waitlist) {
        var position = irandom_range(3, 19732);
        showMessageBox("You are in position " + string(position) + " on the login waitlist. Please be patient.");
      } else {
        getOwner().openSite(new RomanGods_Login());
      }
      break;
    case 1:
      // Research gods
      showErrorBox("Error! You need to be logged in to do that!");
      break;
    case 2:
      // Download file
      showMessageBox("Really important file downloaded successfully. Check your Music folder.");
      if (is_undefined(ctrl_FileSystem.findFileByName(new Music(), "Message from Minerva.ogg"))) {
        ctrl_FileSystem.addFile(new Music(), new EncryptedFile(new MediaFile("Message from Minerva.ogg", 40, noone))); // TODO
      }
      ctrl_GameManager.got_gods_file = true;
      break;
    }
  }

}

function _RomanGods_HeaderBox(owner) : MultilineTextArea() constructor {
  _owner = owner;

  setText("Welcome to RomanGods.com! What would you like to do?");

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

function _RomanGods_Listbox(owner) : Listbox() constructor {
  _owner = owner;

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

  static getOwner = function() {
    return _owner.getOwner();
  }

  static doesDrawRect = function() {
    return false;
  }

  static getTextField = function(idx) {
    switch (idx) {
    case 0:
      return "Login";
    case 1:
      return "Research Gods";
    case 2:
      return "Download Really Important File";
    }
  }

  static getTextFieldCount = function() {
    return 3;
  }

  static onClick = function(idx) {
    _owner.doClick(idx);
  }

}

function _RomanGods_Password(owner) : MultilineTextArea() constructor {
  _owner = owner;

  setText("Encryption password: 'green olives'");

  static xPos = function() {
    return _owner.getOwner().contentX() + WEBSITE_WIDTH - 128;
  }

  static yPos = function() {
    return _owner.getOwner().contentY() + WEBSITE_HEIGHT - 48;
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

  static _parent_draw = draw;

  static draw = function() {
    if (ctrl_GameManager.can_see_password) {
      _parent_draw();
    }
  }

  static getFont = function() {
    return fnt_Footnote;
  }

}
