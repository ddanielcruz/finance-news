import 'package:finance_news/core/usecases/usecase.dart';
import 'package:finance_news/features/news/domain/entities/category.dart';
import 'package:finance_news/features/news/domain/usecases/get_categories.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'news_store.g.dart';

@lazySingleton
class NewsStore = _NewsStore with _$NewsStore;

abstract class _NewsStore with Store {
  final GetCategories _getCategories;

  @observable
  List<Category> categories = [];

  _NewsStore(this._getCategories);

  @action
  Future initialize() async {
    final result = await _getCategories(const NoParams());
    result.foldRight(null, (categories, _) => this.categories = categories);
  }
}
