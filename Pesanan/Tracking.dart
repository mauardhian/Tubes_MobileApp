import 'package:flutter/material.dart';
import 'package:tubes_baru/main.dart';
import 'package:tubes_baru/MainPage.dart';

class Tracking extends StatelessWidget {
  const Tracking({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TrackingPage(),
    );
  }
}

class TrackingPage extends StatelessWidget {
  const TrackingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tracking'),
      ),
      body: ListView(children: [
        const SizedBox(height: 20),
        Center(
          child: Column(children: const [Text('NO RESI'), Text('0293JDSADLJASDF')]),
        ),
        Container(
          margin: const EdgeInsets.only(top: 20),
          child: Row(
            children: [
              const SizedBox(
                width: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text(
                    '13 Mei',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    '17:47',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.more_horiz,
                color: Colors.green,
                size: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'Pesanan Dibuat',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 50),
          child: Row(
            children: [
              const SizedBox(
                width: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text(
                    '15 Mei',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    '17:08',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.more_horiz,
                color: Colors.green,
                size: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'Sedang Dikemas',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 50),
          child: Row(
            children: [
              const SizedBox(
                width: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text(
                    '16 Mei',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    '08:17',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.more_horiz,
                color: Colors.green,
                size: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'Pesanan telah diserahkan ke kurir',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 50),
          child: Row(
            children: [
              const SizedBox(
                width: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text(
                    '16 Mei',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    '21:32',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.more_horiz,
                color: Colors.green,
                size: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'Pesanan sedang dalam perjalanan',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 50),
          child: Row(
            children: [
              const SizedBox(
                width: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text(
                    '18 Mei',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    '12:09',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.more_horiz,
                color: Colors.green,
                size: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'Pesanan telah sampai lokasi pengiriman',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 50),
          child: Row(
            children: [
              const SizedBox(
                width: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text(
                    '18 Mei',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    '14:00',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.more_horiz,
                color: Colors.green,
                size: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'Pesanan sedang diantar ke alamat tujuan',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 50),
          child: Row(
            children: [
              const SizedBox(
                width: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text(
                    '18 Mei',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    '18:41',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.more_horiz,
                color: Colors.green,
                size: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'Pesanan telah diterima',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}