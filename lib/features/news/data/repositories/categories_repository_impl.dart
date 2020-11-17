import 'package:dartz/dartz.dart';
import 'package:finance_news/core/errors/failures.dart';
import 'package:finance_news/features/news/data/datasources/category_local_data_source.dart';
import 'package:finance_news/features/news/domain/entities/category.dart';
import 'package:finance_news/features/news/domain/repositories/categories_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CategoriesRepository)
class CategoriesRepositoryImpl implements CategoriesRepository {
  final CategoryLocalDataSource localDataSource;

  const CategoriesRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Failure, List<Category>>> getAll() async {
    final categories = localDataSource.getAll();
    return Right(categories);
  }
}
