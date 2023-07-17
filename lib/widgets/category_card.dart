import 'package:flutter/material.dart';
import '/models/category.dart';

class CategoryCard extends StatelessWidget {
  final Category category;

  CategoryCard({required this.category});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              category.title,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
            Icon(category.icon,
                size: 24.0, color: category.color ?? Colors.black),
          ],
        ),
      ),
    );
  }
}
