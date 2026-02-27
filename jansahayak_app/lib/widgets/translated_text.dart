import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_profile_provider.dart';
import '../services/translation_service.dart';

class TranslatedText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;

  const TranslatedText(this.text, {Key? key, this.style, this.textAlign}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final targetLang = context.select((UserProfileProvider p) => p.language);

    if (targetLang == 'en') {
      return Text(text, style: style, textAlign: textAlign);
    }

    return FutureBuilder<String>(
      future: TranslationService.translate(text, targetLang),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!, style: style, textAlign: textAlign);
        }
        // Show original text while translating
        return Text(text, style: style, textAlign: textAlign);
      },
    );
  }
}
