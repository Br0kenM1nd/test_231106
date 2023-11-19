import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/dependencies/injector.dart';
import '../../../../customization/common_widgets/default_loader.dart';
import '../bloc/article/remote/remote_article_bloc.dart';
import 'article_list_page.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  static const route = '/news';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticleBloc>(
      create: (_) => di.get<RemoteArticleBloc>()..add(const RemoteArticleGet()),
      child: BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
        builder: (context, state) => switch (state.runtimeType) {
          RemoteArticleLoadInProgress => const DefaultLoader(),
          RemoteArticleLoadSuccess => ArticleListPage(state.articles!),
          RemoteArticleLoadError => Text(state.error.toString()),
          _ => const SizedBox(),
        },
      ),
    );
  }
}
