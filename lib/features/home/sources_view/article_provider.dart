import 'package:flutter/cupertino.dart';
import 'package:news_app/api/api_service.dart';
import 'package:news_app/api/models/article_response/article.dart';
import 'package:news_app/api/models/source_responses/source.dart';
import 'package:news_app/api/result.dart';

class ArticleProvider extends ChangeNotifier {
  List<Articles> articles = [];
  bool isLoading = false;
  String? errorMessage;
  Future<void> fetchArticles(Source source) async {
    isLoading = true;
    notifyListeners();
    Result result = await ApiService.getArticle(source);

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
