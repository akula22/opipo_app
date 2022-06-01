// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';

class Auth extends StatefulWidget {
  var title;
  Auth({Key? key, required this.title}) : super(key: key);

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Center(child: Text('Вход в аккаунт ${widget.title}'))),
      body: ListView(
        children: [
          SizedBox(height: 10),
          _headerWidget(),
          SizedBox(height: 25),
          _formWidget(),
          SizedBox(height: 25),
        ],
      ),
    );
  }
}

class _headerWidget extends StatelessWidget {
  const _headerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text('Добро пожаловать в PRINTING HOUSE!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          // Text(data),
        ],
      ),
    );
  }
}

class _formWidget extends StatefulWidget {
  const _formWidget({Key? key}) : super(key: key);

  @override
  State<_formWidget> createState() => __formWidgetState();
}

class __formWidgetState extends State<_formWidget> {
  final _username = TextEditingController();
  final _password = TextEditingController();
  String? errorText = null;
  void _auth() {
    final username = _username.text;
    final password = _password.text;

    if (username == 'akula22' && password == '88') {
      print('login ok');
      errorText = null;
    } else {
      errorText = 'Данные для входа не верны';
    }
    setState(() {});
  }

  void _resetPassword() {}

  @override
  Widget build(BuildContext context) {
    // final errorText = this.errorText;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Username'),
          SizedBox(height: 5),
          TextField(
            controller: _username,
            decoration: InputDecoration(
                isCollapsed: true,
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 12)),
          ),
          SizedBox(height: 20),
          Text('Password'),
          SizedBox(height: 5),
          TextField(
            controller: _password,
            obscureText: true,
            decoration: InputDecoration(
                isCollapsed: true,
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 12)),
          ),
          SizedBox(height: 20),
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 14),
              child: Column(
                children: [
                  if (errorText != null)
                    Text(
                      errorText!,
                      style: TextStyle(color: Colors.red),
                    ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: _auth,
                child: Text('Вход'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black54),
                  textStyle: MaterialStateProperty.all(
                      TextStyle(fontWeight: FontWeight.w700)),
                  padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  ),
                ),
              ),
              SizedBox(width: 20),
              TextButton(
                onPressed: _resetPassword,
                child: Text('Забыли пароль?'),
                style: ButtonStyle(
                  textStyle: MaterialStateProperty.all(
                    TextStyle(fontWeight: FontWeight.w600),
                  ),
                  padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  ),
                ),
              ),
              SizedBox(width: 20),
              TextButton(
                onPressed: () {},
                child: Text('Регистрация'),
                style: ButtonStyle(
                  textStyle: MaterialStateProperty.all(
                      TextStyle(fontWeight: FontWeight.w600)),
                  padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
