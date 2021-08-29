
function Firedog() : WindowContents() constructor {
  _url_box = new _Firedog_URLBox(self);
  _open_button = new _Firedog_OpenButton(self);
  _contents = new _Firedog_Contents(self);
  _site = undefined;

  addChild(_url_box);
  addChild(_open_button);
  addChild(_contents);

  static _parent_event = event;

  static event = function(ev) {
    _parent_event(ev);
    if (!is_undefined(_site)) {
      _site.event(ev);
    }
  }

  static windowTitle = function() {
    return "Firedog Web Browser";
  }

  static desiredWidth = function() {
    return 450;
  }

  static desiredHeight = function() {
    return 390;
  }

  static iconIndex = function() {
    return Icon.FireDog;
  }

  static windowId = function() {
    return "Firedog";
  }

  static step = function() {
    if (_url_box.isFocused() && keyboard_check_released(vk_enter)) {
      _open_button.onClick();
    }
  }

  static getSite = function() {
    return _site;
  }

  // Should be a Website instance
  static openSite = function(site) {
    _site = site;
    if (!is_undefined(_site)) {
      _site.setOwner(self);
    }
  }

  static contentX = function() {
    return _contents.xPos() + 2;
  }

  static contentY = function() {
    return _contents.yPos() + 2;
  }

  static getURL = function() {
    return _url_box.getText();
  }

}

function FiredogEntry() : StartMenuEntry() constructor {

  static getIcon = function() {
    return Icon.FireDog;
  }

  static getName = function() {
    return "Firedog Web Browser";
  }

  static onClick = function() {
    Windows.addOrFindWindow(new Firedog(), 100, 15, -1, -1);
  }

}

function _Firedog_URLBox(owner) : Textbox() constructor {
  _owner = owner;

  static xPos = function() {
    return _owner.getOwner().x + 8;
  }

  static yPos = function() {
    return _owner.getOwner().y + sprite_get_height(spr_TitlebarActive) + 8;
  }

  static getWidth = function() {
    return 410;
  }

  static getHeight = function() {
    return 20;
  }

  static getFont = function() {
    return fnt_Calculator;
  }

}

function _Firedog_OpenButton(owner) : SpriteButton() constructor {
  _owner = owner;

  static getSprite = function() {
    return spr_ButtonReply;
  }

  static xPos = function() {
    return _owner.getOwner().x + 422;
  }

  static yPos = function() {
    return _owner.getOwner().y + sprite_get_height(spr_TitlebarActive) + 8;
  }

  static onClick = function() {
    var url = _owner.getURL();
    var site = ctrl_SiteMap.resolveSite(url);
    _owner.openSite(site);
  }

}

function _Firedog_Contents(owner) constructor {
  _owner = owner;

  static xPos = function() {
    return _owner.getOwner().x + 8;
  }

  static yPos = function() {
    return _owner.getOwner().y + sprite_get_height(spr_TitlebarActive) + 36;
  }

  static getWidth = function() {
    return 434;
  }

  static getHeight = function() {
    return 346;
  }

  static event = function(ev) {
    Events.callOn(self, ev);
  }

  static draw = function() {
    var x1 = xPos();
    var y1 = yPos();
    var x2 = x1 + getWidth();
    var y2 = y1 + getHeight();
    draw_set_color(Colors.WHITE);
    draw_rectangle(x1, y1, x2, y2, false);
    Util.drawSunkenBox(x1, y1, x2, y2);

  }

}
