import 'package:flutter/material.dart';
import 'package:test_231106/feature/news/domain/entity/article_entity.dart';

class ArticlePage extends StatelessWidget {
  final ArticleEntity article;

  const ArticlePage(this.article, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(article.title ?? '')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Text(article.content),
      ),
    );
  }
}
