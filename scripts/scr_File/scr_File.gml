
function File() constructor {
  _compressionCount = 0;

  static getBaseName = function() {
    return "";
  }

  // Megabytes
  static getBaseSize = function() {
    return 0;
  }

  // Yes, this can go below zero. That's the joke.
  static getSize = function() {
    return getBaseSize() - getCompressionCount();
  }

  static getCompressionCount = function() {
    return _compressionCount;
  }

  static compress = function() {
    _compressionCount++;
  }

  static getName = function() {
    return getBaseName() + string_repeat(".zip", getCompressionCount());
  }

  static getFullDisplay = function() {
    return getName() + " (" + string(getSize()) + " MB)";
  }

  static openFile = function() {}

}

function DebugExampleFile(name, size) : File() constructor {
  _name = name;
  _size = size;

  static getBaseName = function() {
    return _name;
  }

  static getBaseSize = function() {
    return _size;
  }

}

function EncryptedFile(real_file) : File() constructor {
  _real_file = real_file;

  static getBaseName = function() {
    return _real_file.getBaseName();
  }

  static getBaseSize = function() {
    return _real_file.getBaseSize();
  }

  static openFile = function() {
    if (ctrl_GameManager.decrypted) {
      _real_file.openFile()
    } else {
      Windows.addOrFindWindow(new FileDecryptor(), 90, 90, -1, -1);
    }
  }

}

function TextFile(name, size, contents) : File() constructor {
  _name = name;
  _size = size;
  _contents = contents;

  static getBaseName = function() {
    return _name;
  }

  static getBaseSize = function() {
    return _size;
  }

  static getContents = function() {
    return _contents;
  }

  static openFile = function() {
    var mgr = Windows.addOrFindWindow(new MacrosoftLetter(), 128, 128, -1, -1);
    mgr.window_body.openFile(self);
  }

}

function SlideshowFile(name, size, sprite) : File() constructor {
  _name = name;
  _size = size;
  _sprite = sprite;

  static getBaseName = function() {
    return _name;
  }

  static getBaseSize = function() {
    return _size;
  }

  static getSprite = function() {
    return _sprite;
  }

  static getSlideCount = function() {
    return sprite_get_number(_sprite);
  }

  static openFile = function() {
    var mgr = Windows.addOrFindWindow(new MacrosoftPowerline(), 156, 140, -1, -1);
    mgr.window_body.openFile(self);
  }

}

function MailFile(sender, subject, text) : File() constructor {
  _sender = sender;
  _subject = subject;
  _text = text;

  static getBaseName = function() {
    return _subject + ".eml";
  }

  static getBaseSize = function() {
    return 2;
  }

  static getHeader = function() {
    return getSender() + " - " + getSubject();
  }

  static getSender = function() {
    return _sender;
  }

  static getSubject = function() {
    return _subject;
  }

  static getContents = function() {
    return _text;
  }

  static onReply = function() {}

  static openFile = function() {
    var mgr = Windows.addOrFindWindow(new MailViewer(), 240, 102, -1, -1);
    mgr.window_body.openFile(self);
  }

}

function ImageFile(name, size, sprite) : File() constructor {
  _name = name;
  _size = size;
  _sprite = sprite;

  static getBaseName = function() {
    return _name;
  }

  static getBaseSize = function() {
    return _size;
  }

  static getSprite = function() {
    return _sprite;
  }

  static openFile = function() {
    var mgr = Windows.addOrFindWindow(new ImageViewer(), 201, 96, -1, -1);
    mgr.window_body.openFile(self);
  }

}

function MediaFile(name, size, audio) : File() constructor {
  _name = name;
  _size = size;
  _audio = audio;

  static getBaseName = function() {
    return _name;
  }

  static getBaseSize = function() {
    return _size;
  }

  static getSprite = function() {
    return spr_Image_Music;
  }

  static getSound = function() {
    return _audio;
  }

  static openFile = function() {
    var mgr = Windows.addOrFindWindow(new MediaPlayer(), 200, 82, -1, -1);
    mgr.window_body.openFile(self);
  }

}

function FakeMediaFile(name, size, sprite) : MediaFile(name, size, noone) constructor {
  _sprite = sprite;

  static getSprite = function() {
    return _sprite;
  }

}
