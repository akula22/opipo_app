import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:opipo_app/user/AuthModel.dart';
import 'package:opipo_app/user/auth.dart';
import 'package:opipo_app/main_screens/main_screen.dart';
import 'package:opipo_app/splash.dart';
import 'package:opipo_app/user/user_view.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  runApp(OpipoApp());
}

class OpipoApp extends StatelessWidget {
  OpipoApp({Key? key}) : super(key: key);

  final _dateFormat = DateFormat.yMMMMd();

  String date(int date) {
    final DateTime time = DateTime.fromMillisecondsSinceEpoch(date * 1000);
    return _dateFormat.format(time);
    // return DateTime.fromMillisecondsSinceEpoch(date * 1000).toString();
    // return DateFormat.MEd().format(date).toString();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
        '/auth_screen': (context) => AuthProvider(
              model: AuthModel(),
              child: Auth(),
            ),
        '/main_screen': (context) => const MainScreen(),
        '/main_screen/user_view': (context) {
          final id = ModalRoute.of(context)!.settings.arguments as int;
          return UserView(user_id: id);
        }
      },
    );
  }
}
