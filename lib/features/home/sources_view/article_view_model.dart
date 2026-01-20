import 'package:flutter/cupertino.dart';
import 'package:news_app/data/api/models/article_response/article.dart';
import 'package:news_app/data/api/models/source_responses/source.dart';
import 'package:news_app/data/api/result.dart';
import 'package:news_app/data/repository_impl/article_repository_impl.dart';

class ArticleViewModel extends ChangeNotifier {
  ArticleRepositoryImpl articleRepositoryImpl;
  ArticleViewModel({required this.articleRepositoryImpl});
  List<Articles> articles = [];
  bool isLoading = false;
  String? errorMessage;
  Future<void> fetchArticles(
    Source source,
  ) async {
    isLoading = true;
    notifyListeners();
    Result result = await articleRepositoryImpl.getArticle(source);

    switch (result) {
      case Success():
        {
          isLoading = false;
          notifyListeners();
          articles = result.data;
        }
      case ServerError():
        {
          isLoading = false;
          notifyListeners();
          errorMessage = result.message;
        }
      case Error():
        {
          isLoading = false;
          notifyListeners();
          errorMessage = result.exception;
        }
    }
  }
}
