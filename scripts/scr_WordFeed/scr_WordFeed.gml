
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
