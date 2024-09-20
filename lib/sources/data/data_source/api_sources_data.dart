import 'dart:convert';
import 'package:news/sources/data/data_source/sources_data_sources.dart';

import '../../../api_constant.dart';
import '../model/SourcesResponse.dart';
import 'package:http/http.dart' as http;

class ApisourcesData extends sourcesDataSourcs{

   @override
  Future <List<Sources>> getSources (String catId) async {
     final uri = Uri.https(
         ApiConst.baseUrl,
         ApiConst.sourcesEndpoint, {
       'apiKey': ApiConst.apiKey,
       'category': catId
     });
     final response = await http.get(uri);
     final sourcesRepo = SourcesResponse.fromJson(response.body);
     if (sourcesRepo.status == 'ok' && sourcesRepo.sources != null) {
       return sourcesRepo.sources!;
     } else {
       throw Exception('Failed to get sources');
     }
   }
}