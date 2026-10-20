import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Demo ListView"),
          centerTitle: true,
          backgroundColor: Colors.amber,
        ),
        body: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            listTile(
              Colors.blueAccent.shade400,
              Colors.greenAccent.shade400,
              'Kehadiran',
              'Presensi Kehadiran Kuliah',
              'assets/icon/student.png',
            ),
            listTile(
              Colors.greenAccent.shade400,
              Colors.blueAccent.shade400,
              'Jadwal',
              'Jadwal Perkuliahan',
              'assets/icon/timetable.png',
            ),
            listTile(
              Colors.redAccent.shade400,
              Colors.yellowAccent.shade400,
              'Tugas',
              'Tugas perkuliahan di luar kelas',
              'assets/icon/building.png',
            ),

            listTile(
              Colors.red.shade400,
              Colors.amberAccent.shade400,
              'Pengumuman',
              'Informasi Terkait perkuliahan',
              'assets/icon/checkmark.png',
            ),
            listTile(
              Colors.purple.shade400,
              Colors.tealAccent.shade400,
              'Nilai',
              'Nilai Ujian dan Tugas',
              'assets/icon/checklist.png',
            ),
            listTile(
              Colors.blueAccent.shade400,
              Colors.greenAccent.shade400,
              'Catatan',
              'Pengingat kegiatan perkuliahan',
              'assets/icon/pencil.png',
            ),
          ],
        ),
      ),
    );
  }
}

Container listTile(
  Color warna,
  Color warnaAvatar,
  String judul,
  String subjudul,
  String gambar,
) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 5),
    child: ListTile(
      tileColor: warna,
      title: Text(
        judul,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(subjudul, style: TextStyle(fontSize: 16)),
      leading: CircleAvatar(
        radius: 30,
        backgroundColor: warnaAvatar,
        child: Image.asset(gambar, width: 35, height: 35),
      ),
      trailing: Icon(Icons.star, color: Colors.amberAccent.shade400),
    ),
  );
}
