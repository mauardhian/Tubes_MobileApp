import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tubes_baru/Account/AccountPage.dart';
import 'package:tubes_baru/Pesanan/Tracking.dart';
import 'package:tubes_baru/Pesanan/CekHargaPage.dart';
import 'package:tubes_baru/Pesanan/Pesanan.dart';

class MainPageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MainPage App',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    OrderPage(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Pesanan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 10),
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                )),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.dashboard,
                      size: 30,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.notifications,
                      size: 30,
                      color: Colors.white,
                    )
                  ],
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.only(left: 3, bottom: 15),
                  child: Text(
                    'Name',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                      wordSpacing: 2,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, left: 15, right: 15),
            child: Column(
              children: [
                Container(
                  child: CarouselSlider(
                    items: [
                      Image.asset('image/iklan1.jpg'),
                      Image.asset('image/iklan2.jpg'),
                      Image.asset('image/iklan3.jpg'),
                    ],
                    options: CarouselOptions(
                      height: 250, // tinggi dari carousel
                      enlargeCenterPage: true, // perbesar halaman tengah
                      autoPlay: true, // otomatis memutar
                      aspectRatio: 16/9, // rasio aspek gambar
                      autoPlayCurve: Curves.fastOutSlowIn, // kurva animasi otomatis memutar
                      enableInfiniteScroll: true, // scroll tak terbatas
                      autoPlayAnimationDuration: Duration(milliseconds: 900), // durasi animasi otomatis memutar
                      viewportFraction: 0.8, // fraksi dari tampilan terlihat
                    ),
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 110,
                        width: 150,
                        child: IconButton(
                          icon: Column(
                            children: [
                              Icon(Icons.calculate),
                              Text('CalculatePrice'),
                            ],
                          ),
                          color: Colors.blue,
                          disabledColor: Colors.grey,
                          iconSize: 70,
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                                  return const CekHargaPage();
                                }));
                          }
                        ),
                      ),
                      Container(
                        height: 110,
                        width: 150,
                        child: IconButton(
                            icon: Column(
                              children: [
                                Icon(Icons.track_changes),
                                Text('Tracking'),
                              ],
                            ),
                            color: Colors.green,
                            disabledColor: Colors.grey,
                            iconSize: 70,
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                    return TrackingPage();
                                  }));
                            }
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AccountPage();
  }
}
