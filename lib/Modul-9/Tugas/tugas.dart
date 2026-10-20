import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ValueNotifier<double> _valueNotifier;
  double _counter = 0.0;

  @override
  void initState() {
    super.initState();
    _valueNotifier = ValueNotifier(0.0);
    _counter = 0.0;
  }

  @override
  void dispose() {
    _valueNotifier.dispose();
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      if (_counter < 33) {
        _counter++;
        _valueNotifier.value = (_counter / 33) * 100;
      }
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0.0;
      _valueNotifier.value = (_counter / 33) * 100;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(119, 210, 145, 1),
        ),
        useMaterial3: true,
      ),
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 119, 210, 145),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${_counter.round()}',
                  style: const TextStyle(fontSize: 50),
                ),
                const SizedBox(height: 10),
                SimpleCircularProgressBar(
                  progressColors: [Colors.amberAccent.shade400],
                  size: 300,
                  progressStrokeWidth: 20,
                  backStrokeWidth: 10,
                  mergeMode: true,
                  maxValue: 100,
                  animationDuration: 0,
                  valueNotifier: _valueNotifier,
                  onGetText: (value) {
                    return Text(
                      '${((value.toInt() / 100) * 33).round()}',
                      style: const TextStyle(fontSize: 120, fontWeight: FontWeight.bold),
                    );
                  },
                ),
                const SizedBox(height: 50),
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  child: InkWell(
                    onTap: _incrementCounter,
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(color: Colors.white),
                      child: const Icon(
                        Icons.fingerprint,
                        size: 100,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _resetCounter,
          backgroundColor: const Color.fromARGB(255, 160, 230, 180),
          child: const Icon(Icons.refresh_outlined),
        ),
      ),
    );
  }
}