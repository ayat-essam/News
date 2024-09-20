import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news/news/news_data_source.dart';
import 'package:news/sources/data/repo/news%20repo.dart';

import '../../../api_constant.dart';
import '../model/NewsResponse.dart';

class newsApiDataSource extends NewsDataSource{
   Future<List<Article>> getNews (String newsId) async{
    final uri = Uri.https(ApiConst.baseUrl,
        ApiConst.newsEndpoint,{
          'apiKey': ApiConst.apiKey,
          'sources': newsId
        });
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    final newsRepo = NewsResponse.fromJson(json);
    if(newsRepo.status == 'ok' && newsRepo.articles != null){
      return newsRepo.articles!;
    }else{
      throw Exception("Failed to get news");
    }
  }
}