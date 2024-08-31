import 'package:flutter/material.dart';
import 'package:news/api_manger.dart';
import 'package:news/tabs/sources_tab.dart';
import 'package:news/widget/error_indicator.dart';
import 'package:news/widget/loading_indicator.dart';

class CategoryDetails extends StatefulWidget {

  const CategoryDetails(this.catId,  {
    super.key,

});
  final String catId;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {


  @override
  Widget build(BuildContext context) {
  return  FutureBuilder(
      future: apiManger.getSources(widget.catId),
     builder: (context, snapshot) {
    if(snapshot.connectionState == ConnectionState.waiting){
      return const loadingIndicator();
    }else if (snapshot.hasError || snapshot.data?.status != 'ok' ){
      return const errorIndicator();
    }else{
      final sources = snapshot.data?.sources ??[];
          return sourceTab(sources);
    }
     }

    );

  }
}
