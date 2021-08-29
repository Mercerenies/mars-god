
_sites = [
  ["example.com", ExampleSite], // DEBUG CODE
];

_defaultsite = DefaultSite;

resolveSite = function(url) {
  if (url == "") {
    return undefined;
  }
  for (var idx = 0; idx < array_length(_sites); idx++) {
    var curr = _sites[idx];
    if (string_pos(string_lower(url), curr[0]) > 0) {
      return new curr[1]();
    }
  }
  return new _defaultsite();
}
