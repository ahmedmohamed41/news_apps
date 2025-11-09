import 'package:news_app/core/resources/assets_manager.dart';

class CategoryModel {
  String id;
  String title;
  String imagePath;
  CategoryModel({
    required this.id,
    required this.title,
    required this.imagePath,
  });

  static List<CategoryModel> categories = [
    CategoryModel(
      id: 'general',
      title: 'General',
      imagePath: AssetManager.general,
    ),
    CategoryModel(
      id: 'business',
      title: 'Business',
      imagePath: AssetManager.business,
    ),
    CategoryModel(
      id: 'sports',
      title: 'Sports',
      imagePath: AssetManager.sports,
    ),
    CategoryModel(
      id: 'health',
      title: 'Health',
      imagePath: AssetManager.health,
    ),
    CategoryModel(
      id: 'entertainment',
      title: 'Entertainment',
      imagePath: AssetManager.entertainment,
    ),
    CategoryModel(
      id: 'technology',
      title: 'Technology',
      imagePath: AssetManager.technology,
    ),
    CategoryModel(
      id: 'science',
      title: 'Science',
      imagePath: AssetManager.science,
    ),
  ];
}
