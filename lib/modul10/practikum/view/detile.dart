import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Detail extends StatelessWidget {
  final int gameTerpilih;
  const Detail({super.key, required this.gameTerpilih});

  Future<Map<String, dynamic>> fetchDetail(int id) async {
    final response = await http.get(
      Uri.parse('https://www.freetogame.com/api/game?id=$id'),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Gagal mengambil data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent.shade400,
      appBar: AppBar(
        title: const Text('Detail Game'),
        backgroundColor: Colors.amberAccent.shade700,
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: fetchDetail(gameTerpilih),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('Data tidak tersedia'));
          } else {
            final data = snapshot.data!;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(data['thumbnail']),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    data['title'],
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(data['genre']),
                  const SizedBox(height: 10),
                  Text(data['description']),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
