
function InstantMessenger() : WindowContents() constructor {
  _recipients = new _InstantMessenger_ChatListbox(self);

  addChild(_recipients);

  static windowTitle = function() {
    return "Instant Messenger";
  }

  static desiredWidth = function() {
    return 220;
  }

  static desiredHeight = function() {
    return 220;
  }

  static iconIndex = function() {
    return Icon.Chat;
  }

  static windowId = function() {
    return "InstantMessenger";
  }

}

function InstantMessengerChat() : WindowContents() constructor {
  _person = undefined;
  _history_box = new _InstantMessengerChat_HistoryListbox(self);
  _reply_box = new _InstantMessengerChat_ReplyBox(self);
  _reply_button = new _InstantMessengerChat_ReplyButton(self);

  addChild(_history_box);
  addChild(_reply_box);
  addChild(_reply_button);

  static windowTitle = function() {
    if (is_undefined(_person)) {
      return "Instant Messenger";
    } else {
      return "Chatting with " + _person;
    }
  }

  static iconIndex = function() {
    return Icon.Chat;
  }

  static windowId = function() {
    return "InstantMessengerChat";
  }

  static desiredWidth = function() {
    return 400;
  }

  static desiredHeight = function() {
    return 290;
  }

  static setPerson = function(p) {
    _person = p;
  }

  static getPerson = function() {
    return _person;
  }

  static getReplyBox = function() {
    return _reply_box;
  }

}

function InstantMessengerEntry() : StartMenuEntry() constructor {

  static getIcon = function() {
    return Icon.Chat;
  }

  static getName = function() {
    return "Instant Messenger";
  }

  static onClick = function() {
    Windows.addOrFindWindow(new InstantMessenger(), 120, 16, -1, -1);
  }

}

function _InstantMessenger_ChatListbox(owner) : Listbox() constructor {
  _owner = owner;

  static xPos = function() {
    return _owner.getOwner().x + 8;
  }

  static yPos = function() {
    return _owner.getOwner().y + sprite_get_height(spr_TitlebarActive) + 8;
  }

  static getWidth = function() {
    return 204;
  }

  static getHeight = function() {
    return 204;
  }

  static getOwner = function() {
    return _owner;
  }

  static _getFolder = function() {
    return ctrl_ChatManager.getChatNames();
  }

  static getTextField = function(idx) {
    return _getFolder()[idx];
  }

  static getTextFieldCount = function() {
    return array_length(_getFolder());
  }

  static onClick = function(idx) {
    var mgr = Windows.addOrFindWindow(new InstantMessengerChat(), 128, 30, -1, -1);
    mgr.window_body.setPerson(getTextField(idx));
  }

}

function _InstantMessengerChat_HistoryListbox(owner) : Listbox() constructor {
  _owner = owner;

  static xPos = function() {
    return _owner.getOwner().x + 8;
  }

  static yPos = function() {
    return _owner.getOwner().y + sprite_get_height(spr_TitlebarActive) + 8;
  }

  static getWidth = function() {
    return 384;
  }

  static getHeight = function() {
    return 240;
  }

  static getOwner = function() {
    return _owner;
  }

  static _getHistory = function() {
    if (is_undefined(_owner.getPerson())) {
      return undefined;
    }
    return ctrl_ChatManager.getChatHistory(_owner.getPerson());
  }

  static getTextField = function(idx) {
    var msg = _getHistory()[| idx];
    if (is_undefined(_owner.getPerson())) {
      return msg.getHeader("???");
    } else {
      return msg.getHeader(_owner.getPerson());
    }
  }

  static getTextFieldCount = function() {
    if (is_undefined(_getHistory())) {
      return 0;
    }
    return ds_list_size(_getHistory());
  }

  static onClick = function(idx) {
    // No action :)
  }

}

function _InstantMessengerChat_ReplyBox(owner) : Textbox() constructor {
  _owner = owner;

  static xPos = function() {
    return _owner.getOwner().x + 8;
  }

  static yPos = function() {
    return _owner.getOwner().y + sprite_get_height(spr_TitlebarActive) + 256;
  }

  static getWidth = function() {
    return 356;
  }

  static getHeight = function() {
    return 20;
  }

}

function _InstantMessengerChat_ReplyButton(owner) : SpriteButton() constructor {
  _owner = owner;

  static getSprite = function() {
    return spr_ButtonReply;
  }

  static xPos = function() {
    return _owner.getOwner().x + 372;
  }

  static yPos = function() {
    return _owner.getOwner().y + sprite_get_height(spr_TitlebarActive) + 256;
  }

  static onClick = function() {
    var reply_box = _owner.getReplyBox();
    var person = _owner.getPerson();
    if (is_undefined(person)) {
      return;
    }
    var text = reply_box.getText();
    var message = new ChatMessage(SENDER_MARS, text);
    ctrl_ChatManager.addChatMessage(person, message);
    reply_box.setText("");
  }

}
