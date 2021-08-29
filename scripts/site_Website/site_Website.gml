
#macro WEBSITE_WIDTH 430
#macro WEBSITE_HEIGHT 342

// Parent class for websites
function Website() constructor {
  _owner = undefined;
  _children = ds_list_create();

  static event = function(ev) {
    if (ev == "cleanup") {
      // Reverse order so that _children still exists during cleanup
      // delegation.
      Events.delegateTo(_children, ev);
      Events.callOn(self, ev);
    } else {
      Events.callOn(self, ev);
      Events.delegateTo(_children, ev);
    }
  }

  // owner will be a Firedog instance (the web browser WindowContents struct)
  static getOwner = function() {
    return _owner;
  }

  static setOwner = function(owner) {
    _owner = owner;
  }

  static addChild = function(child) {
    ds_list_add(_children, child);
  }

}
