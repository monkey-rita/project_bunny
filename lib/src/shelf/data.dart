/// I just like 'shelf' concept, but it
/// might not be needed :)
class Shelf {
  List<Tab> tabs = List();

  Shelf.fromJson(List<dynamic> json) {
    for (Map<String, dynamic> rawTab in json) {
      Tab tab = Tab.fromJson(rawTab);
      tabs.add(tab);
    }

    tabs.sort((t1, t2) {
      return t1.dirName.compareTo(t2.dirName);
    });
  }

  bool isEmpty() => tabs.isEmpty;
}

class Tab {
  String name;
  String dirName; // directory's name, for sorting
  List<MenuSection> sections = List();

  Tab.fromJson(Map<String, dynamic> json) {
    name = json["name"] ?? "TAB";
    dirName = json["dirName"] ?? "TAB";
    final sectionData = json["sections"] ?? List();
    for (Map<String, dynamic> rawSection in sectionData) {
      final section = MenuSection.fromJson(rawSection);
      sections.add(section);
    }

    sections.sort((s1, s2) {
      return s1.dirName.compareTo(s2.dirName);
    });
  }

  bool isEmpty() => sections.isEmpty;
}

class MenuSection {
  String label = "";
  String dirName = "";
  List<MenuItem> items = List();

  MenuSection.fromJson(Map<String, dynamic> json) {
    label = json["name"] ?? "Section";
    dirName = json["dirName"] ?? "Section";
    final itemData = json["items"] ?? List();
    for (Map<String, String> rawItem in itemData) {
      final menuItem = MenuItem.fromJson(rawItem);
      items.add(menuItem);
    }

    items.sort((i1, i2) {
      return i1.fileName.compareTo(i2.fileName);
    });
  }

  bool isEmpty() => items.isEmpty;
}

class MenuItem {
  String name;
  String fileName; // original file name, for sorting
  String lastUpdate;
  String mdAsString;

  MenuItem.fromJson(Map<String, String> json) {
    name = json["name"] ?? "Article";
    fileName = json["fileName"] ?? "Article";
    lastUpdate = json["lastUpdate"] ?? "";
    mdAsString = json["mdAsString"] ?? "";
  }

}