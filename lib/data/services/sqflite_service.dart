import 'dart:io';
import 'package:flutter_assignment/data/models/product.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqfLiteService {
  static const String tableName = "products_tb";

  static Database? _database;
  static final SqfLiteService instance = new SqfLiteService._();
  SqfLiteService._();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await initDb();
    return _database!;
  }

  Future<Database> initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "products.db");
    Database dbCreated =
        await openDatabase(path, version: 1, onCreate: _onCreate);
    return dbCreated;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
     CREATE TABLE $tableName(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        productName TEXT NOT NULL,
        productUrl TEXT NOT NULL,
        productRating INTEGER NOT NULL,
        productDescription TEXT NOT NULL);
        ''');
  }

  Future<void> addProducts(List<Product> products) async {
    var db = await database;
    for (Product product in products) {
      int result = await db.insert("$tableName", product.toJson());
    }
  }

  Future<List<Product>> getAllProducts() async {
    var db = await database;
    var result = await db.query(
      "$tableName",
    );
    if (result.isEmpty) return [];
    return result.map((row) => Product.fromJson(row)).toList();
  }

  Future close() async {
    var db = await database;
    db.close();
  }
}
