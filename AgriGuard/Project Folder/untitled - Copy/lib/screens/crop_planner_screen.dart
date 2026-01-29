import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter/widgets.dart';
import 'package:markdown/markdown.dart' as md;

class CropPlannerScreen extends StatefulWidget {
  const CropPlannerScreen({Key? key}) : super(key: key);

  @override
  State<CropPlannerScreen> createState() => _CropPlannerScreenState();
}

class _CropPlannerScreenState extends State<CropPlannerScreen> {
  final _locationController = TextEditingController(text: 'Pimpri, Maharashtra');
  final _soilController = TextEditingController(text: 'Loamy');
  final _cropController = TextEditingController(text: 'Maize');
  String _cropPlan = 'Enter details → Tap Generate → Get AI plan instantly!';
  String _selectedLanguage = 'English';  // ← ADD THIS

  bool _isLoading = false;
  bool _showResults = false;

  // Your Gemini key
  static const String apiKey = 'AIzaSyCE7il9j1NbRBR_rHc_ubE3DxmKbUs84Kk';
  static const String geminiUrl =
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash-lite:generateContent?key=$apiKey';

  Future<void> _generatePlan() async {
    setState(() {
      _isLoading = true;
      _showResults = true;
      _cropPlan = ' Generating your crop plan...';
    });

    try {
      final promptHeader = '''
Pimpri, Maharashtra | ${_soilController.text} soil | ${_cropController.text} crop | Kharif 2026
''';

      final languageInstruction = _selectedLanguage == 'Hindi'
          ? 'पूर्ण हिंदी में उत्तर दें। देवनागरी लिपि का उपयोग करें। सरल भाषा। सभी तकनीकी शब्द हिंदी में।'
          : 'Use PROFESSIONAL ENGLISH. Bullet points only.';

      final prompt = '''
$promptHeader

$languageInstruction

फसल योजना निम्नलिखित **exact format** में बनाएं। **केवल## headings का उपयोग करें। कोई **bold** sections नहीं।**
# मुख्य योजना
### रोपण 
• तारीख: DD/MM/YYYY
• दूरी: cm x cm  
• बीज दर: kg/acre

### खाद (NPK kg/acre)
• बेसल: N-P-K  
• पहली टॉप-ड्रेसिंग: N-P-K (बुआई के दिनों बाद)
• दूसरी टॉप-ड्रेसिंग: N-P-K (बुआई के दिनों बाद)

### सिंचाई 
• बार/सप्ताह (litres/acre)

### कीट (शीर्ष 3) 
1. [कीट] → [सरल स्प्रे/उपचार]
2. [कीट] → [जाल/जैव नियंत्रण] 
3. [कीट] → [समय/निगरानी]

### अपेक्षित 
• उपज: tons/acre  
• लाभ: ₹/acre
''';



      final response = await http.post(
        Uri.parse(geminiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'contents': [{
            'parts': [{'text': prompt}]
          }],
          'generationConfig': {
            'temperature': 0.3,
            'maxOutputTokens': 800,
          }
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final plan = data['candidates']?[0]?['content']?['parts']?[0]?['text'] ??
            'No plan generated - try again';
        setState(() => _cropPlan = plan.replaceAll('**', '').trim());
      } else {
        setState(() => _cropPlan = '❌ Error ${response.statusCode}\n${response.body}');
      }
    } catch (e) {
      setState(() => _cropPlan = '❌ Network error: $e\nCheck internet');
    }

    setState(() => _isLoading = false);
  }

  @override
  void dispose() {
    _locationController.dispose();
    _soilController.dispose();
    _cropController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        title: const Text('New Crop Planner'),
        backgroundColor: Colors.green.shade700,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: _showResults
          ? _buildResults()  // Full screen results ONLY
          : _buildInputs(),  // Full screen inputs ONLY
    );
  }

// Compact inputs screen (like your old screenshot)
  Widget _buildInputs() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Soil suitability &\nPrevention guide',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green),
          ),
          const SizedBox(height: 32),
          Text(
            'Enter the crop, you plan to grow to get a comprehensive, personalized plan for successful crop cultivation',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.grey[700], height: 1.5),
          ),
          const SizedBox(height: 48),
          TextField(
            controller: _locationController,
            decoration: InputDecoration(
              labelText: 'Location',
              hintText: 'e.g. Maize, Groundnut',
              prefixIcon: const Icon(Icons.location_on),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _soilController,
            decoration: InputDecoration(
              labelText: 'Soil Type',
              prefixIcon: const Icon(Icons.texture),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _cropController,
            decoration: InputDecoration(
              labelText: 'Crop Name',
              prefixIcon: const Icon(Icons.grass),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
            ),
          ),
          const SizedBox(height: 20),
          DropdownButtonFormField<String>(  // ← ADD THIS
            value: _selectedLanguage,
            decoration: InputDecoration(
              labelText: 'Language',
              prefixIcon: const Icon(Icons.language),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
            ),
            items: const [
              DropdownMenuItem(value: 'English', child: Text('🇺🇸 English')),
              DropdownMenuItem(value: 'Hindi', child: Text('🇮🇳 हिंदी')),
            ],
            onChanged: (value) {
              if (value != null) setState(() => _selectedLanguage = value);
            },
          ),



          const Spacer(),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ElevatedButton.icon(
              onPressed: _generatePlan,
              icon: const Icon(Icons.bolt, size: 28),
              label: const Text('GENERATE PLAN', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade600,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                elevation: 8,
              ),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

// Full screen results (like your first screenshot)
  // Full ready-to-paste _buildResults() - NO back/refresh/title, pure fullscreen plan
  Widget _buildResults() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.green.shade50, Colors.white],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 0),  // Clean top breathing room
          Expanded(
            child: SingleChildScrollView(
              child: MarkdownBody(
                data: _cropPlan,
                styleSheet: MarkdownStyleSheet(
                  h1: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade700,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.green.shade600,
                    decorationThickness: 1.5,
                    height: 1.2,
                  ),
                  h2: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.green[700], height: 1.3),
                  h3: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: Colors.green[800], height: 1.3),
                  strong: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: const Color(0xFF0D3819)),
                  p: const TextStyle(fontSize: 18, height: 1.6, color: Colors.black87),
                  listBullet: const TextStyle(fontSize: 16, height: 1.8, color: Colors.black87),
                  tableHead: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
                  blockquote: TextStyle(color: Colors.green.shade700.withOpacity(0.8)),
                ),
                builders: {
                  'h1': CenteredHeaderBuilder(),
                },
              ),
            ),
          ),
        ],
      ),
    );
  }


}
class CenteredHeaderBuilder extends MarkdownElementBuilder {
  @override
  Widget visitText(md.Text text, TextStyle? preferredStyle) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Text(text.text, style: preferredStyle),
      ),
    );
  }
}


