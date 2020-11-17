import 'package:dartz/dartz.dart';
import 'package:finance_news/core/errors/failures.dart';
import 'package:finance_news/features/news/domain/entities/category.dart';

abstract class CategoriesRepository {
  Future<Either<Failure, List<Category>>> getAll();
}
