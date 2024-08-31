import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/cat_item.dart';
import 'package:news/cat_model.dart';

class categorygrid extends StatelessWidget {

  final void Function(CategoryModel) onCategorySelected;
  categorygrid({
    super.key,
    required this.onCategorySelected
});

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = [
      CategoryModel(id: 'sports',
          name: 'sports',
          imageName: 'ball.png',
          color: Color(0xffC91C22)),
      CategoryModel(id: 'general',
          name: 'general',
          imageName: 'Politics.png',
          color: Color(0xff003E90)),
      CategoryModel(id: 'Health',
          name: 'Health',
          imageName: 'health.png',
          color: Color(0xffED1E79)),
      CategoryModel(id: 'business',
          name: 'business',
          imageName: 'bussines.png',
          color: Color(0xffCF7E48)),
      CategoryModel(id: 'entertainment',
          name: 'entertainment',
          imageName: 'environment.png',
          color: Color(0xff4882CF)),
      CategoryModel(id: 'Science',
          name: 'Science',
          imageName: 'science.png',
          color: Color(0xffF2D352)),
      CategoryModel(id: 'technology',
          name: 'technology',
          imageName: 'download.jpeg',
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

            itemBuilder: (_, index) {
              final categoryModel = categories[index];
              return InkWell(
                onTap: () => onCategorySelected(categoryModel),
                child: CategoryItem(index: index,
                  categoryModel: categories[index],
                ),
              );
            } ,
            itemCount: categories.length,),
          )
        ],
      ),
    );
  }
}
