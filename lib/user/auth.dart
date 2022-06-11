// ignore_for_file: prefer_typing_uninitialized_variables
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:opipo_app/main_screens/main_screen.dart';
import '../domain/api_client.dart';

class Auth extends StatefulWidget {
  Auth({Key? key}) : super(key: key);

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Вход в аккаунт'))),
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
          Text('Добро пожаловать!',
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
  final _username = TextEditingController(text: 'psych88');
  final _password = TextEditingController(text: '88');
  final _phone = TextEditingController();

  Widget loginBtn = Text('Войти');

  String? errorText = null;
  void _auth() async {
    errorText = null;
    loginBtn = SizedBox(
        width: 20,
        height: 15,
        child: CircularProgressIndicator(strokeWidth: 2));
    final _apiClient = ApiClient();

    final username = _username.text;
    final password = _password.text;
    final phone = _phone.text;

    if (username.isEmpty || password.isEmpty) {
      errorText = 'Заполните поля логин и пароль';
      loginBtn = Text('Войти');
    } else {
      final result =
          await _apiClient.Auth(username: username, password: password);
      if (result.isEmpty || result.length > 1000) {
        errorText = 'Логин или пароль не верен';
        loginBtn = Text('Войти');
      } else {
        Widget loginBtn = Text('Войти');

        unawaited(Navigator.of(context).pushNamed('/main_screen'));
        // print(result);
      }
    }

    // if (username == 'akula22' && password == '88') {
    //   errorText = null;
    //   Navigator.of(context).pushReplacementNamed('/main_screen');
    // } else {
    //   errorText = 'Данные для входа не верны';
    // }
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
          // Text('Username'),
          SizedBox(height: 5),
          TextField(
            controller: _username,
            decoration: InputDecoration(
                icon: Icon(Icons.people),
                labelText: 'Username',
                isCollapsed: true,
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 12)),
          ),
          SizedBox(height: 20),
          TextField(
            keyboardType: TextInputType.number,
            controller: _phone,
            decoration: InputDecoration(
                icon: Icon(Icons.phone),
                labelText: 'Phone',
                prefixText: '+7',
                isCollapsed: true,
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 12)),
          ),
          SizedBox(height: 20),
          // Text('Password'),
          SizedBox(height: 5),
          TextField(
            controller: _password,
            obscureText: true,
            decoration: InputDecoration(
                icon: Icon(Icons.password),
                labelText: 'Password',
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
              SizedBox(width: 42),
              ElevatedButton(
                onPressed: _auth,
                child: loginBtn,
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
            ],
          )
        ],
      ),
    );
  }
}
