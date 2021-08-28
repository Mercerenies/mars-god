
#macro Util global.__module_Util

Util = {};

Util.inverseLerp = function(a, b, amt) {
  return (amt - a) / (b - a);
}

Util.trueMod = function(a, b) {
  return (a % b + b) % b;
}

Util.toward = function(curr, target, spd) {
  if (abs(target - curr) <= spd)
    return target;
  else
    return curr + sign(target - curr) * spd;
}

Util.drawRaisedBox = function(x1, y1, x2, y2) {
  draw_set_color(Colors.WHITE);
  draw_line(x1, y1, x2, y1);
  draw_line(x1, y1, x1, y2);
  draw_set_color(Colors.BLACK);
  draw_line(x2, y1, x2, y2);
  draw_line(x1, y2, x2, y2);
}

Util.truncateText = function(text, width) {
  if (string_width(text) < width) {
    return text;
  }
  var trunc_text = "";
  for (var index = 1; index <= string_length(text); index++) {
    var ch = string_copy(text, index, 1);
    if (string_width(trunc_text + ch + "...") >= width)
      return trunc_text + "...";
    trunc_text += ch;
  }
}
