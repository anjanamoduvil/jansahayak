import 'package:flutter/foundation.dart';
import '../models/user_info.dart';

class UserProfileProvider extends ChangeNotifier {
  UserInfoModel? _profile;

  UserInfoModel? get profile => _profile;
  String get language => _profile?.preferredLanguage ?? 'en';

  void setProfile(UserInfoModel profile) {
    _profile = profile;
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
}