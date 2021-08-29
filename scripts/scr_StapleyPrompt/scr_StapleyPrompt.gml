
function StapleyPrompt(text, time) constructor {
  _text = text;
  _time = time;

  static getText = function() {
    return _text;
  }

  static getTime = function() {
    return _time;
  }

  static run = function() {
    obj_Stapley.current_message = getText();
    obj_Stapley.alarm[0] = getTime();
  }

}

function StapleyAppear() constructor {
  static run = function() {
    obj_Stapley.state = StapleyState.Appearing;
  }
}

function StapleyDisappear() constructor {
  static run = function() {
    obj_Stapley.state = StapleyState.Disappearing;
  }
}