import 'package:finance_news/features/news/data/models/article_model.dart';

abstract class ArticleRemoteDataSource {
  Future<List<ArticleModel>> fetch(String url);
}
