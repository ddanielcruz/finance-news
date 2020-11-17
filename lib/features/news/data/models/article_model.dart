import 'package:finance_news/features/news/domain/entities/article.dart';
import 'package:meta/meta.dart';

class ArticleModel extends Article {
  const ArticleModel({
    @required String guid,
    @required String title,
    @required String link,
    @required String image,
    @required DateTime publishedAt,
  }) : super(
          guid: guid,
          title: title,
          link: link,
          image: image,
          publishedAt: publishedAt,
        );
}
