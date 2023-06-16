import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:tubes_baru/sql_helper.dart';

class AlamatPage extends StatefulWidget {
  @override
  _AlamatPageState createState() => _AlamatPageState();
}

class _AlamatPageState extends State<AlamatPage> {
  Database? database;

  @override
  void initState() {
    super.initState();
    DatabaseHelper();
  }


  Future<void> insertAlamat(String nama, String alamat) async {
    await database!.insert(
      'alamat',
      {'nama': nama, 'alamat': alamat},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getAlamat() async {
    return database!.query('alamat');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alamat'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: getAlamat(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final alamatList = snapshot.data!;
            return ListView.builder(
              itemCount: alamatList.length,
              itemBuilder: (context, index) {
                final alamat = alamatList[index];
                return ListTile(
                  title: Text(alamat['nama']),
                  subtitle: Text(alamat['alamat']),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          return CircularProgressIndicator();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              String nama = '';
              String alamat = '';

              return AlertDialog(
                title: Text('Tambah Alamat'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      onChanged: (value) {
                        nama = value;
                      },
                      decoration: InputDecoration(
                        labelText: 'Nama',
                      ),
                    ),
                    TextField(
                      onChanged: (value) {
                        alamat = value;
                      },
                      decoration: InputDecoration(
                        labelText: 'Alamat',
                      ),
                    ),
                  ],
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      insertAlamat(nama, alamat);
                      Navigator.of(context).pop();
                    },
                    child: Text('Simpan'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
