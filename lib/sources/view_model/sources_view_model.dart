import 'package:news/sources/data/data_source/sources_data_sources.dart';
import 'package:news/sources/data/model/SourcesResponse.dart';
import 'package:flutter/material.dart';
import 'package:news/sources/data/repo/repo_sources.dart';
import 'package:news/sources/data/service_locator.dart';
import '../data/data_source/api_sources_data.dart';

class sourceViewModel with ChangeNotifier{
  final sourcesRepo response;
  sourceViewModel(): response =sourcesRepo(ServiceLocator.sourcsDataSource);

String? errorMassage ;
  bool isLoasding = false;
  List <Sources> sources = [];

  Future getSource (String catId) async{
    isLoasding = true;
    notifyListeners();
    try{
      final resbonce = await response.getSources(catId);

    }
    catch(error) {
      errorMassage = error.toString();
    }
    notifyListeners();
    isLoasding = false;
    }

  }


