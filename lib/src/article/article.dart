import 'package:angular/angular.dart';
import 'package:markdown/markdown.dart';

@Component(
  selector: 'tech-article',
  template: '''
  <div [innerHTML]="fromMarkdown">Loading...</div>
  ''',
  styleUrls: ['article.css']
)
class ArticleComponent implements OnInit{

  String fromMarkdown = "";

  @Input("mdAsString")
  String mdAsString;
  
  @override
  void ngOnInit() {
    fromMarkdown = markdownToHtml(mdAsString);
  }


}