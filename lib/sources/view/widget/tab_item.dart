import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';

class TabItem extends StatelessWidget {
  const TabItem({
    super.key,
    required this.isSelected,
    required this.source,
  });

  final bool isSelected;
  final String source;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? appTheme.primary : Colors.transparent,
        borderRadius: const BorderRadius.all(Radius.circular(25)),
        border: Border.all(color: appTheme.primary, width: 2),
      ),
      child: Text(
        source,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
          color: isSelected ? appTheme.white : appTheme.primary,
        ),
      ),
    );
  }
}
