import 'package:news/news/news_data_source.dart';
import 'package:news/sources/data/model/NewsResponse.dart';

class NewsRepo{
final NewsDataSource newsDataSource;
NewsRepo(this.newsDataSource);

Future<List<Article>> getNews(String newsId){

return newsDataSource.getNews(newsId);
}
}