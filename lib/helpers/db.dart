import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DataBase {
  static Future<Database> db() async {
    // resolving the database path on the device :
    final databasePath = await getDatabasesPath();
    // Open the connection with the database or create one it doesn't exist:
    return openDatabase(join(databasePath, 'gallery.db'),
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE gallery(id TEXT PRIMARY KEY, title TEXT,image TEXT)');
    }, version: 1);
  }

  // insering in the database :
  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DataBase.db();
    db.insert(table, data, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, Object>>> fetch(String table) async {
    final db = await DataBase.db();
    return db.query(table);
  }
}
