import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/quote.dart';
import 'dart:convert';

class DatabaseHelper {
  static const _databaseName = "quotesDatabase.db";
  static const _databaseVersion = 1;

  static const table = 'quotes';

  static const columnId = '_id';
  static const columnText = 'text';
  static const columnAuthor = 'author';
  static const columnImagePath = 'imagePath';
  static const columnCategories = 'categories';

  // make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $columnText TEXT NOT NULL,
            $columnAuthor TEXT NOT NULL,
            $columnImagePath TEXT NOT NULL,
            $columnCategories TEXT NOT NULL
          )
          ''');
  }

  // Helper methods

  // Inserts a row in the database where each key in the Map is a column name
  // and the value is the column value. The return value is the id of the
  // inserted row.
  Future<int> insert(Quote quote) async {
    Database db = await instance.database;
    Map<String, dynamic> row = {
      columnText: quote.text,
      columnAuthor: quote.author,
      columnImagePath: quote.imagePath,
      columnCategories: jsonEncode(quote.categories),
    };
    return await db.insert(table, row);
  }

  // All of the rows are returned as a list of maps, where each map is
  // a key-value list of columns.
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(table);
  }

  // All of the methods (insert, query, update, delete) can also be done using
  // raw SQL commands. This method uses a raw query to give the row count.
  Future<int> queryRowCount() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $table'))!;
  }

  // We are assuming here that the id column in the map is set. The other
  // column values will be used to update the row.
  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[columnId];
    return await db.update(table, row, where: '$columnId = ?', whereArgs: [id]);
  }

  // Deletes the row specified by the id. The number of affected rows is
  // returned. This should be 1 as long as the row exists.
  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }

  // Clears all rows from the table
  Future<void> clear() async {
    Database db = await instance.database;
    await db.rawDelete('DELETE FROM $table');
  }

  Future<List<Quote>> getQuotes() async {
    final rows = await queryAllRows();
    return rows.map((row) => Quote.fromMap(row)).toList();
  }
}
