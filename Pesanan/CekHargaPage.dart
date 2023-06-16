import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CekHargaPage(),
    );
  }
}

class CekHargaPage extends StatefulWidget {
  const CekHargaPage({Key? key}) : super(key: key);

  @override
  _CekHargaPageState createState() => _CekHargaPageState();
}

class _CekHargaPageState extends State<CekHargaPage> {
  final PageController _pageController = PageController();

  bool? isChecked = false;
  int total = 0;
  TextEditingController beratController = TextEditingController();

  void hitungTotal() {
    total = 0;

    int hargaperkg = 7500;

    double berat = 0.0;

    berat = double.parse(beratController.text);

    berat = berat.ceilToDouble();

    total = (hargaperkg * berat).toInt();

    if (isChecked!) {
      total += 2500;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Cek Tarif Barang"),
        foregroundColor: Colors.black,
        backgroundColor: Colors.yellow,
      ),
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          onPageChanged: (int page) {
            setState(() {});
          },
          children: <Widget>[
            Column(
              //login
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    hintText: "Tujuan",
                    prefixIcon: const Icon(
                      Icons.location_city_outlined,
                      color: Colors.yellow,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    hintText: "Dari",
                    prefixIcon: const Icon(
                      Icons.location_city,
                      color: Colors.yellow,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    hintText: "Jenis Barang",
                    prefixIcon: const Icon(
                      Icons.add_box,
                      color: Colors.yellow,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: beratController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    hintText: "Berat",
                    counterText: "KG",
                    counterStyle: const TextStyle(fontWeight: FontWeight.bold),
                    prefixIcon: const Icon(
                      Icons.scale,
                      color: Colors.yellow,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CheckboxListTile(
                  title: const Text("Asuransi"),
                  value: isChecked,
                  activeColor: Colors.yellow,
                  onChanged: (newBool) {
                    setState(() {
                      isChecked = newBool;
                    });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.yellow,
                    padding: const EdgeInsets.all(16.0),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    setState(() {
                      hitungTotal();
                    });
                  },
                  child: const Text('Cek Harga'),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Total Harga: Rp. $total',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}