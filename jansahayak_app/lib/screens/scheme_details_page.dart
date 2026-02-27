import 'package:flutter/material.dart';
import '../models/scheme.dart';

class SchemeDetailsPage extends StatelessWidget {
  static const route = '/scheme';
  const SchemeDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scheme = ModalRoute.of(context)!.settings.arguments as Scheme;
    return Scaffold(
      appBar: AppBar(title: Text(scheme.name)),
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
              child: Text(
                '${scheme.state} Government Scheme',
                style: TextStyle(
                  color: scheme.state == 'Kerala' ? Colors.green[900] : Colors.blue[900],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Description',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(scheme.description),
            const Divider(height: 32),
            Text(
              'Eligibility',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(scheme.eligibility),
            const Divider(height: 32),
            Text(
              'Documents Needed',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            ...scheme.documents.map((doc) => Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Row(
                    children: [
                      const Icon(Icons.check_circle, size: 16, color: Colors.green),
                      const SizedBox(width: 8),
                      Expanded(child: Text(doc)),
                    ],
                  ),
                )),
            const Divider(height: 32),
            Text(
              'How to Apply',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(scheme.applyLink),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  // TODO: launch URL
                },
                icon: const Icon(Icons.open_in_new),
                label: const Text('Visit Official Website'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}