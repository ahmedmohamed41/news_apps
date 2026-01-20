import 'package:news_app/data/api/models/article_response/article.dart';
import 'package:news_app/data/api/models/source_responses/source.dart';
import 'package:news_app/data/api/result.dart';
import 'package:news_app/data/data_sources/article_data_sources.dart';
import 'package:news_app/repositories/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  ArticleDataSources articleDataSources;
  ArticleRepositoryImpl({required this.articleDataSources});
  @override
  Future<Result<List<Articles>?>> getArticle(Source source) async {
    var result = await articleDataSources.getArticle(source);
    return result;
  }
}
