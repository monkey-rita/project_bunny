import 'dart:io';
import 'package:angular/angular.dart';
import 'package:markdown/markdown.dart';

@Component(
  selector: 'tech-article',
  template: '''
  <div [innerHTML]="fromMarkdown">Loading...</div>
  ''',
  styleUrls: ['github.css']
)
class Article implements OnInit{

  String fromMarkdown = "";

  @Input("filePath")
  String filePath;

  @override
  void ngOnInit() {
    File(filePath).readAsString().then((fileStr) {
      fromMarkdown = markdownToHtml(fileStr);
    });
  }


}