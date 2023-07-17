import 'package:flutter/material.dart';
import '../models/category.dart';
import 'category_card.dart';

class CategoryGroup extends StatelessWidget {
  final String groupName;
  final List<Category> categories;

  CategoryGroup({required this.groupName, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          groupName,
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 10.0),
        GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 2.5,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: categories
              .map((category) => CategoryCard(category: category))
              .toList(),
        ),
      ],
    );
  }
}
