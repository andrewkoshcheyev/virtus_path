import 'package:flutter/material.dart';
import '../models/category.dart';
import 'package:animated_widgets/animated_widgets.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  final Key key;

  CategoryCard({required this.category, required this.key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ScaleAnimatedWidget.tween(
        duration: Duration(milliseconds: 500),
        scaleDisabled: 1,
        scaleEnabled: 0,
        enabled: key.toString().contains('search'),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Center(
            child: Text(
              category.title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
