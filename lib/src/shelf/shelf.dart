import 'package:angular/angular.dart';

import 'package:project_bunny/src/article/article.dart';
import 'package:project_bunny/src/shelf/data.dart';
import '../raw_data.dart';

@Component(
  selector: 'my-shelf',
  templateUrl: 'shelf.html',
  styleUrls: ['shelf.css'],
  directives: [ArticleComponent, NgFor]
)
class ShelfComponent {

  Shelf shelf;
  ShelfComponent() {
    shelf = Shelf.fromJson(data);

    selectTab(shelf.tabs[0]);
  }

  Tab chosenTab;
  void selectTab(Tab tab) {
    chosenTab = tab;
    selectItem(tab.sections[0], tab.sections[0].items[0]);
  }

  MenuSection chosenSec;
  MenuItem chosenItem;
  String articleStr = "";
  void selectItem(MenuSection sec, MenuItem item) {
    chosenSec = sec;
    chosenItem = item;
    articleStr = item.mdAsString;
  }


}