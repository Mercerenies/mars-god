
function Folder() constructor {

  static getName = function() {
    return "Folder";
  }

  static getIcon = function() {
    return Icon.Documents;
  }

}

function Documents() : Folder() constructor {

  static getName = function() {
    return "Documents";
  }

  static getIcon = function() {
    return Icon.Documents;
  }

}

function Music() : Folder() constructor {

  static getName = function() {
    return "Music";
  }

  static getIcon = function() {
    return Icon.Music;
  }

}

function Pictures() : Folder() constructor {

  static getName = function() {
    return "Pictures";
  }

  static getIcon = function() {
    return Icon.Pictures;
  }

}

function Videos() : Folder() constructor {

  static getName = function() {
    return "Videos";
  }

  static getIcon = function() {
    return Icon.Videos;
  }

}