import 'package:flutter/material.dart';
import 'package:news_app/features/home/categories/category_view.dart';
import 'package:news_app/features/home/sources_view/sources_view.dart';
import 'package:news_app/generated/l10n.dart';
import 'package:news_app/models/category_model.dart';

class HomeProvider extends ChangeNotifier {
  Widget homeView = const CategoryView();
  String title = 'Home';

  void goToSources(CategoryModel category, BuildContext context) {
    homeView = SourcesView(
      category: category,
    );
    title = getLocalizedCategoryTitle(context, category.title);
    notifyListeners();
  }

  void goToHome(BuildContext context) {
    homeView = const CategoryView();
    title = S.of(context).home;
    Navigator.pop(context);
    notifyListeners();
  }

  String getLocalizedCategoryTitle(BuildContext context, String key) {
    final s = S.of(context);
    switch (key) {
      case 'Sports':
        return s.sports;
      case 'Business':
        return s.business;
      case 'Health':
        return s.health;
      case 'General':
        return s.general;
      case 'Entertainment':
        return s.entertainment;
      case 'Technology':
        return s.technology;
      default:
        return s.home;
    }
  }
}
