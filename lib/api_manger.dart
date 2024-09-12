import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news/api_constant.dart';
import 'sources/data/model/NewsResponse.dart';
import 'sources/data/model/SourcesResponse.dart';

class apiManger{

  static Future <SourcesResponse> getSources (String catId) async{
    final uri = Uri.https(
        ApiConst.baseUrl,
    ApiConst.sourcesEndpoint,{
      'apiKey': ApiConst.apiKey,
          'category': catId
        });
    final response = await http.get(uri);
    final json = jsonDecode(response.body) ;
  return  SourcesResponse.fromJson(json);
  }
  static Future<NewsResponse> getNews (String newsId) async{
    final uri = Uri.https(ApiConst.baseUrl,
        ApiConst.newsEndpoint,{
          'apiKey': ApiConst.apiKey,
          'sources': newsId
        });
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return NewsResponse.fromJson(json);
  }
}


