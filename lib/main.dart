import 'package:flutter/material.dart';
import 'Modul-2/Tugas/code.dart' as m1;
import 'Modul-3/Praktikum/praktikum.dart' as m2;
import 'Modul-3/Tugas/code.dart' as m3;
import 'Modul-4/Praktikum/Percobaan-1/Percobaan-1%20Flexible.dart' as m5;
import 'Modul-4/Praktikum/Percobaan-2/Percobaan-2%20Expanded.dart' as m6;
import 'Modul-4/Tugas/Tugas.dart' as m8;
import 'Modul-5/Praktikum/Percobaan-1/Percobaan-1.dart' as m9;
import 'Modul-5/Praktikum/Percobaan-2/Percobaan-2%20Spacer.dart' as m10;
import 'Modul-5/Praktikum/Percobaan-3/Percobaan-3.dart' as m11;
import 'Modul-5/Tugas/Tugas.dart' as m12;
import 'Modul-6/Praktikum/Percobaan-1/Percobaan-1%20GridView.dart' as m13;
import 'Modul-6/Praktikum/Percobaan-2/Percobaan-2%20ListView.dart' as m14;
import 'Modul-6/Praktikum/Percobaan-3/Percobaan-3%20GridView.Builder.dart'
    as m15;
import 'Modul-6/Praktikum/Percobaan-4/Percobaan-4%20ListView.builder.dart'
    as m16;
import 'Modul-6/Tugas/Tugas.dart' as m18;
import 'Modul-7/Tugas/main.dart' as m19;
import 'Modul-8/Praktikum/main.dart' as m20;
import 'Modul-8/Tugas/main.dart' as m21;
import 'Modul-9/Praktikum/Percobaan-1/main.dart' as m22;
import 'Modul-9/Praktikum/Percobaan-2/main.dart' as m23;
import 'Modul-9/Tugas/tugas.dart' as m24;
import 'Modul-10%20(Game)/Praktikum/Percobaan-1/main.dart' as m25;
import 'Modul-10%20(Game)/Praktikum/Percobaan-2/main.dart' as m26;
import 'Modul-10%20(Game)/Tugas/main.dart' as m27;
import 'Modul-11/Tugas/main.dart' as m28;
import 'UTS/main.dart ' as m31;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Tugas Flutter', home: const HomePage());
  }
}

// Membuka salah satu hasil modul. Tombol kembali melayang di kiri bawah
// supaya bisa kembali ke menu tanpa mengubah kode modul yang dibuka.
void _bukaModul(BuildContext context, Widget modul) {
  Navigator.of(
    context,
  ).push(MaterialPageRoute(builder: (context) => _ModulHost(modul: modul)));
}

class _ModulHost extends StatelessWidget {
  const _ModulHost({required this.modul});

