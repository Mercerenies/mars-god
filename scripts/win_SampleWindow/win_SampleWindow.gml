
// Parent class for window objects
function SampleWindow(title) : WindowContents() constructor {
  _title = title;

  static windowTitle = function() {
    return _title;
  }

  static desiredWidth = function() {
    return 240;
  }

  static desiredHeight = function() {
    return 120;
  }

}
