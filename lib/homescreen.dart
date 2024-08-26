import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/cat_grid.dart';
class HomeScreen extends StatelessWidget {
static const String routeName = '/';
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: appTheme.white,
        image: (DecorationImage(image: AssetImage('assets/image/background.png')))
      ),
      child: Scaffold(
      appBar: AppBar(centerTitle: true,
        title: Text('News App')
      ),
        body: categorygrid(),
      ),
    );
  }
}
