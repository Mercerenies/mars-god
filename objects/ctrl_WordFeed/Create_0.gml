
// Queued words
_words = ds_list_create();

_word_feed = new WordFeed();

setWordFeed = function(wf) {
  _word_feed = wf;
}

getWordFeed = function() {
  return _word_feed;
}

purge = function() {
  ds_list_clear(_words);
}

_generate = function() {
  ds_list_add(_words, _word_feed.getNextWord());
}

pop = function() {
  if (ds_list_size(_words) <= 0) {
    _generate();
  }
  var w = _words[| 0];
  ds_list_delete(_words, 0);
  return w;
}

get = function(idx) {
  while (ds_list_size(_words) <= idx) {
    _generate();
  }
  return _words[| idx];
}
