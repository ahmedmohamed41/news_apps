import 'package:news_app/data/api/models/article_response/article.dart';
import 'package:news_app/data/api/models/source_responses/source.dart';
import 'package:news_app/data/api/result.dart';
import 'package:news_app/models/category_model.dart';

abstract class SourcesRepository {
  Future<Result<List<Source>?>> getSources(CategoryModel category);
 
  Future<Result<List<Articles>?>> getSearchArticle(String q);
}
