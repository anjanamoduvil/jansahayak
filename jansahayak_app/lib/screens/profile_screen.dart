import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_profile_provider.dart';
import '../models/user_info.dart';
import '../widgets/translated_text.dart';

class ProfileScreen extends StatefulWidget {
  static const route = '/profile_screen';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late TextEditingController _name;
  late TextEditingController _age;
  late TextEditingController _gender;
  late TextEditingController _occupation;
  late TextEditingController _income;
  late TextEditingController _state;
  late TextEditingController _district;
  late String _language;

  @override
  void initState() {
    super.initState();
    final profile = context.read<UserProfileProvider>().profile;
    _name = TextEditingController(text: profile?.name ?? '');
    _age = TextEditingController(text: profile?.age.toString() ?? '');
    _gender = TextEditingController(text: profile?.gender ?? '');
    _occupation = TextEditingController(text: profile?.occupation ?? '');
    _income = TextEditingController(text: profile?.income ?? '');
    _state = TextEditingController(text: profile?.state ?? '');
    _district = TextEditingController(text: profile?.district ?? '');
    _language = profile?.preferredLanguage ?? 'en';
  }

  @override
  void dispose() {
    _name.dispose();
    _age.dispose();
    _gender.dispose();
    _occupation.dispose();
    _income.dispose();
    _state.dispose();
    _district.dispose();
    super.dispose();
  }

  void _saveProfile() {
    final updated = UserInfoModel(
      name: _name.text,
      age: int.tryParse(_age.text) ?? 0,
      gender: _gender.text,
      occupation: _occupation.text,
      income: _income.text,
      state: _state.text,
      district: _district.text,
      preferredLanguage: _language,
    );
    context.read<UserProfileProvider>().setProfile(updated);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Profile updated!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const TranslatedText('Your Profile')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: _name, decoration: const InputDecoration(label: TranslatedText('Name'))),
            TextField(controller: _age, decoration: const InputDecoration(label: TranslatedText('Age')), keyboardType: TextInputType.number),
            TextField(controller: _gender, decoration: const InputDecoration(label: TranslatedText('Gender'))),
            TextField(controller: _occupation, decoration: const InputDecoration(label: TranslatedText('Occupation'))),
            TextField(controller: _income, decoration: const InputDecoration(label: TranslatedText('Income'))),
            TextField(controller: _state, decoration: const InputDecoration(label: TranslatedText('State'))),
            TextField(controller: _district, decoration: const InputDecoration(label: TranslatedText('District'))),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: _language,
              items: const [
                DropdownMenuItem(value: 'en', child: Text('English')),
                DropdownMenuItem(value: 'hi', child: Text('Hindi')),
                DropdownMenuItem(value: 'ta', child: Text('Tamil')),
                DropdownMenuItem(value: 'te', child: Text('Telugu')),
                DropdownMenuItem(value: 'ml', child: Text('Malayalam')),
              ],
              onChanged: (v) {
                setState(() => _language = v ?? 'en');
                context.read<UserProfileProvider>().setLanguage(v ?? 'en');
              },
              decoration: const InputDecoration(label: TranslatedText('Preferred Language')),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _saveProfile,
              child: const TranslatedText('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}