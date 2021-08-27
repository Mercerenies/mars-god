alarm[0] = 1;

image_alpha = Util.toward(image_alpha, 0, 0.1);
if (image_alpha <= 0) {
  instance_destroy();
}