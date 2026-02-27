class UserInfoModel {
  final String name;
  final int age;
  final String gender;
  final String occupation;
  final String income;
  final String state;
  final String district;
  final String preferredLanguage;

  const UserInfoModel({
    required this.name,
    required this.age,
    required this.gender,
    required this.occupation,
    required this.income,
    required this.state,
    required this.district,
    required this.preferredLanguage,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'age': age,
        'gender': gender,
        'occupation': occupation,
        'income': income,
        'state': state,
        'district': district,
        'preferredLanguage': preferredLanguage,
      };

  factory UserInfoModel.fromJson(Map<String, dynamic> json) => UserInfoModel(
        name: json['name'] ?? '',
        age: json['age'] ?? 0,
        gender: json['gender'] ?? '',
        occupation: json['occupation'] ?? '',
        income: json['income'] ?? '',
        state: json['state'] ?? '',
        district: json['district'] ?? '',
        preferredLanguage: json['preferredLanguage'] ?? 'en',
      );
}