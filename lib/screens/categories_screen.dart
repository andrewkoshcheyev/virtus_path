import 'package:flutter/material.dart';
import '../models/category.dart';
import '../data/category_data.dart';
import '../widgets/category_group.dart';
import 'package:animated_widgets/animated_widgets.dart';
import '../widgets/category_card.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;

  @override
  Widget build(BuildContext context) {
    List<Category> searchResults = [];
    if (_searchController.text.isNotEmpty) {
      for (var group in categoryGroups.entries) {
        searchResults.addAll(group.value
            .where((category) => category.title
                .toLowerCase()
                .contains(_searchController.text.toLowerCase()))
            .toList());
      }
    }

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  _isSearching
                      ? Expanded(
                          child: TextField(
                            controller: _searchController,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: 'Search',
                              hintStyle: TextStyle(color: Colors.white),
                              suffixIcon:
                                  Icon(Icons.search, color: Colors.white),
                            ),
                            onChanged: (value) {
                              setState(() {});
                            },
                          ),
                        )
                      : Text(
                          'Categories',
                          style: TextStyle(
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                  IconButton(
                    icon: Icon(Icons.search, color: Colors.white),
                    onPressed: () {
                      setState(() {
                        _isSearching = true;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Expanded(
                child: _searchController.text.isEmpty
                    ? ListView(
                        children: categoryGroups.entries.map((entry) {
                          return CategoryGroup(
                            groupName: entry.key,
                            categories: entry.value,
                            searchText: _searchController.text,
                          );
                        }).toList(),
                      )
                    : GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: 2.5,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        children: searchResults.map((category) {
                          return ScaleAnimatedWidget.tween(
                            duration: Duration(milliseconds: 600),
                            curve: Curves.easeInOut,
                            scaleDisabled: 0.8,
                            scaleEnabled: 1,
                            child: CategoryCard(
                                category: category,
                                key: ValueKey(category.title + 'search')),
                          );
                        }).toList(),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
