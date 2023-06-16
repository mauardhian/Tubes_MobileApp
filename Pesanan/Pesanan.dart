import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'my_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE orders (
        id INTEGER PRIMARY KEY,
        product_name TEXT,
        quantity INTEGER
      )
    ''');
  }

  Future<int> insertOrder(Map<String, dynamic> order) async {
    Database db = await database;
    return await db.insert('orders', order);
  }

  Future<List<Map<String, dynamic>>> getAllOrders() async {
    Database db = await database;
    return await db.query('orders');
  }

  Future<int> updateOrder(Map<String, dynamic> order) async {
    Database db = await database;
    return await db.update(
      'orders',
      order,
      where: 'id = ?',
      whereArgs: [order['id']],
    );
  }

  Future<int> deleteOrder(int id) async {
    Database db = await database;
    return await db.delete(
      'orders',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  List<Map<String, dynamic>> orders = [];
  bool isEditing = false;
  int editingOrderId = 0;

  void _getOrders() async {
    DatabaseHelper dbHelper = DatabaseHelper.instance;
    List<Map<String, dynamic>> result = await dbHelper.getAllOrders();
    setState(() {
      orders = result;
    });
  }

  void _placeOrder() async {
    String productName = productNameController.text;
    int quantity = int.tryParse(quantityController.text) ?? 0;

    if (productName.isNotEmpty && quantity > 0) {
      Map<String, dynamic> order = {
        'product_name': productName,
        'quantity': quantity,
      };

      if (isEditing) {
        order['id'] = editingOrderId;
        await _updateOrder(order);
      } else {
        await _insertOrder(order);
      }

      productNameController.clear();
      quantityController.clear();
      setState(() {
        isEditing = false;
        editingOrderId = 0;
      });
      _getOrders();
    }
  }

  Future<void> _insertOrder(Map<String, dynamic> order) async {
    DatabaseHelper dbHelper = DatabaseHelper.instance;
    await dbHelper.insertOrder(order);
    print('Order placed: $order');
  }

  Future<void> _updateOrder(Map<String, dynamic> order) async {
    DatabaseHelper dbHelper = DatabaseHelper.instance;
    await dbHelper.updateOrder(order);
    print('Order updated: $order');
  }

  void _editOrder(int orderId, String productName, int quantity) {
    setState(() {
      isEditing = true;
      editingOrderId = orderId;
      productNameController.text = productName;
      quantityController.text = quantity.toString();
    });
  }

  void _deleteOrder(int id) async {
    DatabaseHelper dbHelper = DatabaseHelper.instance;
    await dbHelper.deleteOrder(id);
    print('Order deleted with ID: $id');

    _getOrders();
  }

  @override
  void initState() {
    super.initState();
    _getOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Page'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: productNameController,
                  decoration: InputDecoration(
                    labelText: 'Product Name',
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: quantityController,
                  decoration: InputDecoration(
                    labelText: 'Quantity',
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: _placeOrder,
                  child: Text(isEditing ? 'Update Order' : 'Place Order'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: orders.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(orders[index]['product_name']),
                  subtitle: Text('Quantity: ${orders[index]['quantity']}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () => _editOrder(
                          orders[index]['id'],
                          orders[index]['product_name'],
                          orders[index]['quantity'],
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => _deleteOrder(orders[index]['id']),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App',
      home: OrderPage(),
    );
  }
}