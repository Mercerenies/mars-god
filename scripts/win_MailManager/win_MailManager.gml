
function MailManager() : WindowContents() constructor {
  _files = new _MailManager_FileListbox(self);

  addChild(_files);

  static windowTitle = function() {
    return "Mail";
  }

  static desiredWidth = function() {
    return 380;
  }

  static desiredHeight = function() {
    return 380;
  }

  static iconIndex = function() {
    return Icon.Mail;
  }

  static windowId = function() {
    return "MailManager";
  }

}

function MailViewer() : WindowContents() constructor {
  _opened_file = undefined;
  _text_area = new _MailViewer_Contents(self);
  _reply_button = new _MailViewer_ReplyButton(self);

  addChild(_text_area);
  addChild(_reply_button);

  static windowTitle = function() {
    if (is_undefined(_opened_file)) {
      return "Mail Viewer";
    } else {
      return _opened_file.getHeader();
    }
  }

  static iconIndex = function() {
    return Icon.Mail;
  }

  static windowId = function() {
    return "MailViewer";
  }

  static desiredWidth = function() {
    return 400;
  }

  static desiredHeight = function() {
    return 220;
  }

  // Should be a MailFile
  static openFile = function(file) {
    _opened_file = file;
    _text_area.setText(file.getContents());
  }

  static getFile = function() {
    return _opened_file;
  }

}

function MailComposer() : WindowContents() constructor {
  _opened_file = undefined;
  _send_button = new _MailComposer_SendButton(self);
  _text_field = new _MailComposer_Textbox(self);

  addChild(_send_button);
  addChild(_text_field);

  static windowTitle = function() {
    if (is_undefined(_opened_file)) {
      return "Replying to ???";
    } else {
      return "Replying to " + _opened_file.getHeader();
    }
  }

  static iconIndex = function() {
    return Icon.Mail;
  }

  static windowId = function() {
    return "MailComposer";
  }

  static desiredWidth = function() {
    return 400;
  }

  static desiredHeight = function() {
    return 220;
  }

  // Should be a MailFile
  static openFile = function(file) {
    _opened_file = file;
  }

  static getFile = function() {
    return _opened_file;
  }

}

function MailManagerEntry() : StartMenuEntry() constructor {

  static getIcon = function() {
    return Icon.Mail;
  }

  static getName = function() {
    return "Mail";
  }

  static onClick = function() {
    Windows.addOrFindWindow(new MailManager(), 208, 32, -1, -1);
  }

}

function _MailManager_FileListbox(owner) : Listbox() constructor {
  _owner = owner;

  static xPos = function() {
    return _owner.getOwner().x + 8;
  }

  static yPos = function() {
    return _owner.getOwner().y + sprite_get_height(spr_TitlebarActive) + 8;
  }

  static getWidth = function() {
    return 364;
  }

  static getHeight = function() {
    return 364;
  }

  static getOwner = function() {
    return _owner;
  }

  static _getFolder = function() {
    return ctrl_FileSystem.getFiles(new Mail());
  }

  static getTextField = function(idx) {
    var file = _getFolder()[| idx];
    if (!is_undefined(file[$ "getHeader"])) {
      return file.getHeader();
    } else {
      return "??? - ???";
    }
  }

  static getTextFieldCount = function() {
    return ds_list_size(_getFolder());
  }

  static onClick = function(idx) {
    _getFolder()[| idx].openFile();
  }

}

function _MailViewer_Contents(owner) : MultilineTextArea() constructor {
  _owner = owner;

  static xPos = function() {
    return _owner.getOwner().x + 8;
  }

  static yPos = function() {
    return _owner.getOwner().y + sprite_get_height(spr_TitlebarActive) + 36;
  }

  static getWidth = function() {
    return 384;
  }

  static getHeight = function() {
    return 176;
  }

}

function _MailViewer_ReplyButton(owner) : SpriteButton() constructor {
  _owner = owner;

  static getSprite = function() {
    return spr_ButtonReply;
  }

  static xPos = function() {
    return _owner.getOwner().x + 8;
  }

  static yPos = function() {
    return _owner.getOwner().y + sprite_get_height(spr_TitlebarActive) + 8;
  }

  static onClick = function() {
    var mgr = Windows.addOrFindWindow(new MailComposer(), 250, 108, -1, -1);
    mgr.window_body.openFile(_owner.getFile());
  }

}

function _MailComposer_Textbox(owner) : Textbox() constructor {
  _owner = owner;

  static xPos = function() {
    return _owner.getOwner().x + 8;
  }

  static yPos = function() {
    return _owner.getOwner().y + sprite_get_height(spr_TitlebarActive) + 36;
  }

  static getWidth = function() {
    return 384;
  }

  static getHeight = function() {
    return 176;
  }

  // TODO Max width so we don't notice the no-multiline thing (also other constraints just to be funny)

}

function _MailComposer_SendButton(owner) : SpriteButton() constructor {
  _owner = owner;

  static getSprite = function() {
    return spr_ButtonSend;
  }

  static xPos = function() {
    return _owner.getOwner().x + 8;
  }

  static yPos = function() {
    return _owner.getOwner().y + sprite_get_height(spr_TitlebarActive) + 8;
  }

  static onClick = function() {
    var file = _owner.getFile();
    file.onReply();
    ctrl_WindowManager.close(_owner.getOwner());
    showMessageBox("Reply sent!");
    ctrl_GameManager.replied = true;
  }

}
