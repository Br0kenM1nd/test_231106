part of 'remote_article_bloc.dart';

abstract class RemoteArticleState extends Equatable {
  final List<ArticleEntity>? articles;
  final ExceptionWithTrace? error;

  const RemoteArticleState({this.articles, this.error});

  @override
  List<Object?> get props => [articles, error];
}

class RemoteArticleInitial extends RemoteArticleState {
  const RemoteArticleInitial();
}

class RemoteArticleLoadInProgress extends RemoteArticleState {
  const RemoteArticleLoadInProgress();
}

class RemoteArticleLoadSuccess extends RemoteArticleState {
  const RemoteArticleLoadSuccess(List<ArticleEntity> articles)
      : super(articles: articles);
}

class RemoteArticleLoadError extends RemoteArticleState {
  const RemoteArticleLoadError(ExceptionWithTrace error) : super(error: error);
}
