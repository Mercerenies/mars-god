
function PasswordBox() : Textbox() constructor {

  static getDisplayText = function() {
    return string_repeat("*", string_length(getText()));
  }

}
