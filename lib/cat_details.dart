import 'package:flutter/material.dart';
import 'package:news/news/news_item.dart';
import 'package:news/tabs/tab_item.dart';
class CategoryDetails extends StatefulWidget {

  const CategoryDetails(this.catId,  {
    super.key,

});
  final String catId;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {

  int selectedIndex = 0 ;
 final  sourse = List.generate(10, (index) => "Sourse $index");


  @override
  Widget build(BuildContext context) {
    return Column(
     children: [
       DefaultTabController(
         length: sourse.length,
         child: TabBar(
             isScrollable: true,
             indicatorColor:  Colors.transparent,
            dividerColor: Colors.transparent,
             tabAlignment: TabAlignment.start,
             onTap: (index) => setState(() => selectedIndex = index),
             tabs: sourse.map(
                 (sourse) => TabItem(
                   sourse: sourse,
                 isSelected: sourse == this.sourse[selectedIndex],))
             .toList()),
       ),
       Expanded(
         child: ListView.builder(
           itemCount: 10,
           itemBuilder: ( _,  index) => newsItem(

           ),

         ),
       )
     ],
    );
  }
}
