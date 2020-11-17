import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Article extends Equatable {
  final String guid;
  final String title;
  final String link;
  final String image;
  final DateTime publishedAt;

  const Article({
    @required this.guid,
    @required this.title,
    @required this.link,
    @required this.image,
    @required this.publishedAt,
  });

  @override
  List<Object> get props => [guid, title, link, image, publishedAt];
}
