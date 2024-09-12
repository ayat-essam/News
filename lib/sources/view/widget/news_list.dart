import 'package:flutter/material.dart';
import 'package:news/news/news_item.dart';
import 'package:news/sources/view_model/news_view_model.dart';
import 'package:news/widget/error_indicator.dart';
import 'package:news/widget/loading_indicator.dart';
import 'package:provider/provider.dart';
class newsList extends StatefulWidget {
  const newsList(this.newsId,
      {super.key});

  final String newsId ;
  @override
  State<newsList> createState() => _newsListState();
}

class _newsListState extends State<newsList> {
   final viewModel = newsViewModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => viewModel..getNews(widget.newsId),
    child: Consumer<newsViewModel>(builder: (_, viewModel, __) {
      if (viewModel.isLoading){
        return const loadingIndicator();
      }else if(viewModel.errorMassage != null){
        return errorIndicator(viewModel.errorMassage!);
      }else{
        return ListView.builder(
            itemBuilder: (_, index) =>newsItem(viewModel.ArticleList[index]) ,
        itemCount: viewModel.ArticleList.length,);
      }
    }),);
  }
}
