import 'package:flutter/material.dart';
import '../services/translation_service.dart';

class TranslationProvider extends ChangeNotifier {
  bool _isHindi = false;
  bool get isHindi => _isHindi;

  Future<void> toggleHindi(BuildContext context) async {
    _isHindi = !_isHindi;
    notifyListeners();
    // Trigger rebuilds - texts will re-translate on next build
  }
}
