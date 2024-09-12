import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../api_constant.dart';
import '../model/NewsResponse.dart';

class newsDataSource{
   Future<NewsResponse> getNews (String newsId) async{
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