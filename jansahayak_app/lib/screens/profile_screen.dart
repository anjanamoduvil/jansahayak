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
  late TextEditingController _income;
  
  late String _genderVal;
  late String _occupationVal;
  late String _stateVal;
  late String _districtVal;
  late String _language;

  final List<String> _genders = ['Male', 'Female', 'Other'];
  final List<String> _states = ['Kerala', 'Tamil Nadu', 'Karnataka', 'Rajasthan', 'Delhi', 'Other'];
  final List<String> _districts = ['Thiruvananthapuram', 'Kochi', 'Kozhikode', 'Chennai', 'Bangalore', 'Mumbai', 'Other'];

  @override
  void initState() {
    super.initState();
    final profile = context.read<UserProfileProvider>().profile;
    _name = TextEditingController(text: profile?.name ?? '');
    _age = TextEditingController(text: profile?.age.toString() ?? '');
    _income = TextEditingController(text: profile?.income ?? '');
    
    _genderVal = _genders.contains(profile?.gender) ? profile!.gender : 'Other';
    _occupationVal = (profile?.occupation.isNotEmpty ?? false) ? profile!.occupation : 'Student';
    _stateVal = _states.contains(profile?.state) ? profile!.state : 'Other';
    _districtVal = _districts.contains(profile?.district) ? profile!.district : 'Other';
    _language = profile?.preferredLanguage ?? 'en';
  }

  @override
  void dispose() {
    _name.dispose();
    _age.dispose();
    _income.dispose();
    super.dispose();
  }

  void _saveProfile() {
    final updated = UserInfoModel(
      name: _name.text,
      age: int.tryParse(_age.text) ?? 0,
      gender: _genderVal,
      occupation: _occupationVal,
      income: _income.text,
      state: _stateVal,
      district: _districtVal,
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
            DropdownButtonFormField<String>(
              value: _genderVal,
              items: _genders.map((g) => DropdownMenuItem(value: g, child: TranslatedText(g))).toList(),
              onChanged: (v) => setState(() => _genderVal = v ?? 'Other'),
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
            TextField(controller: _income, decoration: const InputDecoration(label: TranslatedText('Income'))),
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