import 'package:finance_news/routes.dart';
import 'package:finance_news/theme.dart';
import 'package:flutter/material.dart' hide Theme;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finance News',
      routes: Routes.build(),
      theme: Theme.build(),
      debugShowCheckedModeBanner: false,
    );
  }
}
