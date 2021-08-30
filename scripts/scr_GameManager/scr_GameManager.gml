
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

function WaitForWindow(id_) : GameEvent() constructor {
  _id = id_;

  static shouldTrigger = function() {
    return !is_undefined(ctrl_WindowManager.findWindowById(_id));
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

function AwaitVar(var_name) : GameEvent() constructor {
  _var_name = var_name;

  static shouldTrigger = function() {
    return variable_instance_get(ctrl_GameManager, _var_name);
  }

}

function SetWordFeed(feed) : GameEvent() constructor {
  _feed = feed;

  static run = function() {
    ctrl_WordFeed.setWordFeed(_feed);
  }

}

function StapleyEvent(ev) : GameEvent() constructor {
  _ev = ev;

  static run = function() {
    obj_Stapley.say(_ev);
  }

}

function SetVar(var_name, value) : GameEvent() constructor {
  _var_name = var_name;
  _value = value;

  static run = function() {
    variable_instance_set(ctrl_GameManager, _var_name, _value);
  }

}

function AwaitVarAtLeast(var_name, value) : GameEvent() constructor {
  _var_name = var_name;
  _value = value;

  static shouldTrigger = function() {
    return variable_instance_get(ctrl_GameManager, _var_name) >= _value;
  }

}

function AddFile(folder, file) : GameEvent() constructor {
  _folder = folder;
  _file = file;

  static run = function() {
    ctrl_FileSystem.addFile(_folder, _file);
  }

}

function AddMail(file, announce) : GameEvent() constructor {
  _file = file;
  _announce = announce;

  static run = function() {
    ctrl_FileSystem.addFile(new Mail(), _file);
    if (_announce) {
      showMessageBox("You've got mail!");
    }
  }

}

function BSODEvent() : GameEvent() constructor {
  static run = function() {
    var override = instance_create_layer(0, 0, "Instances_Override", obj_BSOD);
    ctrl_WindowManager.setOverride(override);
  }
}

function StapleyFreeze() : GameEvent() constructor {
  static run = function() {
    obj_Stapley.x = room_width / 2;
    obj_Stapley.y = room_height / 2;
    obj_Stapley.frozen = true;
  }
}

function StapleyAngry() : GameEvent() constructor {
  static run = function() {
    obj_Stapley.angry = true;
    obj_Stapley.hp = 10;
  }
}
