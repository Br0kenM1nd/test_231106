import 'package:json_annotation/json_annotation.dart';
import 'package:test_231106/core/mock_data/news_mock_data.dart';

import '../../domain/entity/article_entity.dart';

part 'article_model.g.dart';

@JsonSerializable()
class ArticleModel extends ArticleEntity {
  const ArticleModel({
    required int? id,
    required String? author,
    required String? title,
    required String? description,
    required String? url,
    required String? urlToImage,
    required String? publishedAt,
    required String? content,
  }) : super(
          id: id,
          author: author ?? '',
          title: title ?? '',
          description: description ?? '',
          url: url,
          urlToImage: urlToImage,
          publishedAt: publishedAt ?? '',
          content: content ?? NewsMockData.content,
        );

  factory ArticleModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleModelFromJson(json);
}

@JsonSerializable()
class ArticleResponse {
  final String? status;
  final int? totalResults;
  final List<ArticleModel>? articles;

  ArticleResponse({this.status, this.totalResults, this.articles});

  factory ArticleResponse.fromJson(Map<String, dynamic> json) =>
      _$ArticleResponseFromJson(json);
}
