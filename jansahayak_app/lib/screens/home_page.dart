import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/scheme_provider.dart';
import '../providers/user_profile_provider.dart';
import 'scheme_details_page.dart';

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
    final profile = context.read<UserProfileProvider>().profile;
    context.read<SchemeProvider>().loadSchemes(category: profile?.occupation);
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<SchemeProvider>();
    return Scaffold(
      appBar: AppBar(title: const Text('Schemes')),
      body: provider.loading
          ? const Center(child: CircularProgressIndicator())
          : provider.error != null
              ? Center(child: Text(provider.error!))
              : ListView.builder(
                  itemCount: provider.schemes.length,
                  itemBuilder: (_, i) {
                    final s = provider.schemes[i];
                    return ListTile(
                      title: Text(s.name),
                      subtitle: Text(s.category),
                      onTap: () => Navigator.pushNamed(
                        context,
                        SchemeDetailsPage.route,
                        arguments: s,
                      ),
                    );
                  },
                ),
    );
  }
}