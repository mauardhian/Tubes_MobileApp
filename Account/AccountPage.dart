import 'package:flutter/material.dart';
import 'package:tubes_baru/Account/Alamat.dart';
import 'package:tubes_baru/Login&Register/LoginPage.dart';
import 'KebijakanPrivasi.dart';
import 'Syarat&Ketentuan.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.zero,
        child: ListView(
          children: [
            Container(
              color: Colors.yellow,
              height: 200,
              child: Center(
                child: Column(
                  children: const <Widget>[
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                          'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Username',
                      style: TextStyle(fontSize: 28),
                    ),
                    Text('Usernam@gmail.com'),
                    Text('No.Hp')
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.white,
              height: 450,
              child: ListView(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      "Pengaturan",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 0,
                  ),
                  SizedBox(
                    height: 50,
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                return AlamatPage();
                              }));
                        },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.black12),
                        alignment: Alignment.centerLeft,
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Alamat',
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.black,
                              ),
                            ),
                            Icon(
                              Icons.navigate_next,
                              color: Colors.black,
                            ),
                          ]),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  /*SizedBox(
                    height: 50,
                    child: TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.black12),
                        alignment: Alignment.centerLeft,
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Keamanan',
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.black,
                              ),
                            ),
                            Icon(
                              Icons.navigate_next,
                              color: Colors.black,
                            ),
                          ]),
                    ),
                  ),*/
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      "Informasi Umum",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 0,
                  ),
                  SizedBox(
                    height: 50,
                    child: TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return KebijakanPrivasiPopup();
                          },
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.black12),
                        alignment: Alignment.centerLeft,
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Kebijakan Privasi',
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.black,
                              ),
                            ),
                            Icon(
                              Icons.navigate_next,
                              color: Colors.black,
                            ),
                          ]),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 50,
                    child: TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return SyaratKetentuanPopup();
                          },
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.black12),
                        alignment: Alignment.centerLeft,
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Syarat & Ketentuan',
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.black,
                              ),
                            ),
                            Icon(
                              Icons.navigate_next,
                              color: Colors.black,
                            ),
                          ]),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      height: 50,
                      width: 250,
                      color: Colors.yellow,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const LoginPage();
                          }));
                        },
                        child: const Text(
                          'LOGOUT',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
