
function MacrosoftLetter() : WindowContents() constructor {
  _file_name = new _MacrosoftLetter_FileNameBox(self);
  _open_button = new _MacrosoftLetter_OpenButton(self);
  _text_area = new _MacrosoftLetter_Contents(self);

  addChild(_file_name);
  addChild(_open_button);
  addChild(_text_area);

  static windowTitle = function() {
    return "Macrosoft Letter";
  }

  static desiredWidth = function() {
    return 420;
  }

  static desiredHeight = function() {
    return 250;
  }

  static iconIndex = function() {
    return Icon.Letter;
  }

  static windowId = function() {
    return "MacrosoftLetter";
  }

  // Should be a TextFile
  static openFile = function(file) {
    _file_name.setText(file.getName());
    _text_area.setText(file.getContents());
  }

}

function MacrosoftLetterEntry() : StartMenuEntry() constructor {

  static getIcon = function() {
    return Icon.Letter;
  }

  static getName = function() {
    return "Macrosoft Letter";
  }

  static onClick = function() {
    Windows.addOrFindWindow(new MacrosoftLetter(), 128, 128, -1, -1);
  }

}

function _MacrosoftLetter_FileNameBox(owner) : Textbox() constructor {
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

function _MacrosoftLetter_OpenButton(owner) : SpriteButton() constructor {
  _owner = owner;

  static getSprite = function() {
    return spr_ButtonOpen;
  }

  static xPos = function() {
    return _owner.getOwner().x + 392;
  }

  static yPos = function() {
    return _owner.getOwner().y + sprite_get_height(spr_TitlebarActive) + 8;
  }

  static onClick = function() {
    var mgr = Windows.addOrFindWindow(new FileManager(), 128, 104, -1, -1);
    mgr.window_body.navigateToFolder(new Documents());
  }

}

function _MacrosoftLetter_Contents(owner) : MultilineTextArea() constructor {
  _owner = owner;

  static xPos = function() {
    return _owner.getOwner().x + 8;
  }

  static yPos = function() {
    return _owner.getOwner().y + sprite_get_height(spr_TitlebarActive) + 36;
  }

  static getWidth = function() {
    return 404;
  }

  static getHeight = function() {
    return 210;
  }

}
