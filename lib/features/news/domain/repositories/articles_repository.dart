import 'package:dartz/dartz.dart';
import 'package:finance_news/core/errors/failures.dart';
import 'package:finance_news/features/news/domain/entities/article.dart';

abstract class ArticlesRepository {
  Future<Either<Failure, List<Article>>> fetch(String url);
}
