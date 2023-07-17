import 'package:flutter/material.dart';

class Category {
  final String title;
  final IconData icon;
  final Color color;

  Category({required this.title, required this.icon, required this.color});
}

List<Category> categories = [
  Category(title: 'Motivation', icon: Icons.flash_on, color: Colors.yellow),
  Category(title: 'Love', icon: Icons.favorite, color: Colors.red),
  Category(title: 'Work', icon: Icons.work, color: Colors.blue),
  Category(title: 'Friendship', icon: Icons.people, color: Colors.green),
  Category(title: 'Life', icon: Icons.brightness_3, color: Colors.orange),
  Category(
      title: 'Happiness', icon: Icons.sentiment_satisfied, color: Colors.pink),
  Category(title: 'Success', icon: Icons.star, color: Colors.purple),
  Category(title: 'Wisdom', icon: Icons.lightbulb, color: Colors.amber),
  Category(
      title: 'Inspiration',
      icon: Icons.wb_incandescent,
      color: Colors.lightBlue),
  Category(
      title: 'Health', icon: Icons.favorite_border, color: Colors.lightGreen),
  Category(title: 'Family', icon: Icons.group, color: Colors.brown),
  Category(title: 'Goals', icon: Icons.flag, color: Colors.cyan),
];

class CategoryGroup {
  final String title;
  final List<Category> categories;

  CategoryGroup({required this.title, required this.categories});
}

List<CategoryGroup> categoryGroups = [
  CategoryGroup(
    title: 'Most Popular',
    categories: [
      Category(title: 'Motivation', icon: Icons.flash_on, color: Colors.yellow),
      Category(title: 'Love', icon: Icons.favorite, color: Colors.red),
      // Add more categories as needed
    ],
  ),
  CategoryGroup(
    title: 'Growth',
    categories: [
      Category(
          title: 'Self-Development', icon: Icons.person, color: Colors.blue),
      Category(
          title: 'Growing Your Business',
          icon: Icons.business,
          color: Colors.green),
      // Add more categories as needed
    ],
  ),
  CategoryGroup(
    title: 'Health',
    categories: [
      Category(
          title: 'Healthy Lifestyle',
          icon: Icons.local_dining,
          color: Colors.orange),
      Category(
          title: 'Overcoming Addictions',
          icon: Icons.no_drinks,
          color: Colors.red),
      // Add more categories as needed
    ],
  ),
  CategoryGroup(
    title: 'For You',
    categories: [
      Category(
          title: 'Becoming the Best Version of Yourself',
          icon: Icons.star,
          color: Colors.purple),
      Category(title: 'Becoming a Man', icon: Icons.male, color: Colors.brown),
      // Add more categories as needed
    ],
  ),
  // Add more category groups as needed
];

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
            Flexible(
              child: Text(
                category.title,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
            ),
            Icon(category.icon,
                size: 24.0, color: category.color ?? Colors.black),
          ],
        ),
      ),
    );
  }
}

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                  Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    width: 200, // adjust this value as needed
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search',
                        suffixIcon: Icon(Icons.search, color: Colors.white),
                      ),
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Expanded(
                child: ListView.builder(
                  itemCount: categoryGroups.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          categoryGroups[index].title,
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
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
                          children: categoryGroups[index]
                              .categories
                              .where((category) => category.title
                                  .toLowerCase()
                                  .contains(
                                      _searchController.text.toLowerCase()))
                              .map((category) =>
                                  CategoryCard(category: category))
                              .toList(),
                        ),
                        SizedBox(height: 20.0),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
