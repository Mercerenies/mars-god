
chats = ["Alice", "Boss", "Dan", "Evan", "Mercer", "Minerva"];

table = {};
for (var i = 0; i < array_length(chats); i++) {
  table[$ chats[i]] = ds_list_create();
}

// Returns a ds_list
getChatHistory = function(name) {
  return table[$ name];
}

isChatSacred = function(name) {
  // Sacred chats are plot-relevant and shouldn't be spam-able.
  return (name == "Minerva") || (name == "Boss");
}

// message should be a ChatMessage.
addChatMessage = function(name, message) {
  var list = getChatHistory(name);
  if ((message.getSender() == SENDER_MARS) && (ds_list_size(list) > 0) && (isChatSacred(name)) && (list[| ds_list_size(list) - 1].getSender() == SENDER_MARS)) {
    // Spam-prevention measure on plot-relevant chats
    list[| ds_list_size(list) - 1] = message;
  } else {
    ds_list_add(list, message);
  }
  // If there's too many messages, delete some
  if (ds_list_size(list) > CHAT_MAX) {
    ds_list_delete(list, 0);
  }
}

// Returns an array
getChatNames = function() {
  return chats;
}
