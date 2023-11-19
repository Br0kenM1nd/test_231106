import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../feature/auth/data/data_source/auth_api_service.dart';
import '../../feature/auth/data/data_source/mock_remote/auth_mock_api_service.dart';
import '../../feature/auth/data/repository/auth_repository_impl.dart';
import '../../feature/auth/domain/repository/auth_repository.dart';
import '../../feature/auth/domain/use_case/use_case.dart';
import '../../feature/auth/view/bloc/auth_bloc.dart';
import '../../feature/news/data/data_source/remote/news_api_service.dart';
import '../../feature/news/data/repository/article_repository_impl.dart';
import '../../feature/news/domain/repository/article_repository.dart';
import '../../feature/news/domain/use_case/get_article_use_case.dart';
import '../../feature/news/view/bloc/article/remote/remote_article_bloc.dart';

final di = GetIt.instance;

Future<void> initDI() async {
  _initCommon();
  _initAuthFeature();
  _initNewsFeature();
}

void _initCommon() {
  di.registerSingleton<Dio>(Dio());
}

void _initAuthFeature() {
  di.registerSingleton<AuthApiService>(AuthMockApiService());
  di.registerSingleton<AuthRepository>(
      AuthRepositoryImpl(di.get<AuthApiService>()));
  di.registerSingleton<AuthUseCase>(AuthUseCase(di.get<AuthRepository>()));
  di.registerSingleton<AuthBloc>(AuthBloc(di.get<AuthUseCase>()));
  // di.registerFactory<AuthBloc>(() => AuthBloc(di.get<AuthUseCase>()));
}

void _initNewsFeature() {
  di.registerSingleton<NewsApiService>(NewsApiService(di.get<Dio>()));
  di.registerSingleton<ArticleRepository>(
      ArticleRepositoryImpl(di.get<NewsApiService>()));
  di.registerSingleton(GetArticleUseCase(di.get<ArticleRepository>()));
  di.registerFactory(() => RemoteArticleBloc(di.get<GetArticleUseCase>()));
}