  final Widget modul;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        modul,
        Positioned(
          left: 8,
          bottom: 8,
          child: SafeArea(
            child: Material(
              type: MaterialType.transparency,
              child: FloatingActionButton.small(
                heroTag: null,
                onPressed: () => Navigator.of(context).pop(),
                child: const Icon(Icons.arrow_back),
              ),
            ),
          ),
        ),
      ],
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
          ExpansionTile(
            title: const Text('Modul 2'),
            childrenPadding: const EdgeInsets.only(left: 16),
            children: [
              ListTile(
                title: const Text('Tugas'),
                onTap: () => _bukaModul(context, m1.MyApp()),
              ),
            ],
          ),
          ExpansionTile(
            title: const Text('Modul 3'),
            childrenPadding: const EdgeInsets.only(left: 16),
            children: [
              ListTile(
                title: const Text('Praktikum'),
                onTap: () => _bukaModul(context, m2.MyApp()),
              ),
              ListTile(
                title: const Text('Tugas'),
                onTap: () => _bukaModul(context, m3.MyApp()),
              ),
            ],
          ),
          ExpansionTile(
            title: const Text('Modul 4'),
            childrenPadding: const EdgeInsets.only(left: 16),
            children: [
              ExpansionTile(
                title: const Text('Praktikum'),
                childrenPadding: const EdgeInsets.only(left: 16),
                children: [
                  ListTile(
                    title: const Text('Percobaan-1'),
                    onTap: () => _bukaModul(context, m5.MyApp()),
                  ),
                  ListTile(
                    title: const Text('Percobaan-2'),
                    onTap: () => _bukaModul(context, m6.MyApp()),
                  ),
                ],
              ),
              ListTile(
                title: const Text('Tugas'),
                onTap: () => _bukaModul(context, m8.MyApp()),
              ),
            ],
          ),
          ExpansionTile(
            title: const Text('Modul 5'),
            childrenPadding: const EdgeInsets.only(left: 16),
            children: [
              ExpansionTile(
                title: const Text('Praktikum'),
                childrenPadding: const EdgeInsets.only(left: 16),
                children: [
                  ListTile(
                    title: const Text('Percobaan-1'),
                    onTap: () => _bukaModul(context, m9.MyApp()),
                  ),
                  ListTile(
                    title: const Text('Percobaan-2'),
                    onTap: () => _bukaModul(context, m10.MyApp()),
                  ),
                  ListTile(
                    title: const Text('Percobaan-3'),
                    onTap: () => _bukaModul(context, m11.MyApp()),
                  ),
                ],
              ),
              ListTile(
                title: const Text('Tugas'),
                onTap: () => _bukaModul(context, m12.MyApp()),
              ),
            ],
          ),
          ExpansionTile(
            title: const Text('Modul 6'),
            childrenPadding: const EdgeInsets.only(left: 16),
            children: [
              ExpansionTile(
                title: const Text('Praktikum'),
                childrenPadding: const EdgeInsets.only(left: 16),
                children: [
                  ListTile(
                    title: const Text('Percobaan-1'),
                    onTap: () => _bukaModul(context, m13.MyApp()),
                  ),
                  ListTile(
                    title: const Text('Percobaan-2'),
                    onTap: () => _bukaModul(context, m14.MyApp()),
                  ),
                  ListTile(
                    title: const Text('Percobaan-3'),
                    onTap: () => _bukaModul(context, m15.MyApp()),
                  ),
                  ListTile(
                    title: const Text('Percobaan-4'),
                    onTap: () => _bukaModul(context, m16.MyApp()),
                  ),
                ],
              ),
              ListTile(
                title: const Text('Tugas'),
                onTap: () => _bukaModul(context, m18.MyApp()),
              ),
            ],
          ),
          ExpansionTile(
            title: const Text('Modul 7'),
            childrenPadding: const EdgeInsets.only(left: 16),
            children: [
              ListTile(
                title: const Text('Tugas'),
                onTap: () => _bukaModul(context, m19.MyApp()),
              ),
            ],
          ),
          ExpansionTile(
            title: const Text('Modul 8'),
            childrenPadding: const EdgeInsets.only(left: 16),
            children: [
              ListTile(
                title: const Text('Praktikum'),
                onTap: () => _bukaModul(context, m20.MyApp()),
              ),
              ListTile(
                title: const Text('Tugas'),
                onTap: () => _bukaModul(context, m21.MyApp()),
              ),
            ],
          ),
          ExpansionTile(
            title: const Text('Modul 9'),
            childrenPadding: const EdgeInsets.only(left: 16),
            children: [
              ExpansionTile(
                title: const Text('Praktikum'),
                childrenPadding: const EdgeInsets.only(left: 16),
                children: [
                  ListTile(
                    title: const Text('Percobaan-1'),
                    onTap: () => _bukaModul(context, m22.MyApp()),
                  ),
                  ListTile(
                    title: const Text('Percobaan-2'),
                    onTap: () => _bukaModul(context, m23.MyApp()),
                  ),
                ],
              ),
              ListTile(
                title: const Text('Tugas'),
                onTap: () => _bukaModul(context, m24.MyApp()),
              ),
            ],
          ),
          ExpansionTile(
            title: const Text('Modul 10'),
            childrenPadding: const EdgeInsets.only(left: 16),
            children: [
              ExpansionTile(
                title: const Text('Praktikum'),
                childrenPadding: const EdgeInsets.only(left: 16),
                children: [
                  ListTile(
                    title: const Text('Percobaan-1'),
                    onTap: () => _bukaModul(context, m25.MyApp()),
                  ),
                  ListTile(
                    title: const Text('Percobaan-2'),
                    onTap: () => _bukaModul(context, m26.MyApp()),
                  ),
                ],
              ),
              ListTile(
                title: const Text('Tugas'),
                onTap: () => _bukaModul(context, m27.MyApp()),
              ),
            ],
          ),
          ExpansionTile(
            title: const Text('Modul 11'),
            childrenPadding: const EdgeInsets.only(left: 16),
            children: [
              ListTile(
                title: const Text('Tugas'),
                onTap: () => _bukaModul(context, m28.MyApp()),
              ),
            ],
          ),
          ExpansionTile(
            title: const Text('UTS'),
            childrenPadding: const EdgeInsets.only(left: 16),
            children: [
              ListTile(
                title: const Text('Country Explorer'),
                onTap: () => _bukaModul(context, m31.CountryExplorerApp()),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
