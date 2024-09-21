import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/sources/data/repo/news%20repo.dart';
import 'package:news/sources/data/service_locator.dart';
import 'package:news/sources/view_model/news_state.dart';


class NewsViewModel extends Cubit<NewsState> {
  late final NewsRepo newsRepo ;

  NewsViewModel() : super(NewsRepo as NewsState) {
    newsRepo = NewsRepo(ServiceLocator.newsDataSource);
  }

  Future<void> getNews(String newsId) async {
    emit(GetNewsLoading());
    try {
      final articleList = await newsRepo.getNews(newsId);
      emit(GetNewsSucces(articleList));
    }
    catch (error) {
      emit(GetNewsError(error.toString()));
 }
  }

}
