import 'package:flutter/material.dart';
import 'screen_arguments.dart';

class TujuanModul8 extends StatelessWidget {
  const TujuanModul8({super.key});

  static const routeName = '/tujuanModul8';

  @override
  Widget build(BuildContext context) {
    // ambil data yang dikirim dari Home
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    return Scaffold(
      appBar: AppBar(title: const Text('Halaman TujuanModul8')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                args.title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                args.subtitle,
                style: const TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 10),
              Text(args.description, style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 15),
              OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Kembali ke Home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
