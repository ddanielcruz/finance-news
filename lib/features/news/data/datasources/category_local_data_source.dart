import 'package:finance_news/features/news/domain/entities/category.dart';
import 'package:injectable/injectable.dart';

abstract class CategoryLocalDataSource {
  List<Category> getAll();
}

@LazySingleton(as: CategoryLocalDataSource)
class CategoryLocalDataSourceImpl implements CategoryLocalDataSource {
  @override
  List<Category> getAll() {
    return const [
      Category(
        name: 'Últimas',
        url: 'https://www.infomoney.com.br/feed',
      ),
      Category(
        name: 'Mercados',
        url: 'https://www.infomoney.com.br/mercados/feed',
      ),
      Category(
        name: 'Finanças',
        url: 'https://www.infomoney.com.br/minhas-financas/feed',
      ),
      Category(
        name: 'Política',
        url: 'https://www.infomoney.com.br/politica/feed',
      ),
      Category(
        name: 'Negócios',
        url: 'https://www.infomoney.com.br/negocios/feed',
      ),
      Category(
        name: 'Consumo',
        url: 'https://www.infomoney.com.br/consumo/feed',
      ),
      Category(
        name: 'Carreira',
        url: 'https://www.infomoney.com.br/carreira/feed',
      ),
      Category(
        name: 'Economia',
        url: 'https://www.infomoney.com.br/economia/feed',
      ),
    ];
  }
}
