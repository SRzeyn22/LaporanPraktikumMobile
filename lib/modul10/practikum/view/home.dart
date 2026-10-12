import 'package:flutter/material.dart';
import 'package:modulAll/modul10/practikum/model/game.dart';
import 'package:modulAll/modul10/practikum/viewmodel/fetchgame.dart';
// import 'package:game_app/model/game.dart';
// import 'package:game_app/viewmodel/fetchgame.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<Game>> gameList;

  @override
  void initState() {
    super.initState();
    gameList = fetchGames();
  }

  Card _listItem(String image, String title, String genre) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ListTile(
        tileColor: Colors.blue.shade50,
        leading: Image.network(image, width: 70, height: 70, fit: BoxFit.cover),
        title: Text(title),
        subtitle: Text(genre),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent.shade400,
      appBar: AppBar(
        title: const Text('Flutter Game Store'),
        backgroundColor: Colors.amberAccent.shade700,
      ),
      body: FutureBuilder<List<Game>>(
        future: gameList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Tidak ada data'));
          } else {
            final games = snapshot.data!;
            return ListView.builder(
              itemCount: games.length,
              itemBuilder: (context, index) {
                final game = games[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/detail', arguments: game.id);
                  },
                  child: _listItem(game.thumbnail, game.title, game.genre),
                );
              },
            );
          }
        },
      ),
    );
  }
}
