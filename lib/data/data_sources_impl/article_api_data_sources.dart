import 'package:news_app/data/api/api_service.dart';
import 'package:news_app/data/api/models/article_response/article.dart';
import 'package:news_app/data/api/models/source_responses/source.dart';
import 'package:news_app/data/api/result.dart';
import 'package:news_app/data/data_sources/article_data_sources.dart';

class ArticleApiDataSources implements ArticleDataSources {
  ApiService apiService;
  ArticleApiDataSources({required this.apiService});
  @override
  Future<Result<List<Articles>?>> getArticle(Source source) async {
    var result = await apiService.getArticle(source);
    return result;
  }
}
