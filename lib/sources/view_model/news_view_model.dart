import 'package:flutter/cupertino.dart';
import 'package:news/sources/data/data_source/news_data_source.dart';

import '../data/model/NewsResponse.dart';

class newsViewModel with ChangeNotifier{
 final dataSource = newsDataSource();
 List<Article> ArticleList=[];
 bool isLoading = false;
 String? errorMassage;

 Future<void> getNews(String newsId) async{
   isLoading = true;
   notifyListeners();
   try{
     final resbonce = await dataSource.getNews(newsId);
     if(resbonce.status == 'ok' && resbonce.articles != null){
    ArticleList = resbonce.articles?? [];
    notifyListeners();
     }
   else {
   errorMassage = 'Failed to get sources ';
   notifyListeners();
   }
 }
 catch(error) {
 errorMassage = error.toString();
 }
 notifyListeners();
 isLoading = false;

   }
 }
