import 'package:news_app/data/api/models/article_response/article.dart';
import 'package:news_app/data/api/models/source_responses/source.dart';
import 'package:news_app/data/api/result.dart';

abstract class ArticleRepository {
   Future<Result<List<Articles>?>> getArticle(Source source);
}