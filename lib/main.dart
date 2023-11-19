import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'core/dependencies/init.dart';
import 'core/dependencies/injector.dart';
import 'core/routes/loading_page.dart';
import 'core/routes/pages.dart';
import 'feature/auth/view/bloc/auth_bloc.dart';
import 'feature/auth/view/page/auth_page.dart';
import 'feature/news/view/bloc/article/remote/remote_article_bloc.dart';
import 'feature/news/view/page/news_page.dart';

Future<void> main() async {
  await initDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => di.get<AuthBloc>()..add(const AuthAppStarted())),
        BlocProvider(create: (_) => di.get<RemoteArticleBloc>()),
      ],
      child: GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark(useMaterial3: true),
        getPages: pages,
        builder: (context, child) => BlocListener<AuthBloc, AuthState>(
          listener: (context, state) => switch (state.runtimeType) {
            AuthInProgress => Get.offNamed(LoadingPage.route),
            AuthAuthenticated => Get.offNamed(NewsPage.route),
            _ => Get.offNamed(AuthPage.route),
          },
          child: child,
        ),
      ),
    );
  }
}
