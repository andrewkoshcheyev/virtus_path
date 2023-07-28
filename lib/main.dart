import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/categories_screen.dart';
import 'screens/favorites_screen.dart';
import 'screens/settings_screen.dart';
import 'models/quote.dart';
import 'screens/draft_screen02.dart';
import 'data/quotes_data.dart'; // import the quotes data
import 'helpers/database_helper.dart'; // import the database helper
import 'dart:io';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:flutter/foundation.dart';
import 'themes.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  if (!kIsWeb && (Platform.isMacOS || Platform.isWindows || Platform.isLinux)) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }
  runApp(const VirtusPathApp());
}

class VirtusPathApp extends StatelessWidget {
  // Create an instance of the database helper
  final dbHelper = DatabaseHelper.instance;

  const VirtusPathApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Clear the database
    dbHelper.clear();

    // Populate the database with the quotes data
    for (var quote in quotes) {
      dbHelper.insert(Quote(
        id: quote.id,
        text: quote.text,
        author: quote.author,
        imagePath: quote.imagePath,
        categories: quote.categories,
      ));
    }

    return MaterialApp(
      title: 'Virtus Path',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      /*ThemeData(
        primaryColor: Color(0xFF44355B),
        accentColor: Color(0xFFECA72C),
        backgroundColor: Color(0xFF221E22),
        errorColor: Color(0xFFEE5622),
        cardColor: Color(0xFFE5E5E5),
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Color(0xFFE5E5E5)),
        ),
      ),*/
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/challenges': (context) => const Draft02Screen(),
        '/categories': (context) => const CategoriesScreen(),
        '/favorites': (context) => const FavoritesScreen(),
      },
    );
  }
}
