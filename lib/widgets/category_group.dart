import 'package:flutter/material.dart';
import 'package:animated_widgets/animated_widgets.dart';
import '../models/category.dart';
import 'category_card.dart';

class CategoryGroup extends StatelessWidget {
  final String groupName;
  final List<Category> categories;
  final String searchText;

  CategoryGroup({
    required this.groupName,
    required this.categories,
    required this.searchText,
  });

  @override
  Widget build(BuildContext context) {
    List<Category> filteredCategories = searchText.isEmpty
        ? categories
        : categories
            .where((category) =>
                category.title.toLowerCase().contains(searchText.toLowerCase()))
            .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedOpacity(
          duration: Duration(milliseconds: 500),
          opacity: searchText.isEmpty ? 1.0 : 0.0,
          child: Text(
            groupName,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(height: 10.0),
        GridView.count(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          childAspectRatio: 2.5,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: categories.map((category) {
            return ScaleAnimatedWidget.tween(
              duration: Duration(milliseconds: 500),
              scaleDisabled: 0,
              scaleEnabled: 1,
              enabled: filteredCategories.contains(category),
              child: CategoryCard(category: category),
            );
          }).toList(),
        ),
      ],
    );
  }
}
