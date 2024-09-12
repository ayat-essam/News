import 'package:flutter/material.dart';

class errorIndicator extends StatelessWidget {
  const errorIndicator(this.errorMassage,
      {super.key});
 final String errorMassage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(errorMassage,
      style: Theme.of(context).textTheme.titleLarge!.copyWith(
        color: Colors.red
      ),),
    );
  }
}
