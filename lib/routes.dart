import 'package:finance_news/features/news/presentation/pages/news_page.dart';
import 'package:flutter/widgets.dart';

abstract class Routes {
  static const news = '/';

  static Map<String, WidgetBuilder> build() {
    return {
      news: (_) => NewsPage(),
    };
  }
}
