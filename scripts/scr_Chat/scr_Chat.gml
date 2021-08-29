
#macro SENDER_MARS 0
#macro SENDER_OTHER 1
#macro CHAT_MAX 12

// Sender should be a SENDER_* constant
function ChatMessage(sender, message) constructor {
  _sender = sender;
  _message = message;

  static getSender = function() {
    return _sender;
  }

  static getMessage = function() {
    return _message;
  }

  static getHeader = function(person) {
    if (getSender() == SENDER_MARS) {
      return "Mars: " + getMessage();
    } else {
      return person + ": " + getMessage();
    }
  }

}
