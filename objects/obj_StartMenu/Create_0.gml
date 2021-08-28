
active = false;

isActive = function() {
  return active;
}

setActive = function(act) {
  active = act;
}

event = function(ev) {
  Events.callOn(self, ev);
}

gMouseUp = function() {
  if (cursor_x() > bbox_right) {
    setActive(false);
  }
}

cellWidth = function() {
  return sprite_width - 4;
}

cellHeight = function() {
  return START_CELL_HEIGHT;
}

cellCount = function() {
  var total_height = sprite_height - 4;
  return floor(total_height / cellHeight());
}

cellX = function(idx) {
  return x + 2;
}

cellY = function(idx) {
  return y + 12 + idx * cellHeight();
}

highlightedCell = function() {
  if (!isActive()) {
    return -1;
  }
  var cx = cursor_x();
  var cy = cursor_y();
  if (cx > bbox_right) {
    return -1;
  }
  for (var idx = 0; idx < cellCount(); idx++) {
    if (point_in_rectangle(cx, cy, cellX(idx), cellY(idx), cellX(idx) + cellWidth(), cellY(idx) + cellHeight())) {
      return idx;
    }
  }
  return -1;
}
