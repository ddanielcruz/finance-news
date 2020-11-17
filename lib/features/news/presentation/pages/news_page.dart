import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget {
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
