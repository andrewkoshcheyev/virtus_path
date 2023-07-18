import 'package:flutter/material.dart';
import 'package:animated_widgets/animated_widgets.dart';
import '../models/category.dart';

class CategoryCard extends StatefulWidget {
  final Category category;

  CategoryCard({required this.category, Key? key}) : super(key: key);

  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleAnimatedWidget.tween(
      duration: Duration(milliseconds: 500),
      scaleDisabled: 0.0,
      scaleEnabled: 1.0,
      enabled: _animationController.value == 1.0,
      curve: Curves.easeInOut,
      child: Container(
        decoration: BoxDecoration(
          color: widget.category.color,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Center(
          child: Text(
            widget.category.title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
