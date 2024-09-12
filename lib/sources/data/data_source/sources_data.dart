import 'dart:convert';
import '../../../api_constant.dart';
import '../model/SourcesResponse.dart';
import 'package:http/http.dart' as http;

class sourcesData{

   Future <SourcesResponse> getSources (String catId) async{
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
}