 import 'package:test_231106/feature/news/domain/entity/article_entity.dart';

import '../../../../core/resources/data_state.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getNewsArticles();
 }