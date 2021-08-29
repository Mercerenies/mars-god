
full_game_queue = ds_queue_create();

bad_password_char = undefined;
themis_account_made = false;
data_entered = 0;
can_visit_gods = false;
tried_to_visit_gods = 0;

// DEBUG CODE
themis_account_made = true;
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
//*/

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

//*/
