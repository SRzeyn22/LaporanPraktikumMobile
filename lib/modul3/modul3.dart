import 'package:flutter/material.dart';

class Modul3Page extends StatelessWidget {
  final List<Map<String, String>> dataHarian = [
    {"hari": "Senin", "suhu": "30°C", "icon": "☀️"},
    {"hari": "Selasa", "suhu": "28°C", "icon": "🌧️"},
    {"hari": "Rabu", "suhu": "29°C", "icon": "⛅"},
    {"hari": "Kamis", "suhu": "31°C", "icon": "☀️"},
  ];

  Modul3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          title: Text(
            'Cuaca Malang Raya',
            style: TextStyle(fontWeight: FontWeight.w900),
          ),
          centerTitle: true,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 150),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 16),
                Text(
                  "30°C",
                  style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),
                ),
              ],
            ),

            SizedBox(height: 150),
            Column(
              children: [
                SizedBox(height: 100),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: dataHarian.map((hari) {
                    return Column(
                      children: [
                        Text(hari["hari"]!),
                        SizedBox(height: 6),
                        Text(hari["icon"]!, style: TextStyle(fontSize: 24)),
                        SizedBox(height: 6),
                        Text(hari["suhu"]!),
                      ],
                    );
                  }).toList(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
