import 'package:angular/angular.dart';

import 'package:project_bunny/src/shelf/shelf.dart';

@Component(
  selector: 'app-entry',
  template: '''
  <my-shelf></my-shelf>

  ''',
  directives: [ ShelfComponent ]
)
class AppEntry {

}