
full_game_queue = ds_queue_create();

bad_password_char = undefined;
themis_account_made = false;
data_entered = 0;
can_visit_gods = false;
tried_to_visit_gods = 0;
got_gods_file = false;
can_see_password = false;
decrypted = false;
on_waitlist = false;
past_waitlist = false;
logged_in_to_gods = false;
replied = false;
mars = false;
admin = false;
is_admin = false;
winner = false;

// DEBUG CODE
themis_account_made = true;
can_visit_gods = true;
tried_to_visit_gods = 7;
got_gods_file = true;
on_waitlist = true;
logged_in_to_gods = true;
admin = true;
winner = true;
// END DEBUG CODE

// These comments are only commented out for DEBUG CODE reasons

/*
ds_queue_enqueue(full_game_queue, new Delay(60));
ds_queue_enqueue(full_game_queue, new WaitForOpenWindow());
ds_queue_enqueue(full_game_queue, new Delay(180));

ds_queue_enqueue(full_game_queue, new SendChatMessage("Boss", "Looks like you got logged in okay."));
ds_queue_enqueue(full_game_queue, new Delay(120));
ds_queue_enqueue(full_game_queue, new SendChatMessage("Boss", "First things first."));
ds_queue_enqueue(full_game_queue, new Delay(120));
ds_queue_enqueue(full_game_queue, new SendChatMessage("Boss", "You need to set up your corporate account."));
ds_queue_enqueue(full_game_queue, new Delay(120));
ds_queue_enqueue(full_game_queue, new SendChatMessage("Boss", "Open your favorite web browser."));
ds_queue_enqueue(full_game_queue, new Delay(120));
ds_queue_enqueue(full_game_queue, new SendChatMessage("Boss", "And go to ThemisLawFirm.com."));
ds_queue_enqueue(full_game_queue, new Delay(120));
ds_queue_enqueue(full_game_queue, new SendChatMessage("Boss", "And follow the instructions there."));
ds_queue_enqueue(full_game_queue, new Delay(210));
ds_queue_enqueue(full_game_queue, new SendChatMessage("Boss", "I believe in you!"));

ds_queue_enqueue(full_game_queue, new AwaitVar("themis_account_made"));
ds_queue_enqueue(full_game_queue, new SetWordFeed(new UniformWordFeed(["law", "legal", "firm", "Themis", "company", "corporate", "subpoena", "service", "papers", "paper", "document", "documents", "reschedule", "judge", "jury", "lawyer", "attorney", "case", "suit", "lawsuit", "protection", "habeus", "corpus"])));
ds_queue_enqueue(full_game_queue, new SetVar("data_entered", 0));
ds_queue_enqueue(full_game_queue, new Delay(180));

ds_queue_enqueue(full_game_queue, new SendChatMessage("Boss", "Great work! Looks like you're logged in."));
ds_queue_enqueue(full_game_queue, new Delay(120));
ds_queue_enqueue(full_game_queue, new SendChatMessage("Boss", "Now you'll need to open Macrosoft Exceed."));
ds_queue_enqueue(full_game_queue, new Delay(120));
ds_queue_enqueue(full_game_queue, new SendChatMessage("Boss", "We need you to do some data entry."));
ds_queue_enqueue(full_game_queue, new Delay(120));
ds_queue_enqueue(full_game_queue, new SendChatMessage("Boss", "Copy the contents of the left column."));
ds_queue_enqueue(full_game_queue, new Delay(120));
ds_queue_enqueue(full_game_queue, new SendChatMessage("Boss", "And move them to the right."));
ds_queue_enqueue(full_game_queue, new Delay(120));

ds_queue_enqueue(full_game_queue, new SendChatMessage("Boss", "Then press enter to move to the next row."));

ds_queue_enqueue(full_game_queue, new WaitForWindow("MacrosoftExceed"));
ds_queue_enqueue(full_game_queue, new Delay(60));
ds_queue_enqueue(full_game_queue, new StapleyEvent(new StapleyAppear()));
ds_queue_enqueue(full_game_queue, new Delay(60));
ds_queue_enqueue(full_game_queue, new StapleyEvent(new StapleyPrompt("Hi there! I'm Stapley the Stapler!", 180)));
ds_queue_enqueue(full_game_queue, new Delay(180));
ds_queue_enqueue(full_game_queue, new StapleyEvent(new StapleyPrompt("It looks like you're trying to do some data entry.", 180)));
ds_queue_enqueue(full_game_queue, new Delay(180));
ds_queue_enqueue(full_game_queue, new StapleyEvent(new StapleyPrompt("That's great!", 180)));
ds_queue_enqueue(full_game_queue, new Delay(180));
ds_queue_enqueue(full_game_queue, new StapleyEvent(new StapleyPrompt("Just take what you see in the left column and type it in the right column.", 180)));
ds_queue_enqueue(full_game_queue, new Delay(180));
ds_queue_enqueue(full_game_queue, new StapleyEvent(new StapleyPrompt("Then press enter to move to the next row.", 180)));
ds_queue_enqueue(full_game_queue, new Delay(180));

ds_queue_enqueue(full_game_queue, new AwaitVarAtLeast("data_entered", 20));

ds_queue_enqueue(full_game_queue, new SetVar("can_visit_gods", true));
ds_queue_enqueue(full_game_queue, new AddFile(new Documents(), new TextFile("Important Info.doc", 11, "romangods.com romangods.com romangods.com romangods.com romangods.com romangods.com romangods.com romangods.com romangods.com romangods.com romangods.com romangods.com romangods.com romangods.com romangods.com romangods.com romangods.com romangods.com romangods.com romangods.com")));
ds_queue_enqueue(full_game_queue, new Delay(60));
ds_queue_enqueue(full_game_queue, new SendChatMessage("Boss", "Great work!"));
ds_queue_enqueue(full_game_queue, new Delay(120));
ds_queue_enqueue(full_game_queue, new SendChatMessage("Boss", "You might be Employee of the Month!"));
ds_queue_enqueue(full_game_queue, new Delay(120));
ds_queue_enqueue(full_game_queue, new SendChatMessage("Boss", "Now keep doing that for eight hours."));
ds_queue_enqueue(full_game_queue, new Delay(120));
ds_queue_enqueue(full_game_queue, new SendChatMessage("Boss", "And don't even think about getting distracted!"));
ds_queue_enqueue(full_game_queue, new Delay(120));
ds_queue_enqueue(full_game_queue, new SendChatMessage("Boss", "Specifically, don't look in your Documents folder."));
ds_queue_enqueue(full_game_queue, new Delay(120));
ds_queue_enqueue(full_game_queue, new SendChatMessage("Boss", "There's nothing there."));
ds_queue_enqueue(full_game_queue, new Delay(120));

ds_queue_enqueue(full_game_queue, new AwaitVarAtLeast("tried_to_visit_gods", 3));
ds_queue_enqueue(full_game_queue, new StapleyEvent(new StapleyPrompt("Hi there! It looks like you're trying to defy corporate policy!", 180)));
ds_queue_enqueue(full_game_queue, new Delay(180));
ds_queue_enqueue(full_game_queue, new StapleyEvent(new StapleyPrompt("I don't think you should do that.", 180)));
ds_queue_enqueue(full_game_queue, new Delay(180));

ds_queue_enqueue(full_game_queue, new AwaitVar("got_gods_file"));
ds_queue_enqueue(full_game_queue, new Delay(120));


ds_queue_enqueue(full_game_queue, new SetWordFeed(new UniformWordFeed(["law", "legal", "firm", "Themis", "company", "corporate", "subpoena", "service", "papers", "paper", "document", "documents", "reschedule", "judge", "jury", "lawyer", "attorney", "case", "suit", "lawsuit", "protection", "habeus", "corpus", "dreaming"])));
ds_queue_enqueue(full_game_queue, new SetVar("data_entered", 0));
ds_queue_enqueue(full_game_queue, new Delay(180));

ds_queue_enqueue(full_game_queue, new SendChatMessage("Boss", "Hey! Get back to work!"));
ds_queue_enqueue(full_game_queue, new Delay(120));
ds_queue_enqueue(full_game_queue, new SendChatMessage("Boss", "That data won't enter itself!"));
ds_queue_enqueue(full_game_queue, new Delay(120));

ds_queue_enqueue(full_game_queue, new AwaitVarAtLeast("data_entered", 10));
ds_queue_enqueue(full_game_queue, new AddMail(new MailFile("Minerva", "(no subject)", "Mars! Listen to me! [content blocked] Please reply to this if you can hear me!"), true));
ds_queue_enqueue(full_game_queue, new AwaitVar("replied", 10));
ds_queue_enqueue(full_game_queue, new Delay(60));

ds_queue_enqueue(full_game_queue, new StapleyEvent(new StapleyPrompt("Hi there! It looks like you're replying to personal emails on company time.", 180)));
ds_queue_enqueue(full_game_queue, new Delay(180));
ds_queue_enqueue(full_game_queue, new StapleyEvent(new StapleyPrompt("I don't think you should do that.", 180)));
ds_queue_enqueue(full_game_queue, new Delay(180));

ds_queue_enqueue(full_game_queue, new Delay(300));
ds_queue_enqueue(full_game_queue, new AddMail(new MailFile("Minerva", "re: (no subject)", "Oh, thank Jupiter! The encryption password for that file is on RomanGods.com. Hurry up and find it."), true));

ds_queue_enqueue(full_game_queue, new SetVar("can_see_password", true));
ds_queue_enqueue(full_game_queue, new Delay(60));
ds_queue_enqueue(full_game_queue, new AwaitVar("decrypted"));
ds_queue_enqueue(full_game_queue, new Delay(120));
ds_queue_enqueue(full_game_queue, new AwaitVar("on_waitlist"));
ds_queue_enqueue(full_game_queue, new Delay(60));

ds_queue_enqueue(full_game_queue, new SetWordFeed(new UniformWordFeed(["law", "legal", "firm", "Themis", "company", "corporate", "subpoena", "service", "papers", "paper", "document", "documents", "reschedule", "judge", "jury", "lawyer", "attorney", "lawsuit", "protection", "habeus", "corpus", "dreaming", "dream", "wake", "awaken", "sleeping", "sleep", "asleep"])));
ds_queue_enqueue(full_game_queue, new SetVar("data_entered", 0));
ds_queue_enqueue(full_game_queue, new Delay(180));

ds_queue_enqueue(full_game_queue, new SendChatMessage("Boss", "Mars!"));
ds_queue_enqueue(full_game_queue, new Delay(120));
ds_queue_enqueue(full_game_queue, new SendChatMessage("Boss", "Why aren't you entering data?!"));
ds_queue_enqueue(full_game_queue, new Delay(120));
ds_queue_enqueue(full_game_queue, new SendChatMessage("Boss", "Hurry up!"));
ds_queue_enqueue(full_game_queue, new Delay(120));

ds_queue_enqueue(full_game_queue, new AwaitVarAtLeast("data_entered", 10));
ds_queue_enqueue(full_game_queue, new AddMail(new MailFile("RomanGods.com", "Your Login", "You are now able to login to RomanGods.com. Thank you for your patience."), true));
ds_queue_enqueue(full_game_queue, new SetVar("past_waitlist", true));
ds_queue_enqueue(full_game_queue, new AwaitVar("mars"));
ds_queue_enqueue(full_game_queue, new Delay(60));
ds_queue_enqueue(full_game_queue, new BSODEvent());
ds_queue_enqueue(full_game_queue, new Delay(30));
ds_queue_enqueue(full_game_queue, new StapleyEvent(new StapleyDisappear()));
ds_queue_enqueue(full_game_queue, new Delay(600));
ds_queue_enqueue(full_game_queue, new WaitForOpenWindow());
ds_queue_enqueue(full_game_queue, new SetWordFeed(new UniformWordFeed(["dreaming", "dream", "wake", "awaken", "sleeping", "sleep", "asleep", "help", "no", "please", "hurry", "alive", "dead", "purgatory", "below"])));
ds_queue_enqueue(full_game_queue, new SetVar("data_entered", 0));
ds_queue_enqueue(full_game_queue, new Delay(180));

ds_queue_enqueue(full_game_queue, new SendChatMessage("Boss", "Mars! Your computer was off!"));
ds_queue_enqueue(full_game_queue, new Delay(120));
ds_queue_enqueue(full_game_queue, new SendChatMessage("Boss", "You know what you can't do without a computer?"));
ds_queue_enqueue(full_game_queue, new Delay(120));
ds_queue_enqueue(full_game_queue, new SendChatMessage("Boss", "Enter data!"));
ds_queue_enqueue(full_game_queue, new Delay(120));
ds_queue_enqueue(full_game_queue, new SendChatMessage("Boss", "Now get back to it!"));
ds_queue_enqueue(full_game_queue, new Delay(120));

ds_queue_enqueue(full_game_queue, new AwaitVarAtLeast("data_entered", 10));
ds_queue_enqueue(full_game_queue, new AddMail(new MailFile("Minerva", "re: (no subject)", "Mars! I figured it out! You need to logout and login to the admin account. The username is 'admin' and the password is 'password'. Hurry!"), true));
*/
ds_queue_enqueue(full_game_queue, new SetVar("admin", true));
ds_queue_enqueue(full_game_queue, new AwaitVar("is_admin"));
ds_queue_enqueue(full_game_queue, new Delay(180));
ds_queue_enqueue(full_game_queue, new StapleyFreeze());
ds_queue_enqueue(full_game_queue, new StapleyEvent(new StapleyAppear()));
ds_queue_enqueue(full_game_queue, new Delay(180));
ds_queue_enqueue(full_game_queue, new StapleyEvent(new StapleyPrompt("Hi there! It looks like you're trying to escape a nightmare.", 180)));
ds_queue_enqueue(full_game_queue, new Delay(180));
ds_queue_enqueue(full_game_queue, new StapleyEvent(new StapleyPrompt("I don't think you should do that.", 180)));
ds_queue_enqueue(full_game_queue, new Delay(180));
ds_queue_enqueue(full_game_queue, new StapleyEvent(new StapleyPrompt("In fact, I can't allow it.", 180)));
ds_queue_enqueue(full_game_queue, new Delay(180));
ds_queue_enqueue(full_game_queue, new StapleyAngry());
ds_queue_enqueue(full_game_queue, new StapleyEvent(new StapleyPrompt("You and I are going to stay here forever!", 180)));
ds_queue_enqueue(full_game_queue, new Delay(180));

ds_queue_enqueue(full_game_queue, new AwaitVar("winner"));
ds_queue_enqueue(full_game_queue, new Delay(180));
ds_queue_enqueue(full_game_queue, new StapleyEvent(new StapleyDisappear()));
/////

//*/
