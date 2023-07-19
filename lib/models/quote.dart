import '../helpers/database_helper.dart';
import 'dart:convert';

class Quote {
  final int id;
  final String text;
  final String author;
  final String imagePath;
  List<String> categories;

  Quote(
      {required this.id,
      required this.text,
      required this.author,
      required this.imagePath,
      required this.categories});

  factory Quote.fromMap(Map<String, dynamic> map) {
    return Quote(
      id: map[DatabaseHelper.columnId],
      text: map[DatabaseHelper.columnText],
      author: map[DatabaseHelper.columnAuthor],
      imagePath: map[DatabaseHelper.columnImagePath],
      categories:
          (jsonDecode(map[DatabaseHelper.columnCategories]) as List<dynamic>)
              .cast<String>(),
    );
  }
}
