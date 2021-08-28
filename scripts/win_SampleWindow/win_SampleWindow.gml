
// Parent class for window objects
function SampleWindow() : WindowContents() constructor {

  static windowTitle = function() {
    return "Sample Window";
  }

  static desiredWidth = function() {
    return 240;
  }

  static desiredHeight = function() {
    return 120;
  }

}
