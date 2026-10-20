import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(title: const Text("Sedang memutar"), centerTitle: true),
        body: Center(
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.album_rounded,
                    size: 150,
                    color: const Color.fromARGB(255, 90, 140, 180),
                  ),
                  ListTile(
                    title: Text(
                      "Sesi Potret",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text("Putra Lesmana, Ari Lesmana"),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.favorite_border_outlined),
                      color: const Color.fromARGB(255, 255, 120, 111),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
