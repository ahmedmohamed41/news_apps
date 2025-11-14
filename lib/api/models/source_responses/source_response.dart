import 'package:news_app/api/models/source_responses/source.dart';

class SourceResponse {
  String? status;
  String? code;
  String? message;
  List<Source>? sources;

  SourceResponse({this.status, this.sources, this.code, this.message});

  SourceResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    if (json['sources'] != null) {
      sources = <Source>[];
      json['sources'].forEach((v) {
        sources!.add(Source.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (sources != null) {
      data['sources'] = sources!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
