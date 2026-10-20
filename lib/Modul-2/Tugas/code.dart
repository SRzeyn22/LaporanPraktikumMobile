import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Row and Column',
      home: Scaffold(
        appBar: AppBar(title: Text('Row and Column')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  KotakWarnaJempol(warna: Colors.blue, text: "Kotak 1"),
                  SizedBox(width: 10),
                  KotakWarnaJempol(warna: Colors.yellow, text: "Kotak 2"),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  KotakWarnaJempol(warna: Colors.greenAccent, text: "Kotak 3"),
                  SizedBox(width: 10),
                  KotakWarnaJempol(warna: Colors.purpleAccent, text: "Kotak 4"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class KotakWarnaJempol extends StatelessWidget {
  final Color warna;
  final String text;
  const KotakWarnaJempol({super.key, required this.warna, required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: warna,
        border: Border.all(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.favorite, color: Colors.red, size: 40),
          Text(text),
        ],
      ),
    );
  }
}
