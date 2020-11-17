import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Category extends Equatable {
  final String name;
  final String url;

  const Category({
    @required this.name,
    @required this.url,
  });

  @override
  List<Object> get props => [name, url];
}
