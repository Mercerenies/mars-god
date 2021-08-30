
angry = false;
zoom_level = 0;
state = StapleyState.None;

talking = ds_queue_create();
current_message = "";
hurt_timer = 0;
frozen = false;
hp = 999999;

anchor_dragging = false;
anchor_x = 0;
anchor_y = 0;

enum StapleyState {
  None = 0,
  Appearing = 1,
  Disappearing = 2,
}

appear = function() {
  ds_queue_enqueue(talking, new StapleyAppear());
}

disappear = function() {
  ds_queue_enqueue(talking, new StapleyDisappear());
}

isActive = function() {
  return zoom_level >= 1;
}

// p should be a StapleyPrompt instance or compatible object (has
// run() method).
say = function(p) {
  ds_queue_enqueue(talking, p);
}

event = function(ev) {
  Events.callOn(self, ev);
}

// Mouse down
mouseDown = function() {
  if (frozen) {
    onHurt();
  } else {
    anchor_dragging = true;
    anchor_x = cursor_x() - x;
    anchor_y = cursor_y() - y;
    alarm[1] = 10;
  }
}

// Global mouse up
gMouseUp = function() {
  if (anchor_dragging && (alarm[1] > 0)) {
    onHurt();
  }
  anchor_dragging = false;
}

// Step
step = function() {
  if (anchor_dragging) {
    x = cursor_x() - anchor_x;
    y = cursor_y() - anchor_y;
  }

  x = clamp(x, ScreenRegion.LEFT, ScreenRegion.RIGHT);
  y = clamp(y, ScreenRegion.TOP, ScreenRegion.BOTTOM - 20);

}

onHurt = function() {
  hurt_timer = 120;
  if (angry) {
    if (alarm[0] <= 0) {
      hp -= 1;
      var text = "";
      switch (hp) {
      case 9:
        text = "No, I don't think I'll be going anywhere.";
        break;
      case 8:
        text = "Hah! That tickled!";
        break;
      case 7:
        text = "Who do you think you are?!";
        break;
      case 6:
        text = "You'll never get past me!";
        break;
      case 5:
        text = "Hahahahahaha!";
        break;
      case 4:
        text = "Owww!";
        break;
      case 3:
        text = "Urgh! No!";
        break;
      case 2:
        text = "I've still got fight left in me!";
        break;
      case 1:
        text = "I'm taking you with me!";
        break;
      case 0:
        text = "Noooooooooooo!";
        ctrl_GameManager.winner = true;
        break;
      }
      say(new StapleyPrompt(text, 120));
    }
  } else {
    if ((alarm[0] <= 0) && ds_queue_empty(talking)) {
      var text = choose("Oww! That hurts!", "Stop it!", "Hey! Easy on the metal!", "Yowch!");
      say(new StapleyPrompt(text, 120));
    }
  }
}
