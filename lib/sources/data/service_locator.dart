import 'package:news/news/news_data_source.dart';
import 'package:news/sources/data/data_source/api_sources_data.dart';
import 'package:news/sources/data/data_source/news_api_data_source.dart';
import 'package:news/sources/data/data_source/sources_data_sources.dart';


class ServiceLocator{
  static sourcesDataSourcs sourcsDataSource = ApisourcesData();
  static NewsDataSource newsDataSource = newsApiDataSource();
}