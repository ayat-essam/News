import 'package:news/sources/data/model/SourcesResponse.dart';
import 'package:flutter/material.dart';
import '../data/data_source/sources_data.dart';

class sourceViewModel with ChangeNotifier{
  final dataSource = sourcesData();
  String? errorMassage ;
  bool isLoasding = false;
  List <Sources> sources = [];

  Future getSource (String catId) async{
    isLoasding = true;
    notifyListeners();
    try{
      final resbonce = await dataSource.getSources(catId);
      if(resbonce.status == 'ok' && resbonce.sources != null) {
        sources = resbonce.sources ?? [];
        notifyListeners();
      }else {
       errorMassage = 'Failed to get sources ';
       notifyListeners();
      }
    }
    catch(error) {
      errorMassage = error.toString();
    }
    notifyListeners();
    isLoasding = false;
    }

  }


