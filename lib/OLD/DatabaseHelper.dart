import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;

    final directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, 'database.sqlite');

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        // Create your tables here if needed
      },
    );

    return _database!;
  }

  Future<List<Map<String, dynamic>>> getlines() async {
    final db = await database;
    
    return await db.query('bani_lines');
  }
}
