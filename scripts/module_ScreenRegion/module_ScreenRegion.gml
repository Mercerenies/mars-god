
#macro ScreenRegion global.__module_ScreenRegion

ScreenRegion = {};

ScreenRegion.LEFT = 192;
ScreenRegion.TOP = 48;
ScreenRegion.RIGHT = 832;
ScreenRegion.BOTTOM = 528;

ScreenRegion.pointIn = function(xx, yy) {
  return point_in_rectangle(xx, yy, ScreenRegion.LEFT, ScreenRegion.TOP, ScreenRegion.RIGHT, ScreenRegion.BOTTOM);
}

ScreenRegion.mouseIn = function() {
  return ScreenRegion.pointIn(mouse_x, mouse_y);
}

// Sizing macros

#macro ICON_WIDTH 20
#macro ICON_HEIGHT 20

#macro TASKBAR_CELL_WIDTH 128
#macro TASKBAR_CELL_HEIGHT 28

#macro TASKBAR_PADDING 8

#macro START_CELL_HEIGHT 28
