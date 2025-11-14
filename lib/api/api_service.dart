import 'dart:convert';
import 'dart:io';
import 'package:news_app/api/models/article_response/article_response.dart';
import 'package:news_app/api/models/source_responses/source.dart';
import 'package:news_app/api/models/source_responses/source_response.dart';
import 'package:news_app/api/result.dart';
import 'package:news_app/models/category_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'newsapi.org';
  static const String apiKey = 'fe0764dd1dab457d99ba4899405c6bc8';
  static const String sourceEndPoint = '/v2/top-headlines/sources';
  static const String articleEndPoint = '/v2/everything';

  static Future<Result> getSources(CategoryModel category) async {
    try {
      Uri url = Uri.https(baseUrl, sourceEndPoint, {
        "apiKey": apiKey,
        "category": category.id,
      });
      http.Response response = await http.get(url);

      var json = jsonDecode(response.body);

      SourceResponse sourceResponse = SourceResponse.fromJson(json);
      if (sourceResponse.status == "error") {
        return ServerError(sourceResponse.message!);
      } else {
        return Success(sourceResponse.sources);
      }
    } on SocketException catch (e) {
      return Error(e.message);
    }
  }

  static Future<Result> getArticle(Source source) async {
    try {
      Uri url = Uri.https(baseUrl, articleEndPoint, {
        "apiKey": apiKey,
        "sources": source.id,
      });
      http.Response response = await http.get(url);

      var json = jsonDecode(response.body);
      ArticleResponse articleResponse = ArticleResponse.fromJson(json);
      if (articleResponse.status == "error") {
        return ServerError(articleResponse.message!);
      } else {
        return Success(articleResponse.articles);
      }
    } on SocketException catch (e) {
     return Error(e.message);
    }
  }
}
