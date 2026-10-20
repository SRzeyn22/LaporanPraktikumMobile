import 'package:flutter/material.dart';

class TujuanPage extends StatelessWidget {
  const TujuanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,

      appBar: AppBar(
        title: const Text(
          "Ini Halaman Tujuan",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.red,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Halaman ini merupakan halaman tujuan "
              "yang akan ditampilkan setelah pengguna "
              "menekan tombol pada halaman Home.",
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),

            const SizedBox(height: 20),

            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(10),
                child: Image.asset(
                  'assets/icon/beach.png',
                  width: 150,
                  height: 150,
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Untuk kembali ke halaman sebelumnya, "
              "kita dapat menggunakan Navigator.pop(). "
              "Perintah tersebut akan menutup halaman "
              "yang sedang aktif dan kembali ke halaman Home.",
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),

            const Spacer(),

            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                child: const Text("< Kembali ke halaman Home"),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
