import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/auth_provider.dart';
import 'providers/user_profile_provider.dart';
import 'providers/scheme_provider.dart';
import 'screens/splash_screen.dart';
import 'screens/language_selection_page.dart';
import 'screens/login_page.dart';
import 'screens/profile_info_page.dart';
import 'screens/home_page.dart';
import 'screens/scheme_details_page.dart';
import 'screens/profile_screen.dart'; 
import 'screens/chatbot_screen.dart';

void main() {
  runApp(const JanSahayakApp());
}

class JanSahayakApp extends StatelessWidget {
  const JanSahayakApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => UserProfileProvider()),
        ChangeNotifierProvider(create: (_) => SchemeProvider()),
      ],
      child: MaterialApp(
        title: 'JanSahayak',
        theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.green),
        initialRoute: SplashScreen.route,
        routes: {
          SplashScreen.route: (_) => const SplashScreen(),
          LanguageSelectionPage.route: (_) => const LanguageSelectionPage(),
          LoginPage.route: (_) => const LoginPage(),
          ProfileInfoPage.route: (_) => const ProfileInfoPage(),
          HomePage.route: (_) => const HomePage(),
          SchemeDetailsPage.route: (_) => const SchemeDetailsPage(),
          ProfileScreen.route: (_) => const ProfileScreen(),
          ChatbotScreen.route: (_) => const ChatbotScreen(), // <-- Add this route
        },
      ),
    );
  }
}