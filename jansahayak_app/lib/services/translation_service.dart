import 'package:flutter/foundation.dart';
import 'package:translator/translator.dart';

class TranslationService {
  static final GoogleTranslator _translator = GoogleTranslator();
  static final Map<String, String> _cache = {};

  static Future<String> translate(String text, String targetLang) async {
    if (targetLang == 'en' || text.isEmpty) return text;
    
    final cacheKey = '${targetLang}_$text';
    if (_cache.containsKey(cacheKey)) {
      return _cache[cacheKey]!;
    }

    try {
      final translation = await _translator.translate(text, to: targetLang);
      _cache[cacheKey] = translation.text;
      debugPrint('Translated and Cached: "$text" -> "${translation.text}" ($targetLang)');
      return translation.text;
    } catch (e) {
      debugPrint('Translation Error for "$text": $e');
      return text;
    }
  }
}
