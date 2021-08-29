
if (angry) {
  if (hurt_timer > 0) {
    sprite_index = spr_Stapley_AngryHurt;
  } else {
    sprite_index = spr_Stapley_Angry;
  }
} else {
  if (hurt_timer > 0) {
    sprite_index = spr_Stapley_Hurt;
  } else {
    sprite_index = spr_Stapley;
  }
}

image_xscale = zoom_level;
image_yscale = zoom_level;

// Image speed
if (current_message == "") {
  image_speed = 0;
  image_index = 0;
} else {
  image_speed = 1;
}

if (state == StapleyState.Appearing) {
  zoom_level = Util.toward(zoom_level, 1, 0.05);
  if (zoom_level == 1) {
    state = StapleyState.None;
  }
}

if (state == StapleyState.Disappearing) {
  zoom_level = Util.toward(zoom_level, 0, 0.05);
  if (zoom_level == 0) {
    state = StapleyState.None;
  }
}

if ((alarm[0] <= 0) && (state == StapleyState.None)) {
  if (ds_queue_empty(talking)) {
    current_message = "";
  } else {
    var curr = ds_queue_dequeue(talking);
    curr.run();
  }
}

if (hurt_timer > 0) {
  hurt_timer -= 1;
}
