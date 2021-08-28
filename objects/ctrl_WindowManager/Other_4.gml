
// Start Menu Initialization
obj_StartMenu.addEntry(new CalculatorEntry());
obj_StartMenu.addEntry(new FileManagerEntry(new Documents()));
obj_StartMenu.addEntry(new FileManagerEntry(new Music()));
obj_StartMenu.addEntry(new FileManagerEntry(new Pictures()));
obj_StartMenu.addEntry(new FileManagerEntry(new Videos()));

// DEBUG CODE
addWindow(Windows.createWindow(new SampleWindow("Sample Window I"), 64, 64, -1, -1));
addWindow(Windows.createWindow(new SampleWindow("Sample Window II with Long Titlebar Name Blah Blah Blah"), 128, 128, -1, -1));
ctrl_FileSystem.addFile(new Documents(), new DebugExampleFile("abc.dbg", 6));
