
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