import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;

  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await initDb();
    return _db!;
  }

  DatabaseHelper.internal();

  Future<Database> initDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'mydatabase.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          'CREATE TABLE User(id INTEGER PRIMARY KEY, username TEXT, password TEXT, nama TEXT, NoHandphone TEXT)',
        );
      },
    );
  }

  Future<int> saveUser(Map<String, dynamic> user) async {
    final dbClient = await db;
    return await dbClient.insert('User', user);
  }

  Future<List<Map<String, dynamic>>> getUsers() async {
    final dbClient = await db;
    return await dbClient.query('User');
  }
  Future<void> insertAlamat(String nama, String alamat) async {
    final dbClient = await db;
    await dbClient.insert(
      'alamat',
      {'nama': nama, 'alamat': alamat},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getAlamat() async {
    final dbClient = await db;
    return dbClient.query('alamat');
  }
}



class dbpesanan {
  static final dbpesanan _instance = dbpesanan.internal();

  factory dbpesanan() => _instance;

  static late Database _database;

  dbpesanan.internal();

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }

    _database = await initDatabase();
    return _database;
  }

  Future<Database> initDatabase() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'your_database.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          '''
          CREATE TABLE IF NOT EXISTS orders (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            senderName TEXT,
            recipientName TEXT,
            senderPhoneNumber TEXT,
            recipientPhoneNumber TEXT,
            originAddress TEXT,
            destinationAddress TEXT,
            weight INTEGER,
            itemType TEXT
          )
          ''',
        );
      },
    );
  }

  Future<void> saveOrder(Map<String, dynamic> order) async {
    final db = await database;
    await db.insert('orders', order);
  }

  Future<List<Map<String, dynamic>>> getOrders() async {
    final db = await database;
    return await db.query('orders');
  }
}

