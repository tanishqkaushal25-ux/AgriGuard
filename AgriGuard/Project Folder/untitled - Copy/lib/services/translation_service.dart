import 'dart:convert';
import 'package:http/http.dart' as http;

class TranslationService {
  final String baseUrl;      // e.g. https://libretranslate.com
  final String? apiKey;      // null if no API key needed (self-hosted)

  TranslationService({
    required this.baseUrl,
    this.apiKey,
  });

  Future<String> translate({
    required String text,
    required String from,
    required String to,
    String format = 'text',
  }) async {
    final uri = Uri.parse('$baseUrl/translate');

    final body = {
      'q': text,
      'source': from,
      'target': to,
      'format': format,
    };

    if (apiKey != null && apiKey!.isNotEmpty) {
      body['api_key'] = apiKey!;
    }

    final response = await http.post(
      uri,
      headers: {
        'Content-Type': 'application/json',
        if (apiKey != null && apiKey!.isNotEmpty)
          'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode(body),
    );

    if (response.statusCode != 200) {
      throw Exception('Translation failed: ${response.statusCode} ${response.body}');
    }

    final data = jsonDecode(response.body);
    return data['translatedText'] ?? text;
  }
}
