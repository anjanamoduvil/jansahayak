import 'package:flutter/foundation.dart';

class AuthProvider extends ChangeNotifier {
  bool _loggedIn = false;
  String? _userId;

  bool get isLoggedIn => _loggedIn;
  String? get userId => _userId;

  Future<void> login(String phoneOrEmail, {String? otp}) async {
    // TODO: replace with real auth
    _loggedIn = true;
    _userId = phoneOrEmail;
    notifyListeners();
  }

  void logout() {
    _loggedIn = false;
    _userId = null;
    notifyListeners();
  }
}