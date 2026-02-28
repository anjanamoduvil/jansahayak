import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user_info.dart';
import '../providers/user_profile_provider.dart';
import '../widgets/translated_text.dart';
import 'home_page.dart';

class ProfileInfoPage extends StatefulWidget {
  static const route = '/profile';
  const ProfileInfoPage({Key? key}) : super(key: key);

  @override
  State<ProfileInfoPage> createState() => _ProfileInfoPageState();
}

class _ProfileInfoPageState extends State<ProfileInfoPage> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _age = TextEditingController();
  final _income = TextEditingController();
  
  String _gender = 'Other';
  String _occupationVal = 'Student';
  String _stateVal = 'Kerala';
  String _districtVal = 'Thiruvananthapuram';
  String _lang = 'en';

  final List<String> _genders = ['Male', 'Female', 'Other'];
  final List<String> _states = ['Kerala', 'Tamil Nadu', 'Karnataka', 'Rajasthan', 'Delhi', 'Other'];
  final List<String> _districts = ['Thiruvananthapuram', 'Kochi', 'Kozhikode', 'Chennai', 'Bangalore', 'Mumbai', 'Other'];

  @override
  void initState() {
    super.initState();
    final profile = context.read<UserProfileProvider>().profile;
    if (profile != null) {
      _name.text = profile.name;
      _age.text = profile.age > 0 ? profile.age.toString() : '';
      _gender = _genders.contains(profile.gender) ? profile.gender : 'Other';
      _occupationVal = profile.occupation.isEmpty ? 'Student' : profile.occupation;
      _income.text = profile.income;
      _stateVal = _states.contains(profile.state) ? profile.state : 'Other';
      _districtVal = _districts.contains(profile.district) ? profile.district : 'Other';
      _lang = profile.preferredLanguage;
    }
  }

  @override
  void dispose() {
    _name.dispose();
    _age.dispose();
    _income.dispose();
    super.dispose();
  }

  void _save() {
    if (!_formKey.currentState!.validate()) return;
    final profile = UserInfoModel(
      name: _name.text,
      age: int.tryParse(_age.text) ?? 0,
      gender: _gender,
      occupation: _occupationVal,
      income: _income.text,
      state: _stateVal,
      district: _districtVal,
      preferredLanguage: _lang,
    );
    context.read<UserProfileProvider>().setProfile(profile);
    Navigator.pushReplacementNamed(context, HomePage.route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const TranslatedText('Your Details')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _name,
                decoration: const InputDecoration(label: TranslatedText('Name')),
                validator: (v) => v!.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                controller: _age,
                decoration: const InputDecoration(label: TranslatedText('Age')),
                keyboardType: TextInputType.number,
              ),
              DropdownButtonFormField<String>(
                value: _gender,
                items: _genders.map((g) => DropdownMenuItem(value: g, child: TranslatedText(g))).toList(),
                onChanged: (v) => setState(() => _gender = v ?? 'Other'),
                decoration: const InputDecoration(label: TranslatedText('Gender')),
              ),
              DropdownButtonFormField<String>(
                value: _occupationVal,
                items: const [
                  DropdownMenuItem(value: 'Student', child: TranslatedText('Student')),
                  DropdownMenuItem(value: 'Farmer', child: TranslatedText('Farmer')),
                  DropdownMenuItem(value: 'Entrepreneur', child: TranslatedText('Entrepreneur')),
                  DropdownMenuItem(value: 'Laborer', child: TranslatedText('Laborer')),
                  DropdownMenuItem(value: 'Other', child: TranslatedText('Other')),
                ],
                onChanged: (v) => setState(() => _occupationVal = v ?? 'Student'),
                decoration: const InputDecoration(label: TranslatedText('Occupation')),
              ),
              TextFormField(
                controller: _income,
                decoration: const InputDecoration(label: TranslatedText('Income')),
              ),
              DropdownButtonFormField<String>(
                value: _stateVal,
                items: _states.map((s) => DropdownMenuItem(value: s, child: TranslatedText(s))).toList(),
                onChanged: (v) => setState(() => _stateVal = v ?? 'Other'),
                decoration: const InputDecoration(label: TranslatedText('State')),
              ),
              DropdownButtonFormField<String>(
                value: _districtVal,
                items: _districts.map((d) => DropdownMenuItem(value: d, child: TranslatedText(d))).toList(),
                onChanged: (v) => setState(() => _districtVal = v ?? 'Other'),
                decoration: const InputDecoration(label: TranslatedText('District')),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: _lang,
                items: const [
                  DropdownMenuItem(value: 'en', child: Text('English')),
                  DropdownMenuItem(value: 'hi', child: Text('Hindi')),
                  DropdownMenuItem(value: 'ta', child: Text('Tamil')),
                  DropdownMenuItem(value: 'te', child: Text('Telugu')),
                  DropdownMenuItem(value: 'ml', child: Text('Malayalam')),
                ],
                onChanged: (v) {
                   setState(() => _lang = v ?? 'en');
                   context.read<UserProfileProvider>().setLanguage(v ?? 'en');
                },
                decoration: const InputDecoration(label: TranslatedText('Preferred Language')),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _save,
                child: const TranslatedText('Save & Continue'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
