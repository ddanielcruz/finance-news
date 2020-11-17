import 'package:finance_news/core/errors/exceptions.dart';
import 'package:finance_news/features/news/data/models/article_model.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:webfeed/webfeed.dart';

abstract class ArticleRemoteDataSource {
  Future<List<ArticleModel>> fetch(String url);
}

@LazySingleton(as: ArticleRemoteDataSource)
class ArticleRemoteDataSourceImpl implements ArticleRemoteDataSource {
  final Client client;

  const ArticleRemoteDataSourceImpl(this.client);

  @override
  Future<List<ArticleModel>> fetch(String url) async {
    try {
      final response = await client.get(url);
      final feedParsed = RssFeed.parse(response.body);
      return feedParsed.items
          .map((item) => ArticleModel.fromRss(item))
          .where((article) => article.image != null)
          .toList();
    } catch (e) {
      throw ServerException();
    }
  }
}
