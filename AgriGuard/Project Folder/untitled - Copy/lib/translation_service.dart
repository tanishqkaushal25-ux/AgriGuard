import 'package:translator/translator.dart';

class AppTranslator {
  static final GoogleTranslator _translator = GoogleTranslator();

  static Future<String> translateToHindi(String text) async {
    print('TRANSLATING: $text');  // ← ADD
    try {
      final translation = await _translator.translate(text, from: 'en', to: 'hi');
      print('HINDI RESULT: ${translation.text}');  // ← ADD
      return translation.text;
    } catch (e) {
      print('TRANSLATION ERROR: $e');  // ← ADD
      return text;  // Fallback
    }
  }
}

