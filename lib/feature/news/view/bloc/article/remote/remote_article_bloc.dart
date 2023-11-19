import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_231106/core/resources/data_state.dart';
import 'package:test_231106/core/resources/exception_with_trace.dart';
import 'package:test_231106/feature/news/domain/use_case/get_article_use_case.dart';

import '../../../../domain/entity/article_entity.dart';

part 'remote_article_event.dart';

part 'remote_article_state.dart';

class RemoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {
  final GetArticleUseCase _getArticleUseCase;

  RemoteArticleBloc(this._getArticleUseCase)
      : super(const RemoteArticleInitial()) {
    on<RemoteArticleGet>(getArticles);
  }

  Future<void> getArticles(
    RemoteArticleGet event,
    Emitter<RemoteArticleState> emit,
  ) async {
    emit(const RemoteArticleLoadInProgress());

    final dataState = await _getArticleUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteArticleLoadSuccess(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(RemoteArticleLoadError(dataState.error!));
    }
  }
}
