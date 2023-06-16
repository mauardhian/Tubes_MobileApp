import 'package:flutter/material.dart';

class SyaratKetentuanPopup extends StatefulWidget {
  @override
  _SyaratKetentuanPopupState createState() => _SyaratKetentuanPopupState();
}

class _SyaratKetentuanPopupState extends State<SyaratKetentuanPopup> {
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
            'Selamat datang di aplikasi Apa ini? Sebelum menggunakan aplikasi kami, harap baca dan pahami syarat dan ketentuan penggunaan berikut ini'
            '\n\n'
            '1. Penggunaan Aplikasi'
            '\n'
            '- Aplikasi ini disediakan untuk memudahkan pelanggan dalam pengiriman barang menggunakan jasa yang kami sediakan.'
            '\n'
            '- Anda setuju untuk menggunakan aplikasi ini dengan mematuhi semua peraturan yang berlaku.'
            '\n\n'
            '2. Informasi Pengguna'
            '\n'
            '- Saat mendaftar dan menggunakan aplikasi, Anda harus memberikan informasi yang akurat dan terkini.'
            '\n'
            '- Kami berkomitmen untuk melindungi privasi Anda sesuai dengan kebijakan privasi yang berlaku.'
            '\n\n'
            '3. Tanggung Jawab Pengguna'
            '\n'
            '- Anda bertanggung jawab penuh atas akun dan aktivitas yang terjadi di dalamnya.'
            '\n'
            '- Anda tidak diperkenankan melakukan tindakan yang melanggar hukum atau merugikan pihak lain.'
            '\n\n'
            '4. Pengiriman Barang'
            '\n'
            '- Kami berupaya semaksimal mungkin untuk menyampaikan barang dengan aman dan tepat waktu.'
            '\n'
            '- Namun, kami tidak bertanggung jawab atas kerusakan atau keterlambatan yang disebabkan oleh faktor di luar kendali kami.'
            '\n\n'
            '5. Perubahan Syarat & Ketentuan'
            '\n'
            '- Syarat dan ketentuan ini dapat berubah dari waktu ke waktu.'
            '\n'
            '- Perubahan akan diinformasikan melalui pembaruan aplikasi atau pemberitahuan kepada pengguna.'
            '\n\n'
            'Hubungi Kami'
            '\n\n'
            'Jika Anda memiliki pertanyaan atau kekhawatiran tentang syarat dan ketentuan ini, jangan ragu untuk menghubungi tim kami melalui informasi kontak yang tertera di aplikasi ini.'
            '\n\n'
            'Terima kasih atas kepercayaan Anda menggunakan aplikasi ini'),
      ),
      actions: <Widget>[
        TextButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.transparent),
            alignment: Alignment.center,
          ),
          child: Text(
            'Tutup',
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
