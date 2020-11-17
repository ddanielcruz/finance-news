import 'package:finance_news/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:finance_news/core/usecases/usecase.dart';
import 'package:finance_news/features/news/domain/entities/category.dart';
import 'package:finance_news/features/news/domain/repositories/categories_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetCategories implements UseCase<List<Category>, NoParams> {
  final CategoriesRepository repository;

  const GetCategories(this.repository);

  @override
  Future<Either<Failure, List<Category>>> call(NoParams params) async {
    return repository.getAll();
  }
}
