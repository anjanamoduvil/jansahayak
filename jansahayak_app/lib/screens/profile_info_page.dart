import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user_info.dart';
import '../providers/user_profile_provider.dart';
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
  final _gender = TextEditingController();
  final _occupation = TextEditingController();
  final _income = TextEditingController();
  final _state = TextEditingController();
  final _district = TextEditingController();
  String _lang = 'en';

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

  void _save() {
    if (!_formKey.currentState!.validate()) return;
    final profile = UserInfoModel(
      name: _name.text,
      age: int.tryParse(_age.text) ?? 0,
      gender: _gender.text,
      occupation: _occupation.text,
      income: _income.text,
      state: _state.text,
      district: _district.text,
      preferredLanguage: _lang,
    );
    context.read<UserProfileProvider>().setProfile(profile);
    Navigator.pushReplacementNamed(context, HomePage.route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Details')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(controller: _name, decoration: const InputDecoration(labelText: 'Name'), validator: (v) => v!.isEmpty ? 'Required' : null),
              TextFormField(controller: _age, decoration: const InputDecoration(labelText: 'Age'), keyboardType: TextInputType.number),
              TextFormField(controller: _gender, decoration: const InputDecoration(labelText: 'Gender')),
              DropdownButtonFormField<String>(
                value: _occupation.text.isEmpty ? 'Student' : _occupation.text,
                items: const [
                  DropdownMenuItem(value: 'Student', child: Text('Student')),
                  DropdownMenuItem(value: 'Farmer', child: Text('Farmer')),
                  DropdownMenuItem(value: 'Entrepreneur', child: Text('Entrepreneur')),
                  DropdownMenuItem(value: 'Laborer', child: Text('Laborer')),
                  DropdownMenuItem(value: 'Other', child: Text('Other')),
                ],
                onChanged: (v) => setState(() => _occupation.text = v ?? 'Student'),
                decoration: const InputDecoration(labelText: 'Occupation'),
              ),
              TextFormField(controller: _income, decoration: const InputDecoration(labelText: 'Income')),
              TextFormField(controller: _state, decoration: const InputDecoration(labelText: 'State')),
              TextFormField(controller: _district, decoration: const InputDecoration(labelText: 'District')),
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
                onChanged: (v) => setState(() => _lang = v ?? 'en'),
                decoration: const InputDecoration(labelText: 'Preferred Language'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(onPressed: _save, child: const Text('Save & Continue')),
            ],
          ),
        ),
      ),
    );
  }
}