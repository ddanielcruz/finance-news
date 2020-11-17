import 'package:finance_news/features/news/domain/entities/category.dart';

abstract class CategoryLocalDataSource {
  List<Category> getAll();
}
