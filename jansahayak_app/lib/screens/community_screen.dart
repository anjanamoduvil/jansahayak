import 'package:flutter/material.dart';
import '../widgets/translated_text.dart';

class CommunityScreen extends StatefulWidget {
  static const route = '/community';
  const CommunityScreen({Key? key}) : super(key: key);

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  final List<Map<String, String>> _posts = [
    {
      'user': 'Amit',
      'content': 'How do I apply for PM Kisan Yojana?',
    },
    {
      'user': 'Priya',
      'content': 'You need Aadhaar and bank details. Apply online at pmkisan.gov.in.',
    },
  ];
  final TextEditingController _controller = TextEditingController();

  void _addPost() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    setState(() {
      _posts.add({'user': 'You', 'content': text});
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const TranslatedText('Community Forum')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _posts.length,
              itemBuilder: (context, index) {
                final post = _posts[index];
                return ListTile(
                  leading: CircleAvatar(child: Text(post['user']![0])),
                  title: Text(post['user']!),
                  subtitle: TranslatedText(post['content']!),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      label: TranslatedText('Share something or ask a question...'),
                    ),
                    onSubmitted: (_) => _addPost(),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _addPost,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
