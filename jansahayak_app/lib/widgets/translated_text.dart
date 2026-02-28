import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_profile_provider.dart';
import '../services/translation_service.dart';

class TranslatedText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;

  const TranslatedText(this.text, {Key? key, this.style, this.textAlign}) : super(key: key);

  @override
  State<TranslatedText> createState() => _TranslatedTextState();
}

class _TranslatedTextState extends State<TranslatedText> {
  String? _translatedText;
  String? _lastText;
  String? _lastLang;

  void _translate() {
    final targetLang = context.read<UserProfileProvider>().language;
    debugPrint('TranslatedText: Attempting translation for "${widget.text}" to "$targetLang"');
    
    if (targetLang == 'en' || widget.text.isEmpty) {
      debugPrint('TranslatedText: Skipping (English or empty)');
      if (mounted) setState(() => _translatedText = widget.text);
      return;
    }

    if (_lastText == widget.text && _lastLang == targetLang) {
      debugPrint('TranslatedText: Returning cached state result');
      return;
    }

    _lastText = widget.text;
    _lastLang = targetLang;

    TranslationService.translate(widget.text, targetLang).then((result) {
      if (mounted) {
        debugPrint('TranslatedText: Received result for "${widget.text}": "$result"');
        setState(() {
          _translatedText = result;
        });
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _translate();
  }

  @override
  void didUpdateWidget(TranslatedText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.text != widget.text) {
      _translate();
    }
  }

  @override
  Widget build(BuildContext context) {
    // Re-run translate if language changes (since didChangeDependencies might not catch provider updates if not watching)
    final currentLang = context.watch<UserProfileProvider>().language;
    if (_lastLang != currentLang) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _translate());
    }

    return Text(
      _translatedText ?? widget.text,
      style: widget.style,
      textAlign: widget.textAlign,
    );
  }
}
