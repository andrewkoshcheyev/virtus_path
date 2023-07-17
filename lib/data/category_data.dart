import 'package:flutter/material.dart';
import '../models/category.dart';

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
  // Add more categories as needed
];

Map<String, List<Category>> categoryGroups = {
  'Most Popular': categories.sublist(0, 4),
  'Growth': categories.sublist(4, 8),
  'Health': categories.sublist(8, 12),
  'For You': categories.sublist(0, 4), // This is just a placeholder
};
