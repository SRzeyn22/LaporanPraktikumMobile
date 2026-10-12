import 'package:flutter/material.dart';
import 'package:modulAll/modul14/page/home_page.dart';
// import 'pages/home_page.dart';

class MyApp13 extends StatelessWidget {
  const MyApp13({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CRUD API Flutter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage14(),
    );
  }
}
