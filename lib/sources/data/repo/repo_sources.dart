import 'package:news/sources/data/data_source/sources_data_sources.dart';
import 'package:news/sources/data/model/SourcesResponse.dart';

class sourcesRepo{
   final sourcesDataSourcs dataSourcs;
   sourcesRepo (this.dataSourcs);
  Future<List<Sources>> getSources (String catId) async{
  return dataSourcs.getSources(catId);
  }
}