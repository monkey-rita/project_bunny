import 'dart:io';

class Analyst {

  List<String> tabs = List();

  void _gotTabs() {
    Directory("docs").list(recursive: false).listen((file) {
      print("${file.path}");
    });
  }

}