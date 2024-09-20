import 'package:news/sources/data/model/SourcesResponse.dart';

abstract class sourcesDataSourcs{
  Future<List<Sources>> getSources  (String catId) ;
}