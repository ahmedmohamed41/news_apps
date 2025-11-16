import 'package:flutter/widgets.dart';
import 'package:news_app/api/api_service.dart';
import 'package:news_app/api/models/article_response/article.dart';
import 'package:news_app/api/result.dart';

class SearchViewModel extends ChangeNotifier {
  List<Articles> articles = [];
  bool isLoading = false;
  String? errorMessage;
  Future<void> fetchSearchArticles(String q) async {
    if (q.isEmpty) {
      articles = [];
      errorMessage = null;
      notifyListeners();
      return;
    }
    isLoading = true;
    notifyListeners();
    Result result = await ApiService.getSearchArticle(q);
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
