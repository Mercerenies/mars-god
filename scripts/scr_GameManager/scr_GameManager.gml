
// Game event objects need to have a shouldTrigger and a run.

function GameEvent() constructor {

  static shouldTrigger = function() {
    return true;
  }

  static run = function() {}

}

function Delay(time) : GameEvent() constructor {
  _time = time;

  static run = function() {
    ctrl_GameManager.alarm[0] = _time;
  }

}

function WaitForOpenWindow() : GameEvent() constructor {

  static shouldTrigger = function() {
    return ctrl_WindowManager.activeWindowCount() > 0;
  }

}

function SendChatMessage(sender, message_text) : GameEvent() constructor {
  _sender = sender;
  _message_text = message_text;

  static run = function() {
    var message = new ChatMessage(SENDER_OTHER, _message_text);
    ctrl_ChatManager.addChatMessage(_sender, message);
    var mgr = Windows.addOrFindWindow(new InstantMessengerChat(), 128, 30, -1, -1);
    mgr.window_body.setPerson(_sender);
  }

}