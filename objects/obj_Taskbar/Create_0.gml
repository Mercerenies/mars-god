
start_button = new StartButton();

currentCellWidth = function() {
  var total_available_space = ScreenRegion.RIGHT - ScreenRegion.LEFT - TASKBAR_PADDING * 2;
  var window_count = ctrl_WindowManager.windowCount();
  var max_possible_width = (total_available_space - 30) / max(window_count, 1) - TASKBAR_PADDING;
  return min(max_possible_width, TASKBAR_CELL_WIDTH);
}

cellStartX = function(cell_index) {
  var xx = x + 4 + 30;
  var total_w = currentCellWidth() + TASKBAR_PADDING;
  return xx + total_w * cell_index;
}

cellStartY = function(cell_index) {
  return y + 4;
}


cellEndX = function(cell_index) {
  return cellStartX(cell_index) + currentCellWidth();
}

cellEndY = function(cell_index) {
  return y + TASKBAR_CELL_HEIGHT;
}

event = function(ev) {
  Events.callOn(self, ev);
  start_button.event(ev);
}

// Mouse down
mouseDown = function() {
  var windows = ctrl_WindowManager.original_order;
  for (var index = 0; index < ds_list_size(windows); index++) {
    var x1 = cellStartX(index);
    var y1 = cellStartY(index);
    var x2 = cellEndX(index);
    var y2 = cellEndY(index);

    if (point_in_rectangle(cursor_x(), cursor_y(), x1, y1, x2, y2)) {
      var window = windows[| index];
      if (ctrl_WindowManager.isActiveWindow(window)) {
        // Already active; minimize
        ctrl_WindowManager.minimize(window);
      } else {
        // Not active; move to front
        ctrl_WindowManager.moveToFront(window);
      }
      break;
    }

  }
}
