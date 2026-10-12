import 'package:flutter/material.dart';

class Modul2Page extends StatelessWidget {
  const Modul2Page({super.key});

  // Jangan pake `const` di sini supaya fleksibel
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kotak Icon',
      home: Scaffold(
        appBar: AppBar(title: Text('Kotak dengan Icon')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Baris pertama
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _iconBox(Icons.favorite, Colors.red, 'Love 1'),
                  SizedBox(width: 16),
                  _iconBox(Icons.favorite, Colors.pink, 'Love 2'),
                ],
              ),
              SizedBox(height: 16),
              // Baris kedua
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _iconBox(Icons.favorite, Colors.deepOrange, 'Love 3'),
                  SizedBox(width: 16),
                  _iconBox(Icons.favorite, Colors.purple, 'Love 4'),
                ],
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Back To Menu'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _iconBox(IconData icon, Color color, String label) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: 40),
          SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
