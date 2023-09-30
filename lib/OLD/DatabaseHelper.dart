//this code i working with if we store db inside application

import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  Database? _database;

  Future<void> initializeDatabase(String path) async {
    //final String path = join(await getDatabasesPath(), 'database.sqlite');
    _database = await openDatabase(path, version: 1, onCreate: _createDatabase);
  }

  Future<void> _createDatabase(Database db, int version) async {}

  Future<List<Map<String, dynamic>>> fetchDataFromDatabase() async {
    return await _database!.query('languages', orderBy: "id");
  }
}
