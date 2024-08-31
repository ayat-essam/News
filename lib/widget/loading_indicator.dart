import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
class loadingIndicator extends StatelessWidget {
  const loadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: appTheme.primary,
      ),
    );
  }
}
