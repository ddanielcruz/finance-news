import 'package:finance_news/features/news/presentation/store/news_store.dart';
import 'package:finance_news/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final store = getIt<NewsStore>();

  @override
  void initState() {
    store.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => DefaultTabController(
        length: store.categories.length,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Finance News'),
            bottom: TabBar(
              isScrollable: true,
              tabs: store.categories
                  .map((category) => Tab(text: category.name))
                  .toList(),
            ),
          ),
          body: TabBarView(
            children: store.categories.map((category) => Container()).toList(),
          ),
        ),
      ),
    );
  }
}
