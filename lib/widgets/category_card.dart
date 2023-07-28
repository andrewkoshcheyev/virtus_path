import 'package:flutter/material.dart';
import '../models/category.dart';
import 'package:animated_widgets/animated_widgets.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  @override
  final Key key;

  const CategoryCard({required this.category, required this.key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ScaleAnimatedWidget.tween(
        duration: const Duration(milliseconds: 500),
        scaleDisabled: 1,
        scaleEnabled: 0,
        enabled: key.toString().contains('search'),
        child: InkWell(
          onTap: () {
            // Removed the navigation to QuoteDetailScreen
          },
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Center(
              child: Text(category.title,
                  style: Theme.of(context).textTheme.displayMedium),
            ),
          ),
        ),
      ),
    );
  }
}
