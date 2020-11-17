import 'package:finance_news/core/errors/failures.dart';
import 'package:finance_news/core/usecases/usecase.dart';
import 'package:finance_news/features/news/domain/entities/article.dart';
import 'package:finance_news/features/news/domain/entities/category.dart';
import 'package:finance_news/features/news/domain/usecases/get_articles.dart';
import 'package:finance_news/features/news/domain/usecases/get_categories.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'news_store.g.dart';

@lazySingleton
class NewsStore = _NewsStore with _$NewsStore;

abstract class _NewsStore with Store {
  final GetCategories _getCategories;
  final GetArticles _getArticles;

  @observable
  List<Category> categories = [];

  @observable
  ObservableMap<String, List<Article>> articles = ObservableMap();

  @observable
  ObservableMap<String, String> errors = ObservableMap();

  _NewsStore(this._getCategories, this._getArticles);

  @action
  Future initialize() async {
    final result = await _getCategories(const NoParams());
    result.foldRight(null, (categories, _) => this.categories = categories);
  }

  Future fetch(Category category) async {
    if (!articles.containsKey(category.name)) {
      final result = await _getArticles(category.url);
      result.fold(
        (failure) => errors[category.name] = _failureToMessage(failure),
        (articles) => this.articles[category.name] = articles,
      );
    }
  }

  String _failureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case NetworkFailure:
        return 'Você não está conectado na rede.';
      default:
        return 'Ocorreu um erro desconhecido.';
    }
  }
}
