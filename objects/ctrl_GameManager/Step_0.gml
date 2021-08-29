
if (alarm[0] <= 0) {
  if (ds_queue_empty(full_game_queue)) {
    // End of game; go to next room (TODO This)
  } else {
    if (ds_queue_head(full_game_queue).shouldTrigger()) {
      var curr = ds_queue_dequeue(full_game_queue);
      curr.run();
    }
  }
}
