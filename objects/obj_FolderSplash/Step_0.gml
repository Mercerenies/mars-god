
if (moving_down) {
  ygravity += 0.2;
  y += ygravity;
  if (y >= ystart) {
    y = ystart;
    ygravity = 0;
    moving_down = false;
  }
}