
var override = getOverride();
if (!is_undefined(override)) {
  override.event("step");
  exit;
}

for (var index = ds_list_size(z_order) - 1; index >= 0; index--) {
  with (z_order[| index]) {
    event("step");
  }
}
obj_Stapley.event("step");
