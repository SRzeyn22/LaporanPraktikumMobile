import 'package:flutter/material.dart';
import 'package:modulAll/modul10/practikum/view/detile.dart';
import 'package:modulAll/modul10/practikum/view/home.dart';
// import 'package:modul10/practikum/view/detail.dart';
// import 'package:game_app/view/home.dart';


class Modul10prac extends StatelessWidget {
  const Modul10prac({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Game Store',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/detail': (context) {
          final gameId = ModalRoute.of(context)!.settings.arguments as int;
          return Detail(gameTerpilih: gameId);
        },
      },
      theme: ThemeData(primarySwatch: Colors.amber),
    );
  }
}
