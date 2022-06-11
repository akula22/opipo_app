import 'package:flutter/material.dart';
import 'package:opipo_app/main.dart';
// ignore_for_file: prefer_typing_uninitialized_variables
import 'user/auth.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _navigateToAuth();
  }

  _navigateToAuth() async {
    var i = 1;
    await Future.delayed(Duration(milliseconds: 2000), () {
      // обробатываем при запуске
      for (i = 0; i < 10; i++) {
        // print(i);
      }
    });
    Navigator.pushReplacementNamed(context, '/auth_screen');
    // Navigator.pushReplacement(
    //     context, MaterialPageRoute(builder: (context) => Auth()));
  }

  // @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
        child: FadeTransition(
          opacity: _animation,
          child: Image.asset("images/logo.jpg", width: 250, height: 250),
        ),
      ),
    );
  }
}
// Image.asset("images/logo.jpg",width: 400,height: 400)