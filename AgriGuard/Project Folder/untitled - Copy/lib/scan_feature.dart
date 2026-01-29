import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class ScanFeature extends StatefulWidget {
  const ScanFeature({super.key}); // Added super.key for best practice

  @override
  _ScanFeatureState createState() => _ScanFeatureState();
}

class _ScanFeatureState extends State<ScanFeature> {
  bool _isScanning = false;
  String? _scanResult;

  // Removed the trailing spaces from your API key to prevent errors
  final String apiKey = 'AIzaSyBStG4t9fId6nBfZ0pK2pY6EvCiI0s67RE';
  final picker = ImagePicker();

  Future<void> _startScan() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile == null) return;

    setState(() {
      _isScanning = true;
      _scanResult = null;
    });

    try {
      Uint8List imageBytes = await pickedFile.readAsBytes();
      String result = await analyzeImageWithGemini(imageBytes);

      if (!mounted) return; // Check if widget is still in tree

      setState(() {
        _isScanning = false;
        _scanResult = result;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _isScanning = false;
        _scanResult = "Error loading image: $e";
      });
    }
  }

  Future<String> analyzeImageWithGemini(Uint8List imageBytes) async {
    final url = Uri.parse(
        'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash-lite:generateContent');

    final requestPayload = jsonEncode({
      "contents": [
        {
          "parts": [
            {
              "text": "Analyze this crop image, detect pests/diseases, and suggest treatment."
            },
            {
              "inline_data": {
                "mime_type": "image/jpeg",
                "data": base64Encode(imageBytes),
              }
            }
          ],
        }
      ]
    });

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'x-goog-api-key': apiKey,
        },
        body: requestPayload,
      );

      print("Status: ${response.statusCode}");
      print("Body: ${response.body}");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['candidates']?[0]?['content']?['parts']?[0]?['text'] ??
            "No diagnosis available";
      } else {
        return "Error: ${response.statusCode} - ${response.body}";
      }
    } catch (e) {
      return "Exception occurred: $e";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Plant/Pest Scan')),

      // FIX: SingleChildScrollView allows the page to scroll when content is long
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            // FIX: Ensures button and card fill the width
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton.icon(
                onPressed: _isScanning ? null : _startScan,
                icon: const Icon(Icons.camera_alt_outlined),
                label: const Text("START PLANT SCAN"),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 54),
                ),
              ),
              const SizedBox(height: 32),

              if (_isScanning) ...[
                const Center(child: CircularProgressIndicator()),
                const SizedBox(height: 18),
                const Center(child: Text("Analyzing image... Please wait.")),
              ],

              if (_scanResult != null)
                Card(
                  margin: const EdgeInsets.only(top: 18),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    // MarkdownBody displays the text properly formatted
                    child: MarkdownBody(
                      data: _scanResult!,
                      styleSheet: MarkdownStyleSheet(
                        p: const TextStyle(fontSize: 16),
                        h1: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
