import 'package:test_231106/core/resources/data_state.dart';
import 'package:test_231106/core/use_case/use_case.dart';
import 'package:test_231106/feature/news/domain/entity/article_entity.dart';
import 'package:test_231106/feature/news/domain/repository/article_repository.dart';

class GetArticleUseCase
    implements UseCase<DataState<List<ArticleEntity>>, void> {
  final ArticleRepository _articleRepository;

  const GetArticleUseCase(this._articleRepository);

  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRepository.getNewsArticles();
  }
}
