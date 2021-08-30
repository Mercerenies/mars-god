
// Start Menu Initialization
obj_StartMenu.addEntry(new CalculatorEntry());
obj_StartMenu.addEntry(new CameraEntry());
obj_StartMenu.addEntry(new FileManagerEntry(new Documents()));
obj_StartMenu.addEntry(new FileCompressorEntry());
obj_StartMenu.addEntry(new FiredogEntry());
obj_StartMenu.addEntry(new ImageViewerEntry());
obj_StartMenu.addEntry(new InstantMessengerEntry());
obj_StartMenu.addEntry(new LogoutEntry());
obj_StartMenu.addEntry(new MacrosoftExceedEntry());
obj_StartMenu.addEntry(new MacrosoftLetterEntry());
obj_StartMenu.addEntry(new MacrosoftPowerlineEntry());
obj_StartMenu.addEntry(new MailManagerEntry());
obj_StartMenu.addEntry(new MediaPlayerEntry());
obj_StartMenu.addEntry(new FileManagerEntry(new Music()));
obj_StartMenu.addEntry(new FileManagerEntry(new Pictures()));
obj_StartMenu.addEntry(new ShutdownEntry());
obj_StartMenu.addEntry(new FileManagerEntry(new Videos()));

// Initial file system setup

// Documents
ctrl_FileSystem.addFile(new Documents(), new TextFile("Unimportant Trivia.doc", 9, "An ant has three joints in each leg."));

ctrl_FileSystem.addFile(new Pictures(), new ImageFile("Jam.png", 11, spr_Image_Jam));
ctrl_FileSystem.addFile(new Videos(), new FakeMediaFile("[18+] [Explicit] [Adult Content] [Content Banned in Country] [NSFW] [Viewer Beware] [File is long name].mp4", 699, spr_Image_Black));

ctrl_FileSystem.addFile(new Mail(), new MailFile("IT Department", "Account Setup", "Welcome to your inbox. Your email is now set up. Remember, your office is your family!"));
ctrl_FileSystem.addFile(new Mail(), new MailFile("Mercerenies", "Hello", "Welcome to my game!"));
ctrl_FileSystem.addFile(new Mail(), new MailFile("IT Department", "Notification", "Don't forget to update your operating system. Also, don't click on spam links."));
ctrl_FileSystem.addFile(new Mail(), new MailFile("ewuihouirhw@jmail.com", "Greetings", "I am a prince from a forgotten nation and am in need of donations. If you donate now, I will be looking for a vizier in the near future. Reply to this email if interested."));
ctrl_FileSystem.addFile(new Mail(), new MailFile("Boss", "test", "is this working?\n\n- Boss"));
ctrl_FileSystem.addFile(new Mail(), new MailFile("Boss", "(no subject)", "i think its working"));

// On system start
onSystemStart();

// Word feed
ctrl_WordFeed.setWordFeed(new UniformWordFeed(["Exceed"]));
