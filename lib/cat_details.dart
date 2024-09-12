import 'package:flutter/material.dart';
    import 'package:news/api_manger.dart';
    import 'package:news/sources/view/widget/sources_tab.dart';
import 'package:news/sources/view_model/sources_view_model.dart';
    import 'package:news/widget/error_indicator.dart';
    import 'package:news/widget/loading_indicator.dart';
import 'package:news/widget/loading_indicator.dart';
import 'package:provider/provider.dart';

    class CategoryDetails extends StatefulWidget {

    const CategoryDetails(this.catId,  {
    super.key,

    });
    final String catId;

    @override
    State<CategoryDetails> createState() => _CategoryDetailsState();
    }

    class _CategoryDetailsState extends State<CategoryDetails> {
    final viewModel = sourceViewModel();

    @override
    void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSource(widget.catId);
  }
    @override
    Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_) => viewModel ,
   child: Consumer<sourceViewModel>(
     builder: (_, viewModel, __) {
      if(viewModel.isLoasding){
      return const loadingIndicator();
      }else if (viewModel.errorMassage != null){
      return errorIndicator(viewModel.errorMassage!);
      }else{
       return sourceTab(viewModel.sources);
      }
      }
   ),
    );
    }


    }






    // future: apiManger.getSources(widget.catId),
    // builder: (context, snapshot) {
    // if(snapshot.connectionState == ConnectionState.waiting){
    // return const loadingIndicator();
    // }else if (snapshot.hasError || snapshot.data?.status != 'ok' ){
    // return const errorIndicator();
    // }else{
    // final sources = snapshot.data?.sources ??[];
    // return sourceTab(sources);
    // }
    // }




