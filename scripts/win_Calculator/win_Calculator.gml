
function Calculator() : WindowContents() constructor {
  _results = new _Calculator_ResultBox(self);
  _memory = 0;
  _memory_op = "";

  addChild(_results);

  addChild(new _Calculator_InputButton(self, "7", 0, 0));
  addChild(new _Calculator_InputButton(self, "8", 32, 0));
  addChild(new _Calculator_InputButton(self, "9", 64, 0));
  addChild(new _Calculator_OpButton(self, "/", 96, 0));

  addChild(new _Calculator_InputButton(self, "4", 0, 32));
  addChild(new _Calculator_InputButton(self, "5", 32, 32));
  addChild(new _Calculator_InputButton(self, "6", 64, 32));
  addChild(new _Calculator_OpButton(self, "*", 96, 32));

  addChild(new _Calculator_InputButton(self, "1", 0, 64));
  addChild(new _Calculator_InputButton(self, "2", 32, 64));
  addChild(new _Calculator_InputButton(self, "3", 64, 64));
  addChild(new _Calculator_OpButton(self, "-", 96, 64));

  addChild(new _Calculator_ClearButton(self, 0, 96));
  addChild(new _Calculator_InputButton(self, "0", 32, 96));
  addChild(new _Calculator_OpButton(self, "=", 64, 96));
  addChild(new _Calculator_OpButton(self, "+", 96, 96));


  static windowTitle = function() {
    return "Calculator";
  }

  static desiredWidth = function() {
    return 128;
  }

  static desiredHeight = function() {
    return 176;
  }

  static iconIndex = function() {
    return Icon.Calculator;
  }

  static windowId = function() {
    return "Calculator";
  }

  static appendDigit = function(d) {
    var t = _results.getText();
    _results.setText(t + d);
  }

  static resultsBox = function() {
    return _results;
  }

  static resultAsNum = function() {
    if (_results.getText() == "") {
      return 0;
    } else {
      return real(_results.getText());
    }
  }

  static resultToMemory = function(op) {
    var lhs = _memory;
    var rhs = resultAsNum();
    var pre_op = _memory_op;
    var result = 0;
    switch (pre_op) {
    case "+":
      result = lhs + rhs;
      break;
    case "-":
      result = lhs - rhs;
      break;
    case "*":
      result = lhs * rhs;
      break;
    case "/":
      if (rhs == 0)
        result = 0;
      else
        result = floor(lhs / rhs);
      break;
    case "":
      result = rhs;
      break;
    }
    _memory = result;
    resultsBox().setText("");
    _memory_op = op;
    if (_memory_op == "=") {
      clear();
      resultsBox().setText(string(result));
    }
  }

  static clear = function() {
    _memory_op = "";
    _memory = 0;
    resultsBox().setText("");
  }

}

function CalculatorEntry() : StartMenuEntry() constructor {

  static getIcon = function() {
    return Icon.Calculator;
  }

  static getName = function() {
    return "Calculator";
  }

  static onClick = function() {
    
  }

}

function _Calculator_ResultBox(owner) : Textbox() constructor {
  _owner = owner;

  static xPos = function() {
    return _owner.getOwner().x + 8;
  }

  static yPos = function() {
    return _owner.getOwner().y + sprite_get_height(spr_TitlebarActive) + 8;
  }

  static getWidth = function() {
    return 112;
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

function _Calculator_Button(owner) : SpriteButton() constructor {
  _owner = owner

  static _super_draw = draw

  static getSprite = function() {
    return spr_CalculatorButton;
  }

  static getText = function() {
    return "";
  }

  static draw = function() {
    _super_draw();
    draw_set_font(fnt_Calculator);
    draw_text(xPos() + 4, yPos() + 4, getText());
  }

}

function _Calculator_InputButton(owner, text, xx, yy) : _Calculator_Button(owner) constructor {
  _text = text;
  _xx = xx;
  _yy = yy;

  static xPos = function() {
    return _owner.getOwner().x + 4 + _xx;
  }

  static yPos = function() {
    return _owner.getOwner().y + sprite_get_height(spr_TitlebarActive) + 36 + _yy;
  }

  static getText = function() {
    return _text;
  }

  static onClick = function() {
    _owner.appendDigit(_text);
  }

}

function _Calculator_ActionButton(owner, xx, yy) : _Calculator_Button(owner) constructor {
  _xx = xx;
  _yy = yy;

  static xPos = function() {
    return _owner.getOwner().x + 4 + _xx;
  }

  static yPos = function() {
    return _owner.getOwner().y + sprite_get_height(spr_TitlebarActive) + 36 + _yy;
  }

}

function _Calculator_NegButton(owner, xx, yy) : _Calculator_ActionButton(owner, xx, yy) constructor {

  static getText = function() {
    return "+-";
  }

  static onClick = function() {
    var textbox = _owner.resultsBox();
    var text = textbox.getText();
    if (text != "") {
      if (string_copy(text, 1, 1) == "-") {
        textbox.setText(string_copy(text, 2, string_length(text)));
      } else {
        textbox.setText("-" + text);
      }
    }
  }

}

function _Calculator_ClearButton(owner, xx, yy) : _Calculator_ActionButton(owner, xx, yy) constructor {

  static getText = function() {
    return "C";
  }

  static onClick = function() {
    _owner.clear();
  }

}

function _Calculator_OpButton(owner, op, xx, yy) : _Calculator_ActionButton(owner, xx, yy) constructor {
  _op = op;

  static getText = function() {
    return _op;
  }

  static onClick = function() {
    _owner.resultToMemory(_op);
  }

}
