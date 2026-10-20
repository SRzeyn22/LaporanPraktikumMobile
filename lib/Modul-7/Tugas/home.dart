import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,

      appBar: AppBar(
        title: const Text(
          "Ini Halaman Home",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Banyak aplikasi memiliki beberapa layar untuk "
              "menampilkan informasi yang berbeda. Contohnya, "
              "ada layar produk, dan ketika pengguna mengklik "
              "produk, akan muncul layar dengan detail produk tersebut.",
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
                  'assets/icon/house.png',
                  width: 150,
                  height: 150,
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Pertama, kita perlu membuat dua halaman atau "
              "\"routes\" yang ingin kita tampilkan. Selanjutnya, "
              "kita gunakan perintah Navigator.push() untuk "
              "berpindah dari halaman pertama ke halaman kedua.",
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),

            const Spacer(),

            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/tujuan');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  foregroundColor: Colors.white,
                ),
                child: const Text("Ke halaman tujuan >"),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
