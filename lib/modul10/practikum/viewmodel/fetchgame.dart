import 'dart:convert';
// import 'package:game_app/model/game.dart';
import 'package:http/http.dart' as http;
import 'package:modulAll/modul10/practikum/model/game.dart';

Future<List<Game>> fetchGames() async {
  final response = await http.get(
    Uri.parse('https://www.freetogame.com/api/games'),
  );

  if (response.statusCode == 200) {
    final List<dynamic> jsonData = json.decode(response.body);
    return jsonData.map((e) => Game.fromJson(e)).toList();
  } else {
    throw Exception('Gagal mengambil data game');
  }
}
