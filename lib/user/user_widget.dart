import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:developer' as developer;
import 'package:http/http.dart' as http;
import 'package:intl/date_symbol_data_file.dart';
import 'package:intl/intl.dart';
import 'package:opipo_app/main.dart';
import '../domain/api_client.dart';
import 'UserModel.dart';

class UserListWidget extends StatefulWidget {
  UserListWidget({Key? key}) : super(key: key);

  @override
  State<UserListWidget> createState() => _UserListWidgetState();
}

class _UserListWidgetState extends State<UserListWidget> {
  final _search = TextEditingController();
  var _filteredUsers = <UserModel>[];
  // List<UserModel> _filteredUsers = [];

  init() async {
    final _apiClient = ApiClient();
    final result = await _apiClient.getUsers(limit: 10);
    _filteredUsers = result;
    setState(() {});
  }

  void _userView(int user_id) {
    Navigator.pushNamed(context, '/main_screen/user_view', arguments: user_id);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    init();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
            padding: const EdgeInsets.only(top: 70),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            itemCount: _filteredUsers.length,
            itemExtent: 100,
            itemBuilder: (BuildContext context, int index) {
              final _users = _filteredUsers[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border:
                            Border.all(color: Colors.black.withOpacity(0.2)),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8,
                              offset: Offset(0, 2)),
                        ],
                      ),
                      child: Row(
                        children: [
                          // Icon(Icons.man),
                          // Image.asset(
                          //   "images/logo.png",
                          //   height: 100,
                          // ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 5),
                                  Text(
                                    _users.username,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                      OpipoApp()
                                          .date(_users.created_at.toInt()),
                                      style: TextStyle(color: Colors.grey)),
                                  SizedBox(height: 5),
                                  Text(
                                    _users.phone,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        onTap: () {
                          _userView(_users.id);
                        },
                      ),
                    ),
                  ],
                ),
              );
            }),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            controller: _search,
            decoration: InputDecoration(
              labelText: 'Поиск',
              prefixIcon: Icon(Icons.search),
              filled: true,
              fillColor: Colors.white.withAlpha(235),
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}
