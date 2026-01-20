import 'package:news_app/data/api/models/article_response/article.dart';
import 'package:news_app/data/api/models/source_responses/source.dart';
import 'package:news_app/data/api/result.dart';
import 'package:news_app/data/data_sources/sources_data_sources.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/repositories/sources_repository.dart';

class SourcesRepositoryImpl implements SourcesRepository {
  SourcesDataSources sourcesDataSources;
  SourcesRepositoryImpl({required this.sourcesDataSources});

  @override
  Future<Result<List<Source>?>> getSources(CategoryModel category) async {
    var result = await sourcesDataSources.getSources(category);
    return result;
  }

  @override
  Future<Result<List<Articles>?>> getSearchArticle(String q) async {
    var result = await sourcesDataSources.getArticlegetSearchArticle(q);
    return result;
  }
}
