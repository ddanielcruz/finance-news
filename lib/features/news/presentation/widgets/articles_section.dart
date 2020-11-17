import 'package:finance_news/features/news/domain/entities/article.dart';
import 'package:finance_news/features/news/domain/entities/category.dart';
import 'package:finance_news/features/news/presentation/store/news_store.dart';
import 'package:finance_news/features/news/presentation/widgets/article_card.dart';
import 'package:finance_news/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ArticlesSection extends StatefulWidget {
  final Category category;

  const ArticlesSection({
    @required Key key,
    @required this.category,
  }) : super(key: key);

  @override
  _ArticlesSectionState createState() => _ArticlesSectionState();
}

class _ArticlesSectionState extends State<ArticlesSection> {
  final store = getIt<NewsStore>();

  List<Article> get articles => store.articles[widget.category.name] ?? [];

  @override
  void initState() {
    store.fetch(widget.category);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: Add loading
    // TODO: Handle error
    return Observer(
      builder: (_) => ListView.separated(
        padding: const EdgeInsets.all(16),
        separatorBuilder: (ctx, idx) => const SizedBox(height: 16),
        itemCount: articles.length,
        itemBuilder: (ctx, idx) {
          final article = articles[idx];
          return ArticleCard(
            key: Key(article.guid),
            article: article,
          );
        },
      ),
    );
  }
}