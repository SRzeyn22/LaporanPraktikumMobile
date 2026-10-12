import 'package:flutter/material.dart';
import 'tujuan.dart';
import 'screen_arguments.dart';

class HomeModul8 extends StatelessWidget {
  const HomeModul8({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Halaman Home')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Ini Halaman Home', style: TextStyle(fontSize: 24)),
            const SizedBox(height: 15),
            OutlinedButton(
              onPressed: () {
                // buat objek argumen
                final args = ScreenArguments(
                  'Judul Game',
                  'Genre: Action',
                  'Ini adalah deskripsi singkat dari game.',
                );
                // navigasi + kirim argumen
                Navigator.pushNamed(context, TujuanModul8.routeName, arguments: args);
              },
              child: const Text('Ke Halaman Tujuan'),
            ),
          ],
        ),
      ),
    );
  }
}
