
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

// On system start
onSystemStart();

// DEBUG CODE (rest of this file)

// Sample docs
//ctrl_FileSystem.addFile(new Documents(), new SlideshowFile("slides.ppt", 8, spr_Slideshow_Example));

// Sample emails
//ctrl_FileSystem.addFile(new Mail(), new MailFile("Sender Name", "Subject Line", "This is an email."));
//ctrl_FileSystem.addFile(new Mail(), new MailFile("Mercerenies", "Hello :)", "Welcome to my game!"));

// Sample pics
ctrl_FileSystem.addFile(new Pictures(), new ImageFile("sample1.png", 10, spr_Image_Example1));
ctrl_FileSystem.addFile(new Pictures(), new ImageFile("sample2.png", 9, spr_Image_Example2));
ctrl_FileSystem.addFile(new Pictures(), new ImageFile("sample3.png", 9, spr_Image_Example3));

// Sample music
ctrl_FileSystem.addFile(new Music(), new MediaFile("sample.ogg", 16, snd_Sound_Example));

// Sample videos
ctrl_FileSystem.addFile(new Videos(), new FakeMediaFile("sample.mp4", 699, spr_Image_Example1));

// Word feed
ctrl_WordFeed.setWordFeed(new UniformWordFeed(["Exceed"]));

// Stapley
/*
obj_Stapley.appear();
obj_Stapley.say(new StapleyPrompt("Hi, I'm Stapley the Stapler. And I'm here to help!", 300));
*/
