import 'package:flutter/material.dart';
import 'language_selection_page.dart';
import 'home_page.dart';
import '../providers/auth_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  static const route = '/';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _next();
  }

  Future<void> _next() async {
    await Future.delayed(const Duration(milliseconds: 900));
    final isLoggedIn = context.read<AuthProvider>().isLoggedIn;
    if (!mounted) return;
    Navigator.pushReplacementNamed(
      context,
      isLoggedIn ? HomePage.route : LanguageSelectionPage.route,
    );
  }

  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: CircularProgressIndicator()));
}