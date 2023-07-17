import 'package:flutter/material.dart';
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
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return ScaleTransition(child: child, scale: animation);
          },
          child: searchText.isEmpty
              ? Text(
                  groupName,
                  key: ValueKey(groupName),
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )
              : Container(),
        ),
        SizedBox(height: searchText.isEmpty ? 10.0 : 0.0),
        GridView.count(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          childAspectRatio: 2.5,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: categories
              .map((category) => CategoryCard(category: category))
              .toList(),
        ),
      ],
    );
  }
}
