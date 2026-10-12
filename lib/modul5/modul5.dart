import 'package:flutter/material.dart';

class modul5 extends StatelessWidget {
  const modul5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SizeBox")),
      body: Center(child: Row(children: [      
        ContainerBox(warna: Colors.amberAccent,)
,SizedBox(
  height: 25,
  width: 25,
),
            ContainerBox(warna: const Color.fromARGB(255, 64, 255, 89))

,SizedBox(
  height: 25,
  width: 25,
),
            ContainerBox(warna: const Color.fromARGB(255, 255, 64, 64))
      ])),
    );
  }
}

class ContainerBox extends StatelessWidget {
  final Color warna; // <- harus final agar immutable

  const ContainerBox({super.key, required this.warna}); // <- perbaikan

  @override
  Widget build(BuildContext context) {
    return Container(width: 75, height: 75, color: warna);
  }
}
