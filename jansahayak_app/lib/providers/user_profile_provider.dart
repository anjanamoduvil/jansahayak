import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_info.dart';

class UserProfileProvider extends ChangeNotifier {
  UserInfoModel? _profile;
  String? _category;
  SharedPreferences? _prefs;

  UserProfileProvider() {
    _loadFromPrefs();
  }

  UserInfoModel? get profile => _profile;
  String get language => _profile?.preferredLanguage ?? 'en';
  String? get category => _category;

  Future<void> _loadFromPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    final profileStr = _prefs?.getString('user_profile');
    if (profileStr != null) {
      _profile = UserInfoModel.fromJson(jsonDecode(profileStr));
    }
    _category = _prefs?.getString('user_category');
    notifyListeners();
  }

  Future<void> setProfile(UserInfoModel profile) async {
    _profile = profile;
    await _prefs?.setString('user_profile', jsonEncode(profile.toJson()));
    notifyListeners();
  }

  Future<void> setLanguage(String lang) async {
    if (_profile == null) {
      _profile = UserInfoModel(
        name: '', age: 0, gender: '', occupation: 'Other',
        income: '', state: '', district: '', preferredLanguage: lang,
      );
    } else {
      _profile = UserInfoModel(
        name: _profile!.name, age: _profile!.age, gender: _profile!.gender,
        occupation: _profile!.occupation, income: _profile!.income,
        state: _profile!.state, district: _profile!.district, preferredLanguage: lang,
      );
    }
    await _prefs?.setString('user_profile', jsonEncode(_profile!.toJson()));
    notifyListeners();
  }

  Future<void> setOccupation(String occupation) async {
    if (_profile == null) {
      _profile = UserInfoModel(
        name: '', age: 0, gender: '', occupation: occupation,
        income: '', state: '', district: '', preferredLanguage: 'en',
      );
    } else {
      _profile = UserInfoModel(
        name: _profile!.name, age: _profile!.age, gender: _profile!.gender,
        occupation: occupation, income: _profile!.income,
        state: _profile!.state, district: _profile!.district,
        preferredLanguage: _profile!.preferredLanguage,
      );
    }
    await _prefs?.setString('user_profile', jsonEncode(_profile!.toJson()));
    notifyListeners();
  }

  Future<void> setCategory(String category) async {
    _category = category;
    await _prefs?.setString('user_category', category);
    notifyListeners();
  }
}