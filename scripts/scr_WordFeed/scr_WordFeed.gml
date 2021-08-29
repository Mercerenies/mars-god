
function WordFeed() constructor {
  static getNextWord = function() {
    return "";
  }
}

function SampleWordFeed() : WordFeed() constructor {
  static getNextWord = function() {
    return "Example " + string(irandom(10));
  }
}

// Takes an array
function UniformWordFeed(words) : WordFeed() constructor {
  _words = words;

  static getNextWord = function() {
    var idx = irandom(array_length(_words) - 1);
    return _words[idx];
  }
}
