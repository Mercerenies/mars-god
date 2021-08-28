
caret_tick = 0;

showCarets = function() {
  return (caret_tick % 90) < 45;
}

resetCaretTick = function() {
  caret_tick = 0;
}