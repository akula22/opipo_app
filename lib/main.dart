import 'package:flutter/material.dart';
import 'package:opipo_app/auth.dart';
import 'package:opipo_app/main_screens/main_screen.dart';
import 'package:opipo_app/splash.dart';

void main() {
  runApp(const OpipoApp());
}

class OpipoApp extends StatelessWidget {
  const OpipoApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Opipo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Colors.black),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
        ),
      ),
      // home: Splash(),
      initialRoute: '/splash_screen',
      routes: {
        '/splash_screen': (context) => Splash(),
        '/auth_screen': (context) => Auth(),
        '/main_screen': (context) => const MainScreen(),
      },
    );
  }
}
