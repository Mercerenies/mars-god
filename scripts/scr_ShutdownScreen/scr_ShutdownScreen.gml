
// Start menu entry for shutdown screen
function ShutdownEntry() : StartMenuEntry() constructor {

  static getIcon = function() {
    return Icon.Power;
  }

  static getName = function() {
    return "Shutdown";
  }

  static onClick = function() {
    var override = instance_create_layer(0, 0, "Instances_Override", obj_ShutdownScreen);
    ctrl_WindowManager.setOverride(override);
  }

}
