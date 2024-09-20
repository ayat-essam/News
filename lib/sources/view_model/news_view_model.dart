import 'package:flutter/cupertino.dart';
import 'package:news/sources/data/data_source/news_api_data_source.dart';
import 'package:news/sources/data/repo/news%20repo.dart';
import 'package:news/sources/data/service_locator.dart';
import 'package:news/sources/view/widget/news_list.dart';

import '../data/model/NewsResponse.dart';

class newsViewModel with ChangeNotifier{
  final NewsRepo newsRepo ;

  newsViewModel():newsRepo = NewsRepo((ServiceLocator.newsDataSource));
 List<Article> ArticleList=[];
 bool isLoading = false;
 String? errorMassage;

 Future<void> getNews(String newsId) async{
   isLoading = true;
   notifyListeners();
   try{
      ArticleList = await newsRepo.getNews(newsId);
 }
 catch(error) {
 errorMassage = error.toString();
 }
 notifyListeners();
 isLoading = false;

   }
 }
