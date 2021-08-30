
function RomanGods_Gods() : Website() constructor {
  addChild(new _RomanGods_Gods_HeaderBox(self));
  addChild(new _RomanGods_Gods_Listbox(self));
}

function _RomanGods_Gods_HeaderBox(owner) : MultilineTextArea() constructor {
  _owner = owner;

  setText("Welcome to RomanGods.com, the go-to site for ancient mythology enthusiasts.");

  static xPos = function() {
    return _owner.getOwner().contentX() + 32;
  }

  static yPos = function() {
    return _owner.getOwner().contentY() + sprite_get_height(spr_TitlebarActive) + 8;
  }

  static getWidth = function() {
    return 380;
  }

  static getHeight = function() {
    return 80;
  }

  static doesDrawRect = function() {
    return false;
  }

}

function _RomanGods_Gods_Listbox(owner) : Listbox() constructor {
  _owner = owner;
  _gods = [
    ["Apollo", "Apollo is one of the Olympian deities in classical Greek and Roman religion and Greek and Roman mythology. The national divinity of the Greeks, Apollo has been recognized as a god of archery, music and dance, truth and prophecy, healing and diseases, the Sun and light, poetry, and more."],
    ["Jupiter", "Jupiter, also known as Jove, is the god of the sky and thunder and king of the gods in ancient Roman religion and mythology."],
    ["Mars", "wakeupwakeupwakeupwakeupwakeupwakeupwakeup wakeupwakeupwakeupwakeupwakeupwakeupwakeup wakeupwakeupwakeupwakeupwakeupwakeupwakeup"],
    ["Minerva", "Minerva is the Roman goddess of wisdom and strategic warfare, justice, law, victory, and the sponsor of arts, trade, and strategy."],
    ["Neptune", "Neptune is the god of freshwater and the sea in Roman religion. He is the counterpart of the Greek god Poseidon."],
    ["Ops", "In ancient Roman religion, Ops or Opis was a fertility deity and earth goddess of Sabine origin."],
    ["Pluto", "Pluto was the ruler of the underworld in classical mythology. The earlier name for the god was Hades, which became more common as the name of the underworld itself."],
  ];

  static xPos = function() {
    return _owner.getOwner().contentX() + 8;
  }

  static yPos = function() {
    return _owner.getOwner().contentY() + sprite_get_height(spr_TitlebarActive) + 48;
  }

  static getWidth = function() {
    return 300;
  }

  static getHeight = function() {
    return 200;
  }

  static getOwner = function() {
    return _owner.getOwner();
  }

  static doesDrawRect = function() {
    return false;
  }

  static getTextField = function(idx) {
    return _gods[idx][0];
  }

  static getTextFieldCount = function() {
    return array_length(_gods);
  }

  static onClick = function(idx) {
    getOwner().openSite(new StaticSite(_gods[idx][1]));
    if (_gods[idx][0] == "Mars") {
      ctrl_GameManager.mars = true;
    }
  }

}
