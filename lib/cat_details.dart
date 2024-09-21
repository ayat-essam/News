import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/sources/view/widget/sources_tab.dart';
import 'package:news/sources/view_model/sources_state.dart';
import 'package:news/sources/view_model/sources_view_model.dart';
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
    final viewModel = sourceViewModel();

    @override
    void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSource(widget.catId);
  }
    @override
    Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => viewModel ,
   child: BlocBuilder<sourceViewModel, SourcesState>(
     builder: (context, state) {
      if(state is GetSourceLoading){
      return const loadingIndicator();
      }else if (state is GetSourceError){
      return errorIndicator(state.message);
      }else if (state is GetSourceSucces){
       return sourceTab(state.sources);
      }else {
        return const SizedBox();
      }
      }
   ),
    );
    }


    }






