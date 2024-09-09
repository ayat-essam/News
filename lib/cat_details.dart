import 'package:flutter/material.dart';
class CategoryDetails extends StatelessWidget {

  const CategoryDetails(this.catId,  {
    super.key,

});
  final String catId;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(catId),
    );
  }
}
