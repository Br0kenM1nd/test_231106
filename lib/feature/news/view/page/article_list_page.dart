import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entity/article_entity.dart';
import '../bloc/article/remote/remote_article_bloc.dart';
import '../widget/news_app_bar.dart';
import 'article_page.dart';

class ArticleListPage extends StatelessWidget {
  final List<ArticleEntity> articles;

  const ArticleListPage(this.articles, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NewsAppBar(),
      body: RefreshIndicator(
        onRefresh: () async =>
            context.read<RemoteArticleBloc>().add(const RemoteArticleGet()),
        child: ListView.builder(
          itemCount: articles.length,
          itemBuilder: (ctx, i) => ArticleTile(articles[i]),
        ),
      ),
    );
  }
}

class ArticleTile extends StatelessWidget {
  final ArticleEntity article;

  const ArticleTile(this.article, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.purple.shade700.withOpacity(.3),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => ArticlePage(article)),
        ),
        leading: article.urlToImage == null
            ? null
            : ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  article.urlToImage!,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
        title: Text(
          article.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Text(
          article.content,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.grey[600],
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}
