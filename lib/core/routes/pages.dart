import 'package:get/get.dart';

import '../../feature/auth/view/page/auth_page.dart';
import '../../feature/news/view/page/news_page.dart';
import 'loading_page.dart';

final pages = [
  GetPage(name: LoadingPage.route, page: () => const LoadingPage()),
  GetPage(name: AuthPage.route, page: () => const AuthPage()),
  GetPage(name: NewsPage.route, page: () => const NewsPage()),
];
