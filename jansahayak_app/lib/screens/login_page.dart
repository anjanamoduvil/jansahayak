import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../providers/user_profile_provider.dart';
import '../widgets/translated_text.dart';
import 'profile_info_page.dart';

class LoginPage extends StatefulWidget {
  static const route = '/login';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _controller = TextEditingController();
  bool _loading = false;
  String _occupation = 'Student';
  String _category = 'General'; // <-- Add this line

  final List<String> _occupations = [
    'Student',
    'Farmer',
    'Entrepreneur',
    'Laborer',
    'Other'
  ];

  final List<String> _categories = [ // <-- Add this list
    'General',
    'OBC',
    'ST',
    'Other'
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    setState(() => _loading = true);
    await context.read<AuthProvider>().login(_controller.text);
    if (!mounted) return;
    
    // Store occupation and category in profile provider
    context.read<UserProfileProvider>().setOccupation(_occupation);
    // You can add a similar method for category if needed:
    // context.read<UserProfileProvider>().setCategory(_category);

    setState(() => _loading = false);
    Navigator.pushReplacementNamed(context, ProfileInfoPage.route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const TranslatedText('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                label: TranslatedText('Phone or Email'),
              ),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _occupation,
              items: _occupations.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: TranslatedText(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _occupation = newValue!;
                });
              },
              decoration: const InputDecoration(
                label: TranslatedText('Occupation'),
              ),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>( // <-- Add this widget
              value: _category,
              items: _categories.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: TranslatedText(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _category = newValue!;
                });
              },
              decoration: const InputDecoration(
                label: TranslatedText('Category'),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _loading ? null : _login,
              child: _loading
                  ? const CircularProgressIndicator()
                  : const TranslatedText('Continue'),
            )
          ],
        ),
      ),
    );
  }
}