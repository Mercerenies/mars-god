
draw_set_color(Colors.BLUE);
draw_rectangle(ScreenRegion.LEFT - 2, ScreenRegion.TOP - 2, ScreenRegion.RIGHT + 2, ScreenRegion.BOTTOM + 2, false);

_username.event("draw");
_password.event("draw");
_login.event("draw");
_shutdown.event("draw");
_error_box.event("draw");
