import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_profile_provider.dart';
import 'login_page.dart';

class LanguageSelectionPage extends StatelessWidget {
  static const route = '/language';
  const LanguageSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final langs = {
      'en': 'English',
      'hi': 'Hindi',
      'ml': 'Malayalam',
      'ta': 'Tamil',
      'te': 'Telugu',
      'bn': 'Bengali'
    };
    return Scaffold(
      appBar: AppBar(title: const Text('Choose Language')),
      body: ListView(
        children: langs.entries
            .map((e) => ListTile(
                  title: Text(e.value),
                  subtitle: Text(e.key.toUpperCase()),
                  onTap: () {
                    context.read<UserProfileProvider>().setLanguage(e.key);
                    Navigator.pushReplacementNamed(context, LoginPage.route);
                  },
                ))
            .toList(),
      ),
    );
  }
}