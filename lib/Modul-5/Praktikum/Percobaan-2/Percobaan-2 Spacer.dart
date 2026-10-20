import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contoh SizedBoX',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text("Contoh SizedBox"),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              kotakUji(Colors.blue),
              const Spacer(flex: 1),
              SizedBox(height: 100, width: 100, child: kotakUji(Colors.green)),
              const Spacer(flex: 2),
              kotakUji(Colors.yellow),
            ],
          ),
        ),
      ),
    );
  }
}

Container kotakUji(Color warna) {
  return Container(height: 75, width: 75, color: warna);
}
