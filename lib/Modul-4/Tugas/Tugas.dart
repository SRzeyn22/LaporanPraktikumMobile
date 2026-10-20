import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pemutar Musik',
      theme: ThemeData.dark(),
      home: Scaffold(
        body: Center(
          child: Container(
            child: Text("Pemutar Musik", style: TextStyle(fontSize: 25)),
          ),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          color: Colors.black54,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: IconButton(onPressed: () {}, icon: Icon(Icons.shuffle)),
              ),
              Expanded(
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.skip_previous),
                ),
              ),

              Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.play_circle_fill, size: 65),
                ),
              ),

              Expanded(
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.skip_next),
                ),
              ),

              Expanded(
                child: IconButton(onPressed: () {}, icon: Icon(Icons.repeat)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
