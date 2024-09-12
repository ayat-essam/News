import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/cat_details.dart';
import 'package:news/cat_grid.dart';
import 'package:news/cat_model.dart';
import 'package:news/home/view/widget/drawer.dart';
import 'package:news/setting/view/widget/setting.dart';

class HomeScreen extends StatefulWidget {

static const String routeName = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: appTheme.white,
        image: (DecorationImage(image: AssetImage('assets/image/background.png')))
      ),
      child: Scaffold(
        drawer:  drawer(
            onItemSelection: onDrawerItemSelected ,),
      appBar: AppBar(centerTitle: true,
        title: const Text('News App')
      ),
        body: selectedCategory != null ? CategoryDetails(selectedCategory!.id,)
            : selectedDrawerItem == DrawerItem.Categories?
        categorygrid(onCategorySelected: onCategorySelected) : const Setting(),
      ),
    );
  }
  DrawerItem selectedDrawerItem = DrawerItem.Categories;
  CategoryModel? selectedCategory ;
  void onDrawerItemSelected (DrawerItem drawerItem){
    selectedDrawerItem = drawerItem;
    selectedCategory = null;
    setState(() {
    });
    Navigator.of(context).pop();

  }
  void onCategorySelected (CategoryModel categoryModel){
    selectedCategory = categoryModel;
    setState(() {});
  }
}

