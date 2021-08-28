
// Parent class for window objects
function WindowContents() constructor {
  _owner = undefined;
  _children = ds_list_create();

  static windowTitle = function() {
    return "";
  }

  static desiredWidth = function() {
    return 128;
  }

  static desiredHeight = function() {
    return 128;
  }

  static iconIndex = function() {
    return Icon.Null;
  }

  static step = function() {
    _callOnChildren("step");
  }

  static draw = function() {
    _callOnChildren("draw");
  }

  static getOwner = function() {
    return _owner;
  }

  static setOwner = function(owner) {
    _owner = owner;
  }

  static mouseDown = function() {
    _callOnChildren("mouseDown");
  }

  static gMouseDown = function() {
    _callOnChildren("gMouseDown");
  }

  static mouseUp = function() {
    _callOnChildren("mouseUp");
  }

  static gMouseUp = function() {
    _callOnChildren("gMouseUp");
  }

  static cleanup = function() {
    ds_list_destroy(_children);
  }

  static getChildren = function() {
    return _children;
  }

  static addChild = function(child) {
    ds_list_add(_children, child);
  }

  static _callOnChildren = function(fname) {
    for (var i = 0; i < ds_list_size(_children); i++) {
      var child = _children[| i];
      var fn = child[$ fname];
      if (!is_undefined(fn)) {
        child._win_WindowContents_callOnChildren_callback = fn;
        child._win_WindowContents_callOnChildren_callback();
      }
    }
  }

}

// TODO Set up a proper forwarding interface for controls tomorrow, so
// we aren't explicitly delegating the whole universe (/////)
