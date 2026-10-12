import 'package:flutter/material.dart';

class Modul9practikum2 extends StatelessWidget {
  const Modul9practikum2({super.key});

  @override
  Widget build(BuildContext context) {
    return  LikeButtonPage();
  }







}



class LikeButtonPage extends StatefulWidget {
  const LikeButtonPage({super.key});

  @override
  State<LikeButtonPage> createState() => _LikeButtonPageState();
}

class _LikeButtonPageState extends State<LikeButtonPage> {








void _toggleLike() {
    setState(() {
      if (_isLiked) {
        _likeCount--; // jika sudah like → batal
        _isLiked = false;
      } else {
        _likeCount++; // jika belum like → tambah
        _isLiked = true;
      }
    });
  }




  bool _isLiked = false; // state untuk status like
  int _likeCount = 10; // jumlah like awal
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Like Button')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(
                _isLiked ? Icons.favorite : Icons.favorite_border,
                color: _isLiked ? Colors.red : Colors.grey,
                size: 48,
              ),
              onPressed: _toggleLike, // panggil method toggle
            ),
            Text('$_likeCount likes', style: const TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }

}
