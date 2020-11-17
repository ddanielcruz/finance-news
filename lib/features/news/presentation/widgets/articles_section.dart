import 'package:finance_news/core/widgets/loading.dart';
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
  bool get isLoading => store.loadings[widget.category.name] ?? false;
  String get error => store.errors[widget.category.name];

  @override
  void initState() {
    store.fetch(widget.category);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        if (isLoading) {
          return const Loading();
        }

        if (error != null) {
          return _handleError();
        }

        return ListView.separated(
          key: PageStorageKey(widget.category.name),
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
        );
      },
    );
  }

  Widget _handleError() {
    final theme = Theme.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          error,
          style: theme.textTheme.headline3.copyWith(
            fontWeight: FontWeight.normal,
          ),
        ),
        const SizedBox(height: 16),
        RaisedButton(
          onPressed: () => store.fetch(widget.category),
          textColor: theme.textTheme.headline3.color,
          child: const Text(
            'Tentar novamente',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
