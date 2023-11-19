import 'dart:developer';

import 'package:test_231106/core/constants/constants.dart';
import 'package:test_231106/core/resources/data_state.dart';
import 'package:test_231106/feature/news/data/data_source/remote/news_api_service.dart';
import 'package:test_231106/feature/news/domain/repository/article_repository.dart';

import '../../../../core/http/request_handler.dart';
import '../model/article_model.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;

  ArticleRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    final response = await handleRequest<ArticleResponse>(() =>
        _newsApiService.getNewsArticles(
          newsApiKey: kNewsApiKey,
          language: 'fr',
          pageSize: 10,
        ));
    return DataSuccess(response.data?.articles ?? []);
  }
}
