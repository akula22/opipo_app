import 'package:flutter/material.dart';
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
      theme: ThemeData(appBarTheme: AppBarTheme(backgroundColor: Colors.black)),
      home: Splash(),
    );
  }
}
