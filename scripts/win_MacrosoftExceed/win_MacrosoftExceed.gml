
function MacrosoftExceed() : WindowContents() constructor {

  static windowTitle = function() {
    return "Macrosoft Exceed";
  }

  static desiredWidth = function() {
    return 420;
  }

  static desiredHeight = function() {
    return 250;
  }

  static iconIndex = function() {
    return Icon.Exceed;
  }

  static windowId = function() {
    return "MacrosoftExceed";
  }

}

function MacrosoftExceedEntry() : StartMenuEntry() constructor {

  static getIcon = function() {
    return Icon.Exceed;
  }

  static getName = function() {
    return "Macrosoft Exceed";
  }

  static onClick = function() {
    Windows.addOrFindWindow(new MacrosoftExceed(), 130, 150, -1, -1);
  }

}
