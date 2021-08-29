
active = false;
entries = ds_list_create();

_cellstart = 0;

isActive = function() {
  return active;
}

setActive = function(act) {
  active = act;
}

addEntry = function(entry) {
  ds_list_add(entries, entry);
}

getEntry = function(idx) {
  if ((idx < 0) || (idx >= ds_list_size(entries))) {
    return undefined;
  }
  return entries[| idx];
}

event = function(ev) {
  Events.callOn(self, ev);
}

mouseDown = function() {
  var highlighted = highlightedCell();
  if (highlighted < 0) {
    // No highlight
  } else if (highlighted == 0) {
    // Up arrow
    _cellstart = max(_cellstart - 1, 0);
  } else if (highlighted == cellCount() - 1) {
    // Down arrow
    _cellstart = min(_cellstart + 1, ds_list_size(entries) - (cellCount() - 2));
  } else {
    // Regular button
    var entry = getEntry(cellToEntryIndex(highlighted));
    if (!is_undefined(entry)) {
      entry.onClick();
      setActive(false);
    }
  }
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

cellToEntryIndex = function(idx) {
  return idx - 1 + _cellstart;
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
