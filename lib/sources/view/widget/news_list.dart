import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/news/news_item.dart';
import 'package:news/sources/view_model/news_state.dart';
import 'package:news/sources/view_model/news_view_model.dart';
import 'package:news/widget/error_indicator.dart';
import 'package:news/widget/loading_indicator.dart';

class NewsList extends StatefulWidget {
  const NewsList(this.newsId,
      {super.key});

  final String newsId ;
  @override
  State<NewsList> createState() => _newsListState();
}

class _newsListState extends State<NewsList> {
  final viewModel = NewsViewModel();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocBuilder<NewsViewModel,NewsState>(
          builder: (context , state) {
            if (state is GetNewsLoading){
              return const loadingIndicator();
            }else if(state is GetNewsError){
              return errorIndicator(state.message);
            }else if(state is GetNewsSucces){
            return ListView.builder(
            itemBuilder: (_, index) =>newsItem(state.articleList[index]) ,
            itemCount: state.articleList.length,);
            }
            else{
            return const SizedBox();
            }
          }),);
  }
}