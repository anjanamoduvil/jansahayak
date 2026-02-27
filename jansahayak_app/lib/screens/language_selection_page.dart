import 'package:flutter/material.dart';
import 'login_page.dart';

class LanguageSelectionPage extends StatelessWidget {
  static const route = '/language';
  const LanguageSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final langs = ['en', 'hi', 'ta', 'te', 'ml', 'bn'];
    return Scaffold(
      appBar: AppBar(title: const Text('Choose Language')),
      body: ListView(
        children: langs
            .map((l) => ListTile(
                  title: Text(l.toUpperCase()),
                  onTap: () => Navigator.pushReplacementNamed(
                      context, LoginPage.route),
                ))
            .toList(),
      ),
    );
  }
}