
for (var index = ds_list_size(z_order) - 1; index >= 0; index--) {
  with (z_order[| index]) {
    event("step");
  }
}
