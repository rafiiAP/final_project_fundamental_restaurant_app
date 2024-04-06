import 'dart:async';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/restaurant_detail_model.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  static Database? _db;

  DatabaseHelper._internal();

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    String path = await getDatabasesPath();
    String dbPath = join(path, 'restaurants.db');

    return await openDatabase(dbPath, version: 1, onCreate: _createDb);
  }

  Future<void> _createDb(Database db, int version) async {
    // Create restaurants table
    await db.execute('''
      CREATE TABLE restaurants(
        id TEXT PRIMARY KEY,
        name TEXT,
        description TEXT,
        city TEXT,
        address TEXT,
        pictureId TEXT,
        rating REAL
      )
    ''');

    // Create foods table
    await db.execute('''
      CREATE TABLE foods(
        id INTEGER PRIMARY KEY,
        restaurantId TEXT,
        name TEXT
      )
    ''');

    // Create drinks table
    await db.execute('''
      CREATE TABLE drinks(
        id INTEGER PRIMARY KEY,
        restaurantId TEXT,
        name TEXT
      )
    ''');
  }

  // Insert data into tables
  Future<int> insertRestaurant(RestaurantDetailModel restaurant) async {
    final dbClient = await db;
    int id = await dbClient.insert('restaurants', restaurant.toJson());
    return id;
  }

  Future<int> insertFood(Drink food, String restaurantId) async {
    final dbClient = await db;
    food.restaurantId = restaurantId;
    int id = await dbClient.insert('foods', food.toJson());
    return id;
  }

  Future<int> insertDrink(Drink drink, String restaurantId) async {
    final dbClient = await db;
    drink.restaurantId = restaurantId;
    int id = await dbClient.insert('drinks', drink.toJson());
    return id;
  }

  // Get all data from tables
  Future<List<Map<String, dynamic>>> getAllRestaurants() async {
    final dbClient = await db;
    return await dbClient.query('restaurants');
  }

  Future<List<Map<String, dynamic>>> getRestaurantById(
      String restaurantId) async {
    final dbClient = await db;
    return await dbClient
        .query('restaurants', where: 'id = ?', whereArgs: [restaurantId]);
  }

  Future<List<Map<String, dynamic>>> getFoodsByRestaurantId(
      String restaurantId) async {
    final dbClient = await db;
    return await dbClient
        .query('foods', where: 'restaurantId = ?', whereArgs: [restaurantId]);
  }

  Future<List<Map<String, dynamic>>> getDrinksByRestaurantId(
      String restaurantId) async {
    final dbClient = await db;
    return await dbClient
        .query('drinks', where: 'restaurantId = ?', whereArgs: [restaurantId]);
  }

  Future<int> deleteRestaurantById(String restaurantId) async {
    final dbClient = await db;
    return await dbClient
        .delete('restaurants', where: 'id = ?', whereArgs: [restaurantId]);
  }

  Future<int> deleteFoodByRestaurantId(String restaurantId) async {
    final dbClient = await db;
    return await dbClient
        .delete('foods', where: 'restaurantId = ?', whereArgs: [restaurantId]);
  }

  Future<int> deleteDrinkByRestaurantId(String restaurantId) async {
    final dbClient = await db;
    return await dbClient
        .delete('drinks', where: 'restaurantId = ?', whereArgs: [restaurantId]);
  }

  // Close database
  Future close() async {
    final dbClient = await db;
    dbClient.close();
  }
}
