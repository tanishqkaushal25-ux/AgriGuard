import 'package:flutter/material.dart';
import 'services/translation_service.dart';

class LibreTranslateDemoPage extends StatefulWidget {
  const LibreTranslateDemoPage({super.key});

  @override
  State<LibreTranslateDemoPage> createState() => _LibreTranslateDemoPageState();
}

class _LibreTranslateDemoPageState extends State<LibreTranslateDemoPage> {
  final _inputController = TextEditingController();
  String _outputText = '';
  bool _isLoading = false;

  late final TranslationService _translator;

  @override
  void initState() {
    super.initState();
    _translator = TranslationService(
      baseUrl: 'https://libretranslate.com', // or your own server
      apiKey: 'YOUR_API_KEY_HERE',           // or null for self-hosted
    );
  }

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  Future<void> _translate() async {
    final text = _inputController.text.trim();
    if (text.isEmpty) return;

    setState(() => _isLoading = true);

    try {
      final translated = await _translator.translate(
        text: text,
        from: 'en',  // detect automatically? use 'auto' if your instance supports it
        to: 'hi',
      );
      setState(() => _outputText = translated);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LibreTranslate Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _inputController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'Enter text to translate',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _isLoading ? null : _translate,
                child: _isLoading
                    ? const CircularProgressIndicator()
                    : const Text('Translate EN → HI'),
              ),
            ),
            const SizedBox(height: 24),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Translated:',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                _outputText.isEmpty ? '—' : _outputText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
