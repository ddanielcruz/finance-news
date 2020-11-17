import 'package:finance_news/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:finance_news/core/usecases/usecase.dart';
import 'package:finance_news/features/news/domain/entities/article.dart';
import 'package:finance_news/features/news/domain/repositories/articles_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetArticles implements UseCase<List<Article>, String> {
  final ArticlesRepository repository;

  const GetArticles(this.repository);

  @override
  Future<Either<Failure, List<Article>>> call(String url) {
    return repository.fetch(url);
  }
}
