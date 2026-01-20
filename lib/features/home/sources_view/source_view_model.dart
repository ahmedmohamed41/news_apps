import 'package:flutter/cupertino.dart';
import 'package:news_app/data/api/models/source_responses/source.dart';
import 'package:news_app/data/api/result.dart';
import 'package:news_app/data/repository_impl/sources_repository_impl.dart';
import 'package:news_app/models/category_model.dart';

class SourceViewModel extends ChangeNotifier {
  SourcesRepositoryImpl sourcesRepositoryImpl;
  SourceViewModel({required this.sourcesRepositoryImpl});
  List<Source> sources = [];
  bool isLoading = false;
  String? errorMessage;
  Future<void> fetchSources(CategoryModel category) async {
    isLoading = true;
    notifyListeners();
    Result result = await sourcesRepositoryImpl.getSources(category);
    switch (result) {
      case Success():
        {
          isLoading = false;
          notifyListeners();
          sources = result.data;
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
