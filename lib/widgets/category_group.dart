import 'package:flutter/material.dart';
import '../models/category.dart';
import 'category_card.dart';
import 'package:animated_widgets/animated_widgets.dart';

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
    List<Category> searchResults = categories
        .where((category) =>
            category.title.toLowerCase().contains(searchText.toLowerCase()))
        .toList();

    List<Widget> categoryCards = (searchText.isEmpty
            ? categories
            : searchResults)
        .map((category) => ScaleAnimatedWidget.tween(
              duration: Duration(milliseconds: 600),
              curve: Curves.easeInOut,
              scaleDisabled: 0,
              scaleEnabled: 1,
              child: CategoryCard(
                  category: category,
                  key: ValueKey(
                      category.title + (searchText.isEmpty ? '' : 'search'))),
            ))
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedOpacity(
          duration: Duration(milliseconds: 500),
          opacity: searchText.isEmpty ? 1.0 : 0.0,
          child: ScaleAnimatedWidget.tween(
            duration: Duration(milliseconds: 600),
            curve: Curves.easeInOut,
            scaleDisabled: 0,
            scaleEnabled: 1,
            child: Text(
              groupName,
              style: Theme.of(context).textTheme.headline1,
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
          children: categoryCards,
        ),
      ],
    );
  }
}
