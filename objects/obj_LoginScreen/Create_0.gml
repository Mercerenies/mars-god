
event_inherited();

_username = new _LoginScreen_Username();
_password = new _LoginScreen_Password();
_login = new _LoginScreen_LoginButton();
_shutdown = new _LoginScreen_ShutdownButton();
_error_box = new _LoginScreen_ErrorBox();

_parent_event = event;

hidesCursor = function() {
  return false;
}

event = function(ev) {
  _parent_event(ev);
  _username.event(ev);
  _password.event(ev);
  _login.event(ev);
  _shutdown.event(ev);
  _error_box.event(ev);
}

doLogin = function() {
  var username = string_lower(_username.getText());
  var password = string_lower(_password.getText());
  if (username == "mars") {
    if (password == "") {
      _error_box.setText("Incorrect password!");
    } else {
      instance_destroy();
    }
  } else {
    if ((ctrl_GameManager.admin) && (username == "admin") && (password == "password")) {
      instance_destroy();
      ctrl_GameManager.is_admin = true;
      obj_Taskbar.disabled = true;
      with (ctrl_WindowManager) {
        while (!ds_list_empty(original_order)) {
          close(original_order[| 0]);
        }
      }
    } else {
      _error_box.setText("Unknown username! Did you mean 'Mars'?");
    }
  }
}
