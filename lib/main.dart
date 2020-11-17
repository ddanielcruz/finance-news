import 'package:finance_news/injection.dart';
import 'package:finance_news/routes.dart';
import 'package:finance_news/theme.dart';
import 'package:flutter/material.dart' hide Theme;
import 'package:injectable/injectable.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection(Environment.prod);
  runApp(App());
}

class App extends StatelessWidget {
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
