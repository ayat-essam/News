import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/cat_item.dart';
import 'package:news/cat_model.dart';

class categorygrid extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = [
      CategoryModel(name: 'sports',
          imageName: 'ball.png',
          color: Color(0xffC91C22)),
      CategoryModel(name: 'politics',
          imageName: 'Politics.png',
          color: Color(0xff003E90)),
      CategoryModel(name: 'Health',
          imageName: 'health.png',
          color: Color(0xffED1E79)),
      CategoryModel(name: 'bussines',
          imageName: 'bussines.png',
          color: Color(0xffCF7E48)),
      CategoryModel(name: 'Environment',
          imageName: 'environment.png',
          color: Color(0xff4882CF)),
      CategoryModel(name: 'Science',
          imageName: 'science.png',
          color: Color(0xffF2D352)),


    ];
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
          padding: const EdgeInsets.all(24),
          child: Text(
              ' Pick your category'
                  ' of interest ',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(color: appTheme.navy),
          )
          ),
          Expanded(
            child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
            mainAxisSpacing: 24,
            crossAxisSpacing: 24),

            itemBuilder: (_, index) => CategoryItem(index: index,
            categoryModel: categories[index],
            )
              ,
            itemCount: categories.length,),
          )
        ],
      ),
    );
  }
}
