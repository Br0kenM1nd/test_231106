import 'package:equatable/equatable.dart';

class ArticleEntity extends Equatable {
  final int? id;
  final String author;
  final String title;
  final String description;
  final String? url;
  final String? urlToImage;
  final String publishedAt;
  final String content;

  const ArticleEntity({
    required this.author,
    required this.title,
    required this.description,
    required this.publishedAt,
    required this.content,
    this.id,
    this.url,
    this.urlToImage,
  });

  @override
  List<Object?> get props =>
      [id, author, title, description, url, urlToImage, publishedAt, content];
}
