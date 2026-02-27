import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/scheme.dart';
import '../widgets/translated_text.dart';

class SchemeDetailsPage extends StatelessWidget {
  static const route = '/scheme';
  const SchemeDetailsPage({Key? key}) : super(key: key);

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final scheme = ModalRoute.of(context)!.settings.arguments as Scheme;
    return Scaffold(
      appBar: AppBar(title: TranslatedText(scheme.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: scheme.state == 'Kerala' ? Colors.green[100] : Colors.blue[100],
                borderRadius: BorderRadius.circular(4),
              ),
              child: TranslatedText(
                '${scheme.state} Government Scheme',
                style: TextStyle(
                  color: scheme.state == 'Kerala' ? Colors.green[900] : Colors.blue[900],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const TranslatedText(
              'Description',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TranslatedText(scheme.description),
            const Divider(height: 32),
            const TranslatedText(
              'Eligibility',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TranslatedText(scheme.eligibility),
            const Divider(height: 32),
            const TranslatedText(
              'Documents Needed',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ...scheme.documents.map((doc) => Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Row(
                    children: [
                      const Icon(Icons.check_circle, size: 16, color: Colors.green),
                      const SizedBox(width: 8),
                      Expanded(child: TranslatedText(doc)),
                    ],
                  ),
                )),
            const Divider(height: 32),
            const TranslatedText(
              'How to Apply',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(scheme.applyLink),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => _launchURL(scheme.applyLink),
                icon: const Icon(Icons.open_in_new),
                label: const TranslatedText('Visit Official Website'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
