
angry = false;
zoom_level = 0;
state = StapleyState.None;

talking = ds_queue_create();
current_message = "";
hurt_timer = 0;

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

// p should be a StapleyPrompt instance.
say = function(p) {
  ds_queue_enqueue(talking, p);
}

event = function(ev) {
  Events.callOn(self, ev);
}

// Mouse down
mouseDown = function() {
  anchor_dragging = true;
  anchor_x = cursor_x() - x;
  anchor_y = cursor_y() - y;
  alarm[1] = 10;
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
  if ((alarm[0] <= 0) && ds_queue_empty(talking)) {
    var text = choose("Oww! That hurts!", "Stop it!", "Hey! Easy on the metal!", "Yowch!");
    say(new StapleyPrompt(text, 120));
  }
}