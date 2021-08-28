
// Start Menu Initialization
obj_StartMenu.addEntry(new CalculatorEntry());
obj_StartMenu.addEntry(new FileManagerEntry(new Documents()));
obj_StartMenu.addEntry(new MacrosoftLetterEntry());
obj_StartMenu.addEntry(new MacrosoftPowerlineEntry());
obj_StartMenu.addEntry(new MailManagerEntry());
obj_StartMenu.addEntry(new FileManagerEntry(new Music()));
obj_StartMenu.addEntry(new FileManagerEntry(new Pictures()));
obj_StartMenu.addEntry(new FileManagerEntry(new Videos()));

// DEBUG CODE (rest of this file)

// Sample windows
addWindow(Windows.createWindow(new SampleWindow("Sample Window I"), 64, 64, -1, -1));
addWindow(Windows.createWindow(new SampleWindow("Sample Window II with Long Titlebar Name Blah Blah Blah"), 192, 128, -1, -1));

// Sample docs
ctrl_FileSystem.addFile(new Documents(), new DebugExampleFile("abc.dbg", 6));
ctrl_FileSystem.addFile(new Documents(), new TextFile("textfile.doc", 8, "This is an example text file. Welcome to Macrosoft Letter I suppose."));
ctrl_FileSystem.addFile(new Documents(), new SlideshowFile("slides.ppt", 8, spr_Slideshow_Example));

// Sample emails
ctrl_FileSystem.addFile(new Mail(), new MailFile("Sender Name", "Subject Line", "This is an email."));
ctrl_FileSystem.addFile(new Mail(), new MailFile("Mercerenies", "Hello :)", "Welcome to my game!"));