
var override = getOverride();
if (!is_undefined(override)) {
  exit;
}

for (var index = 0; index < ds_list_size(z_order); index++) {
  with (z_order[| index]) {
    event("draw");
  }
}
