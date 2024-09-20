import 'package:news/sources/data/model/NewsResponse.dart';

abstract class NewsDataSource{
Future<List<Article>> getNews(String newsId) async{
  return [];
}
}