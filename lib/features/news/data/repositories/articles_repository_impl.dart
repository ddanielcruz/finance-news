import 'package:finance_news/core/device/network_info.dart';
import 'package:finance_news/core/errors/exceptions.dart';
import 'package:finance_news/features/news/data/datasources/article_remote_data_source.dart';
import 'package:finance_news/features/news/domain/entities/article.dart';
import 'package:finance_news/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:finance_news/features/news/domain/repositories/articles_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

@LazySingleton(as: ArticlesRepository)
class ArticlesRepositoryImpl implements ArticlesRepository {
  final NetworkInfo networkInfo;
  final ArticleRemoteDataSource articleRemoteDataSource;

  const ArticlesRepositoryImpl({
    @required this.networkInfo,
    @required this.articleRemoteDataSource,
  });

  @override
  Future<Either<Failure, List<Article>>> fetch(String url) async {
    try {
      if (!await networkInfo.isConnected) {
        return const Left(NetworkFailure());
      }

      final articles = await articleRemoteDataSource.fetch(url);
      return Right(articles);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }
}
