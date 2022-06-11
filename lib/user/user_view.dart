import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserView extends StatefulWidget {
  final int user_id;
  const UserView({Key? key, required this.user_id}) : super(key: key);

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("images/logo3.png"),
      ),
      body: ListView(
        children: [Profile()],
      ),
    );
  }
}

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Color(0xFFE6E6E6),
      child: Image.asset("images/logo.png"),
    );
  }
}
