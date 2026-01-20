import 'package:flutter/widgets.dart';
import 'package:news_app/data/api/models/article_response/article.dart';
import 'package:news_app/data/api/result.dart';
import 'package:news_app/data/repository_impl/sources_repository_impl.dart';

class SearchViewModel extends ChangeNotifier {
  SourcesRepositoryImpl sourcesRepositoryImpl;
  SearchViewModel({required this.sourcesRepositoryImpl});
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
    Result result = await sourcesRepositoryImpl.getSearchArticle(q);
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
