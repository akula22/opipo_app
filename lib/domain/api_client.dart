import 'dart:convert';
import 'dart:io';
import 'dart:developer' as developer;
import 'package:http/http.dart' as http;
import 'package:opipo_app/user/UserModel.dart';

class ApiClient {
  final _client = HttpClient();
  static const _host = 'https://opipo.ru';
  static const _apiKey = '88';

  Future<String> Auth({
    required String username,
    required String password,
  }) async {
    final token = await _validateUser(username: username, password: password);
    return token;
  }

  Future<String> _validateUser(
      {required String username, required String password}) async {
    final url = Uri.parse('$_host/api/validate-user');
    var response = await http.post(url, body: <String, String>{
      'username': username,
      'password': password,
    });
    // getUsers(limit: 10);
    return response.body;
  }

  Future<List<UserModel>> getUsers({required int page}) async {
    final url = Uri.parse('$_host/api/get-last-users?limit=$page');
    var response = await http.get(url);
    final List<UserModel> users = (json.decode(response.body) as List)
        .map((data) => UserModel.fromJson(data))
        .toList();
    return users;
  }
}
