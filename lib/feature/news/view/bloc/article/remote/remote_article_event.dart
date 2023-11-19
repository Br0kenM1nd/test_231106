part of 'remote_article_bloc.dart';

abstract class RemoteArticleEvent extends Equatable {
  const RemoteArticleEvent();
}

class RemoteArticleGet extends RemoteArticleEvent {
  const RemoteArticleGet();

  @override
  List<Object> get props => [];
}
