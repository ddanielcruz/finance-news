import 'package:finance_news/features/news/presentation/store/news_store.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Finance News'),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'Últimas'),
              Tab(text: 'Mercados'),
              Tab(text: 'Finanças'),
              Tab(text: 'Política'),
              Tab(text: 'Negócios'),
              Tab(text: 'Consumo'),
              Tab(text: 'Carreira'),
              Tab(text: 'Economia'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(),
            Container(),
            Container(),
            Container(),
            Container(),
            Container(),
            Container(),
            Container(),
          ],
        ),
      ),
    );
  }
}
