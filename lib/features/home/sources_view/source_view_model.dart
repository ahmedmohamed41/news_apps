import 'package:flutter/cupertino.dart';
import 'package:news_app/api/api_service.dart';
import 'package:news_app/api/models/source_responses/source.dart';
import 'package:news_app/api/result.dart';
import 'package:news_app/models/category_model.dart';

class SourceViewModel extends ChangeNotifier {
  List<Source> sources = [];
  bool isLoading = false;
  String? errorMessage;
  Future<void> fetchSources(CategoryModel category) async {
    isLoading = true;
    notifyListeners();
    Result result = await ApiService.getSources(category);
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
