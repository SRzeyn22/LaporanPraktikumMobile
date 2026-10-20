import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'view/home.dart';
import 'view/detail.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Color(0xFFF5F7FB),
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const CountryExplorerApp());
}

class CountryExplorerApp extends StatelessWidget {
  const CountryExplorerApp({super.key});

  @override
  Widget build(BuildContext context) {
    const navy = Color(0xFF17324D);
    const blue = Color(0xFF3977E8);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Country Explorer',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF5F7FB),
        colorScheme: ColorScheme.fromSeed(
          seedColor: blue,
          primary: blue,
          surface: Colors.white,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF5F7FB),
          foregroundColor: navy,
          elevation: 0,
          centerTitle: false,
        ),
        fontFamily: 'Roboto',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/detail': (context) {
          final code = ModalRoute.of(context)!.settings.arguments as String;
          return Detail(countryCode: code);
        },
      },
    );
  }
}
