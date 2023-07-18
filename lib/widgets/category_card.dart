import 'package:flutter/material.dart';
import '../models/category.dart';
import '../screens/quote_detail_screen.dart';
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
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => QuoteDetailScreen(
                    quote: category.quotes[
                        0]), // pass the first quote of the category here
              ),
            );
          },
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
      ),
    );
  }
}
