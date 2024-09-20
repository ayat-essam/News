import 'package:news/news/news_data_source.dart';
import 'package:news/sources/data/model/NewsResponse.dart';

class NewsFirebaseDataSource extends NewsDataSource{
  @override
Future<List<Article>> getNews(String newsId) async{
  return [];
}
}