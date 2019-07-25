import 'package:angular/angular.dart';
import 'package:markdown/markdown.dart';

@Component(
  selector: 'tech-article',
  template: '''
  <h1>I am  a test</h1>
  <p><code>final code = 123;</code></p>
  <div class="article-contents" [innerHTML]="fromMarkdown">Loading...</div>
  ''',
  styleUrls: ['github.css', 'article.css']
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