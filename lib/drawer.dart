import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';

class drawer extends StatelessWidget {
  drawer({
   super.key,
   required this.onItemSelection
});
   final void Function(DrawerItem) onItemSelection ;

  @override
  Widget build(BuildContext context) {
    final titleLargeStyle = Theme.of(context)
        .textTheme
        .titleLarge!
        .copyWith(fontSize: 24);

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            width: double.infinity,
            color: appTheme.primary,
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'News App!',
                style: titleLargeStyle.copyWith(color: appTheme.white),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsetsDirectional.only(top: 16, start: 16),
              color: appTheme.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      onItemSelection(DrawerItem.Categories);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Row(
                        children: [
                          Icon(Icons.menu_outlined, color: appTheme.black),
                          SizedBox(width: 16),
                          Text(
                            'Categories',
                            style: titleLargeStyle.copyWith(color: appTheme.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      onItemSelection(DrawerItem.Settings);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Row(
                        children: [
                          Icon(Icons.settings, color: appTheme.black),
                          SizedBox(width: 16),
                          Text(
                            'Settings',
                            style: titleLargeStyle.copyWith(color: appTheme.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
enum DrawerItem{
  Categories,
  Settings;
}