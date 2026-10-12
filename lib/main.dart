import 'package:flutter/material.dart';
import 'package:modulAll/modul1/modul1.dart';
import 'package:modulAll/modul10/practikum/modul10prac.dart';
import 'package:modulAll/modul12/modul12.dart';
import 'package:modulAll/modul14/main14.dart';
import 'package:modulAll/modul2/modul2.dart';
import 'package:modulAll/modul3/modul3.dart';
import 'package:modulAll/modul4/modul4.dart';
import 'package:modulAll/modul5/modul5.dart';
import 'package:modulAll/modul5/tugasmodul5.dart';
import 'package:modulAll/modul6/modul6.dart';
import 'package:modulAll/modul7/modul7.dart';
import 'package:modulAll/modul7/tujuan.dart';
import 'package:modulAll/modul8/Practikum/home.dart';
import 'package:modulAll/modul8/Practikum/tujuan.dart';
import 'package:modulAll/modul8/home.dart';
import 'package:modulAll/modul8/tujuan.dart';
import 'package:modulAll/modul9/practikum/modul9practikum.dart';
import 'package:modulAll/modul9/practikum/modul9practikum2.dart';
import 'package:modulAll/modul9/tugas/modul9tugas.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas Flutter',
      initialRoute: '/', // set halaman awal
      routes: {
        '/': (context) => HomePage(), // halaman utama
        '/modul7': (context) => Modul7(), // contoh route langsung ke Modul7
        '/tujuan': (context) => const TujuanPage(),
        '/modul8': (context) => const HomeModul8(),
        '/modul6': (context) => const Modul6(),
        TujuanModul8.routeName: (context) => const TujuanModul8(),
        '/modul8practikum': (context) => const Homemodul8practikum(),
        Tujuanmodul8practikum.routeName: (context) =>
            const Tujuanmodul8practikum(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Menu Modul')),
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Modul1Page()),
              );
            },
            child: const Text('Modul 1'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Modul2Page()),
              );
            },
            child: const Text('Modul 2'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Modul3Page()),
              );
            },
            child: const Text('Modul 3'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Modul4Page()),
              );
            },
            child: const Text('Modul 4'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => modul5()),
              );
            },
            child: const Text('Modul 5'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TugasPage5()),
              );
            },
            child: const Text('Modul 5 tugas'),
          ),

          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/modul6'); // pakai route
            },
            child: const Text('Modul 6'),
          ),

          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Modul7()),
              );
            },
            child: const Text('Modul 7 Materialroute'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeModul8()),
              );
            },
            child: const Text('Modul 8'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Homemodul8practikum()),
              );
            },
            child: const Text('Modul 8 Practikum'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Modul9practikum()),
              );
            },
            child: const Text('Modul 9 Practikum 1'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Modul9practikum2()),
              );
            },
            child: const Text('Modul 9 Practikum 2'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Modul9tugas()),
              );
            },
            child: const Text('Modul 9  tugas'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Modul10prac()),
              );
            },
            child: const Text('Modul 10  practikum'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Modul12()),
              );
            },
            child: const Text('Modul 12  practikum'),
          ),

          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyApp13()),
              );
            },
            child: const Text('Modul 13  practikum'),
          ),
        ],
      ),
    );
  }
}
