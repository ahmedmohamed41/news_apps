import 'package:news_app/data/api/api_service.dart';
import 'package:news_app/data/api/models/article_response/article.dart';
import 'package:news_app/data/api/models/source_responses/source.dart';
import 'package:news_app/data/api/result.dart';
import 'package:news_app/data/data_sources/sources_data_sources.dart';
import 'package:news_app/models/category_model.dart';

class SourcesApiDataSources implements SourcesDataSources {
  ApiService apiService;
  SourcesApiDataSources({required this.apiService});
  @override
  Future<Result<List<Source>?>> getSources(CategoryModel category) async {
    var result = await apiService.getSources(category);
    return result;
  }

  
  @override
  Future<Result<List<Articles>?>> getArticlegetSearchArticle(String q)async {
    var result = await apiService.getSearchArticle(q);
    return result;
  }
}
