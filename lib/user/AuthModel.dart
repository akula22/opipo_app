import 'package:flutter/material.dart';
import 'package:opipo_app/domain/api_client.dart';

class AuthModel extends ChangeNotifier {}

class AuthProvider extends InheritedNotifier {
  final AuthModel model;
  AuthProvider({Key? key, required this.model, required this.child})
      : super(key: key, notifier: model, child: child);

  final Widget child;

  static AuthProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AuthProvider>();
  }
}
