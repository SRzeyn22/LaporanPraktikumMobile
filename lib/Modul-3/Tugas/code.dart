import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alignment',
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text("Malang", style: TextStyle(fontSize: 35)),
              Text(
                '25\u00B0',
                style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  KotakCuaca(hari: 'Minggu', ikon: Icons.sunny, suhu: 20),
                  KotakCuaca(
                    hari: 'Senin',
                    ikon: Icons.cloudy_snowing,
                    suhu: 23,
                  ),
                  KotakCuaca(hari: 'Selasa', ikon: Icons.cloud, suhu: 22),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class KotakCuaca extends StatelessWidget {
  final String hari;
  final int suhu;
  final IconData ikon;

  const KotakCuaca({
    super.key,
    required this.hari,
    required this.ikon,
    required this.suhu,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(hari),
        SizedBox(height: 10),
        Icon(ikon, color: Colors.black, size: 40),
        SizedBox(height: 10),
        Text('$suhu\u00B0C'),
      ],
    );
  }
}