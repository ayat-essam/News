import 'package:flutter/material.dart';
import 'package:news/cat_model.dart';
class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key,
  required this.index,
  required this.categoryModel

  });

  final int index;
   final CategoryModel categoryModel ;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: categoryModel.color,
        borderRadius: BorderRadiusDirectional.only(
          topStart: const Radius.circular(25) ,
          topEnd: const Radius.circular(25) ,
          bottomStart: Radius.circular(index.isEven ? 25 : 0),
          bottomEnd: Radius.circular(index.isOdd ? 25 : 0)
        )
        ),


      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Image.asset('assets/image/${categoryModel.imageName}',
        height: MediaQuery.of(context).size.height * 0.12 ,),
          Text( categoryModel.name),

        ],
      ),
    );
  }
}
