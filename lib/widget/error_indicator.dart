import 'package:flutter/material.dart';

class errorIndicator extends StatelessWidget {
  const errorIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('SomeThing went Wrong!',
      style: Theme.of(context).textTheme.titleLarge!.copyWith(
        color: Colors.red
      ),),
    );
  }
}
