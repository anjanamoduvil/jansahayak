import 'package:flutter/foundation.dart';
import '../models/user_info.dart';

class UserProfileProvider extends ChangeNotifier {
  UserInfoModel? _profile;
  String? _category; // <-- Add this line

  UserInfoModel? get profile => _profile;
  String get language => _profile?.preferredLanguage ?? 'en';
  String? get category => _category; // <-- Add this getter

  void setProfile(UserInfoModel profile) {
    _profile = profile;
    notifyListeners();
  }

  void setLanguage(String lang) {
    if (_profile == null) {
      _profile = UserInfoModel(
        name: '',
        age: 0,
        gender: '',
        occupation: 'Other',
        income: '',
        state: '',
        district: '',
        preferredLanguage: lang,
      );
    } else {
      _profile = UserInfoModel(
        name: _profile!.name,
        age: _profile!.age,
        gender: _profile!.gender,
        occupation: _profile!.occupation,
        income: _profile!.income,
        state: _profile!.state,
        district: _profile!.district,
        preferredLanguage: lang,
      );
    }
    notifyListeners();
  }

  void setOccupation(String occupation) {
    if (_profile == null) {
      _profile = UserInfoModel(
        name: '',
        age: 0,
        gender: '',
        occupation: occupation,
        income: '',
        state: '',
        district: '',
        preferredLanguage: 'en',
      );
    } else {
      _profile = UserInfoModel(
        name: _profile!.name,
        age: _profile!.age,
        gender: _profile!.gender,
        occupation: occupation,
        income: _profile!.income,
        state: _profile!.state,
        district: _profile!.district,
        preferredLanguage: _profile!.preferredLanguage,
      );
    }
    notifyListeners();
  }

  // Add this method for category
  void setCategory(String category) {
    _category = category;
    notifyListeners();
  }
}