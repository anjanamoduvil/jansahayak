import 'package:translator/translator.dart';

class TranslationService {
  static final GoogleTranslator _translator = GoogleTranslator();

  static Future<String> translate(String text, String targetLang) async {
    if (targetLang == 'en' || text.isEmpty) return text;
    try {
      final translation = await _translator.translate(text, to: targetLang);
      return translation.text;
    } catch (e) {
      return text; // Return original on error
    }
  }
}
