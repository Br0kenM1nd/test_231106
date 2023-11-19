import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/constants/constants.dart';
import '../../model/article_model.dart';

part 'news_api_service.g.dart';

@RestApi(baseUrl: kNewsApiBaseUrl)
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService;

  @GET('/top-headlines')
  Future<HttpResponse<ArticleResponse>> getNewsArticles({
    @Query('apikey') String? newsApiKey,
    @Query('language') String? language,
    @Query('pageSize') int? pageSize,
  });
}
