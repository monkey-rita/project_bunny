import 'dart:io';
import 'dart:convert';

/// after 1 day's search, I cannot find a way
/// to list dir/files in a specific dir using
/// dart:html lib, and dart:io lib is not supported
/// in web client part, so this is a workaround
///
/// just use it generate a dart file which contains
/// a json list, which can be used in client

void main() async {

  final dataRoot = Directory("docs");

  List<dynamic> data = List();

  for (FileSystemEntity tabDir in dataRoot.listSync()) {
    if (tabDir is Directory) {
      data.add(_getTabData(tabDir));
    }
  }

  _writeFile(data);

}

Map<String, dynamic> _getTabData(Directory tabDir) {
  final tabData = Map<String, dynamic>();

  final dirName = _fileName(tabDir.path);
  final showName = _showName(tabDir.path);
  tabData["dirName"] = dirName;
  tabData["name"] = showName;

  final secData = List<dynamic>();
  final dirs = tabDir.listSync();
  for (FileSystemEntity dir in dirs) {
    if (dir is Directory) {
      final sData = _getSecData(dir);
      secData.add(sData);
    }
  }
  tabData["sections"] = secData;

  return tabData;
}

Map<String, dynamic> _getSecData(Directory secDir) {
  final secData = Map<String, dynamic>();

  final dirName = _fileName(secDir.path);
  final showName = _showName(secDir.path);
  secData["dirName"] = dirName;
  secData["name"] = showName;

  final fileData = List();
  final files = secDir.listSync();
  for (FileSystemEntity f in files) {
    if (f is File) {
      final fData = _getItemData(f);
      fileData.add(fData);
    }
  }
  secData["items"] = fileData;

  return secData;
}

Map<String, String> _getItemData(File file) {
  final fileData = Map<String, String>();

  final fileName = _fileName(file.path);
  final showName = _showName(file.path);
  final time = file.lastModifiedSync();
  final updateStr = "${time.year}-${time.month}-${time.day}";
  final contents = file.readAsStringSync();

  fileData["fileName"] = fileName;
  fileData["name"] = showName;
  fileData["lastUpdate"] = updateStr;
  fileData["mdAsString"] = contents;

  return fileData;
}

void _writeFile(dynamic data) {
  final writeFile = File("../lib/src/raw_data.dart");
  if (!writeFile.existsSync()) writeFile.createSync();

  final prefix = "final data = ";
  final suffix = ";";
  writeFile.writeAsStringSync(prefix + json.encode(data) + suffix);
}

String _fileName(String fullPath) {
  final parts = fullPath.split(Platform.pathSeparator);
  return parts[parts.length - 1];
}

String _showName(String fullPath) {
  final fileName = _fileName(fullPath);
  final parts = fileName.split("_");
  final almostDone = parts[parts.length - 1];
  if (almostDone.contains("md"))
    return almostDone.replaceAll(".md", "");
  else
    return almostDone;

}