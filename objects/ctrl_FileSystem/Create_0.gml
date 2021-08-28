
// The file system consists of four folders: Documents, Music,
// Pictures, Videos.
folders = ["Documents", "Music", "Pictures", "Videos"];
_data = {};
_data.Documents = ds_list_create();
_data.Music = ds_list_create();
_data.Pictures = ds_list_create();
_data.Videos = ds_list_create();

getFiles = function(folder) {
  return _data[$ folder.getName()];
}

addFile = function(folder, file) {
  var files = getFiles(folder);
  ds_list_add(files, file);
}

findFileByName = function(folder, filename) {
  var files = getFiles(folder);
  for (var idx = 0; idx < ds_list_size(files); i++) {
    if (files[| idx].getBaseName() == filename) {
      return files[| idx];
    }
  }
  return undefined;
}
