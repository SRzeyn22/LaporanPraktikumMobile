import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'screen_arguments.dart';
import 'tujuan.dart';

class Homemodul8practikum extends StatefulWidget {
  const Homemodul8practikum({super.key});

  @override
  State<Homemodul8practikum> createState() => _Homemodul8practikumState();
}

class _Homemodul8practikumState extends State<Homemodul8practikum> {
  var title,
      thumbnail,
      shortDescription,
      description,
      genre,
      platform,
      release,
      cover,
      publisher,
      gameId;

  Future getGame(String gameId) async {
    http.Response response = await http.get(
      Uri.parse('https://www.freetogame.com/api/game?id=$gameId'),
    );
    var results = jsonDecode(response.body);
    setState(() {
      this.gameId = gameId;
      title = results['title'];
      thumbnail = results['thumbnail'];
      shortDescription = results['short_description'];
      description = results['description'];
      genre = results['genre'];
      platform = results['platform'];
      publisher = results['publisher'];
      release = results['release_date'];
      cover = results['screenshots'][0]['image'];
    });
  }

  @override
  void initState() {
    super.initState();
    getGame('475'); // ambil 1 game default
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0081c9),
      body: SafeArea(
        child: Center(
          child: gameId == null
              ? const CircularProgressIndicator()
              : GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        Image.network(thumbnail),
                        const SizedBox(height: 15),
                        Text(title, style: const TextStyle(fontSize: 24)),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Genre: $genre"),
                                Text("Platform: $platform"),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Publisher: $publisher"),
                                Text("Release: $release"),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Tujuanmodul8practikum.routeName,
                      arguments: ScreenArguments(
                        cover,
                        title,
                        description,
                        shortDescription,
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
