import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/scheme_provider.dart';
import '../providers/user_profile_provider.dart';
import '../widgets/translated_text.dart';
import 'scheme_details_page.dart';
import 'profile_screen.dart';
import 'language_selection_page.dart';
import 'chatbot_screen.dart';

class HomePage extends StatefulWidget {
  static const route = '/home';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final profile = context.read<UserProfileProvider>().profile;
      context.read<SchemeProvider>().loadSchemes(category: profile?.occupation);
    });
  }

  @override
  Widget build(BuildContext context) {
    final profile = context.watch<UserProfileProvider>().profile;
    final provider = context.watch<SchemeProvider>();
    final occupation = profile?.occupation ?? 'All';

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TranslatedText('Government Schemes'),
            TranslatedText(
              'Showing for: $occupation',
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () => Navigator.pushNamed(context, LanguageSelectionPage.route),
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () => Navigator.pushNamed(context, ProfileScreen.route),
          ),
        ],
      ),
      body: provider.loading
          ? const Center(child: CircularProgressIndicator())
          : provider.error != null
              ? Center(child: Text(provider.error!))
              : provider.schemes.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.info_outline, size: 48, color: Colors.grey),
                          const SizedBox(height: 16),
                          TranslatedText('No schemes found for $occupation'),
                          TextButton(
                            onPressed: () => context.read<SchemeProvider>().loadSchemes(),
                            child: const TranslatedText('Show All Schemes'),
                          )
                        ],
                      ),
                    )
                  : ListView.builder(
                  itemCount: provider.schemes.length,
                  itemBuilder: (_, i) {
                    final s = provider.schemes[i];
                    return ListTile(
                      title: TranslatedText(s.name),
                      subtitle: TranslatedText(s.category),
                      onTap: () => Navigator.pushNamed(
                        context,
                        SchemeDetailsPage.route,
                        arguments: s,
                      ),
                    );
                  },
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, ChatbotScreen.route),
        child: const Icon(Icons.chat),
      ),
    );
  }
}