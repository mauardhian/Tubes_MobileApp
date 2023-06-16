import 'dart:math';

import 'package:flutter/material.dart';

class KebijakanPrivasiPopup extends StatefulWidget {
  @override
  _KebijakanPrivasiPopupState createState() => _KebijakanPrivasiPopupState();
}

class _KebijakanPrivasiPopupState extends State<KebijakanPrivasiPopup> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(children: [
        Icon(
          Icons.ad_units,
          color: Colors.red,
        ),
        Text('Kebijakan Privasi'),
      ]),
      content: SingleChildScrollView(
        child: Text(
          'Selamat datang di aplikasi Gosiaap! Kami sangat memprioritaskan privasi pengguna kami. Kebijakan Privasi ini menjelaskan bagaimana kami mengumpulkan, menggunakan, dan melindungi informasi pribadi Anda saat menggunakan aplikasi kami.'
          '\n\n'
          '1. Pengumpulan Informasi'
          '\n'
          'Kami mengumpulkan informasi pribadi Anda seperti nama, alamat, nomor telepon, dan alamat email saat Anda mendaftar atau menggunakan layanan kami. Informasi ini digunakan untuk keperluan pengiriman barang dan pelayanan pelanggan.'
          '\n\n'
          '2. Penggunaan Informasi'
          '\n'
          'Informasi pribadi yang kami kumpulkan digunakan untuk mengelola layanan pengiriman, memproses pembayaran, dan memberikan pembaruan terkait pengiriman. Kami tidak akan membagikan informasi Anda kepada pihak ketiga tanpa izin Anda.'
          '\n\n'
          '3. Keamanan Informasi'
          '\n'
          'Kami mengambil langkah-langkah yang diperlukan untuk melindungi informasi pribadi Anda dari akses, penggunaan, atau pengungkapan yang tidak sah. Kami menggunakan protokol keamanan dan enkripsi data untuk melindungi informasi Anda.'
          '\n\n'
          '4. Penghapusan Informasi'
          '\n'
          'Kami akan menyimpan informasi pribadi Anda hanya selama diperlukan untuk tujuan yang dijelaskan dalam Kebijakan Privasi ini. Jika Anda ingin menghapus informasi Anda dari sistem kami, silakan hubungi layanan pelanggan kami.'
          '\n\n'
          '5. Perubahan Kebijakan Privasi'
          '\n'
          'Kami dapat mengubah Kebijakan Privasi ini dari waktu ke waktu. Perubahan akan diberitahukan melalui pembaruan aplikasi atau pemberitahuan kepada pengguna. Kami sarankan Anda untuk memeriksa Kebijakan Privasi ini secara berkala.'
          '\n\n'
          'Hubungi Kami'
          '\n\n'
          'Jika Anda memiliki pertanyaan atau kekhawatiran tentang Kebijakan Privasi kami, jangan ragu untuk menghubungi tim kami melalui informasi kontak yang tertera di aplikasi ini.'
          '\n\n'
          'Terima kasih atas kepercayaan Anda menggunakan aplikasi',
        ),
      ),
      actions: <Widget>[
        TextButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.transparent),
            alignment: Alignment.center,
          ),
          child: Text(
            'KEMBALI',
            style: TextStyle(color: Colors.red),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
