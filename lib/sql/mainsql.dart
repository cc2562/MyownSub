import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

void addnewapp(app_data data) async {
  //late Future<Database> database;
  // Avoid errors caused by flutter upgrade.
  // Importing 'package:flutter/widgets.dart' is required.
  WidgetsFlutterBinding.ensureInitialized();
  // Open the database and store the reference.
  Directory databasesPath = await getApplicationSupportDirectory();
  final database  = openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    join(await databasesPath.path, 'miansubdb.db'),
    // When the database is first created, create a table to store dogs.
    onCreate: (db, version) {
      // Run the CREATE TABLE statement on the database.
      return db.execute(
        'CREATE TABLE subapp (id INTEGER PRIMARY KEY, app_name TEXT, icon_path TEXT, start_date TEXT, next_pay_date TEXT, last_pay_day TEXT, free_trail_day TEXT, pay_type INTEGER, app_type INTEGER, app_note TEXT, price TEXT)',
      );
    },
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    version: 1,
  );
  print("执行了");
  Future<void> addapp(app_data data) async {
    // Get a reference to the database.
    final db = await database;
    // Insert the Dog into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'subapp',
      data.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  //addapp(data);
  print(databasesPath.path);
}

class app_data {
  final int id;
  final String app_name;
  final String icon_path;
  final String start_date,
      next_pay_date,
      last_pay_date,
      free_trail_day,
      app_note,
      price;
  final int pay_type, app_type;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'app_name': app_name,
      'icon_path': icon_path,
      'start_date': start_date,
      'next_pay_date': next_pay_date,
      'last_pay_day': last_pay_date,
      'free_trail_day': free_trail_day,
      'pay_type': pay_type,
      'app_type': app_type,
      'app_note': app_note,
      'price': price
    };
  }

/*
  Future<Database> startdatabase() async {
    final database = openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
      join(await getDatabasesPath(), 'miansubdb.db'),
      // When the database is first created, create a table to store dogs.
      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        return db.execute(
          'CREATE TABLE subapps(id INTEGER PRIMARY KEY, app_name TEXT, icon_path TEXT,start_date TEXT,next_pay_date Text,last_pay_day Text,free_trail_day Text,pay_type INTEGER,app_type INTEGER,app_note TEXT)',
        );
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );
    return database;
  }
 */
  app_data(
    this.app_name,
    this.icon_path,
    this.start_date,
    this.next_pay_date,
    this.last_pay_date,
    this.free_trail_day,
    this.app_note,
    this.pay_type,
    this.app_type,
    this.price, {
    required this.id,
  });
}

// Define a function that inserts dogs into the database
