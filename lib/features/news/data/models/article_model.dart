import 'package:finance_news/features/news/domain/entities/article.dart';
import 'package:meta/meta.dart';
import 'package:webfeed/webfeed.dart';

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

  factory ArticleModel.fromRss(RssItem item) {
    final hasImage = (item.content?.images?.length ?? 0) > 0;

    return ArticleModel(
      guid: item.guid,
      title: item.title,
      link: item.link,
      image: hasImage ? item.content.images.first : null,
      publishedAt: item.pubDate,
    );
  }
}
