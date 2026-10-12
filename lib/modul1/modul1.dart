import 'package:flutter/material.dart';

class Modul1Page extends StatelessWidget {
  const Modul1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First Project',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Program Pertamaku"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Sultonol Auliya", style: TextStyle(fontSize: 24)),
              Text(
                "yeay Program Pertamaku Berhasil",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
