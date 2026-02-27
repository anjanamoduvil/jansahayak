import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../providers/user_profile_provider.dart';
import 'profile_info_page.dart';

class LoginPage extends StatefulWidget {
  static const route = '/login';
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _controller = TextEditingController();
  bool _loading = false;
  String _occupation = 'Student';

  final List<String> _occupations = [
    'Student',
    'Farmer',
    'Entrepreneur',
    'Laborer',
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
    
    // Store occupation in profile provider
    context.read<UserProfileProvider>().setOccupation(_occupation);
    
    setState(() => _loading = false);
    Navigator.pushReplacementNamed(context, ProfileInfoPage.route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: 'Phone or Email'),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _occupation,
              items: _occupations.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _occupation = newValue!;
                });
              },
              decoration: const InputDecoration(labelText: 'Occupation'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _loading ? null : _login,
              child: _loading
                  ? const CircularProgressIndicator()
                  : const Text('Continue'),
            )
          ],
        ),
      ),
    );
  }
}