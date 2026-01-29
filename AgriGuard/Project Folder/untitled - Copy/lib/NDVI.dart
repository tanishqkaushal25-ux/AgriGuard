import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NDVIPage extends StatefulWidget {
  final String apiKey;
  final String polygonId;

  const NDVIPage({Key? key, required this.apiKey, required this.polygonId}) : super(key: key);

  @override
  _NDVIPageState createState() => _NDVIPageState();
}

class _NDVIPageState extends State<NDVIPage> {
  double? ndviValue;
  bool isLoading = false;
  String? error;

  @override
  void initState() {
    super.initState();
    fetchNDVI();
  }

  Future<void> fetchNDVI() async {
    setState(() {
      isLoading = true;
      error = null;
    });

    try {
      int startUnix = DateTime(2025, 11, 14).millisecondsSinceEpoch ~/ 1000;
      int endUnix = startUnix + 86399;

      final url = Uri.parse(
        'https://api.agromonitoring.com/agro/1.0/ndvi/history'
            '?polyid=${widget.polygonId}'
            '&appid=${widget.apiKey}'
            '&start=$startUnix'
            '&end=$endUnix',
      );

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);

        double? latestNdvi;
        for (var item in data) {
          if (item['data'] != null && item['data']['mean'] != null) {
            latestNdvi = double.tryParse(item['data']['mean'].toString());
          }
        }

        if (latestNdvi != null) {
          setState(() {
            ndviValue = latestNdvi;
            isLoading = false;
          });
        } else {
          setState(() {
            error = 'No NDVI stats available for selected period.';
            isLoading = false;
          });
        }
      } else {
        setState(() {
          error = 'Error fetching NDVI data: HTTP ${response.statusCode}';
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        error = 'Exception: $e';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String description = '';
    Color ndviColor = Colors.green;

    if (ndviValue != null) {
      if (ndviValue! < 0.2) {
        description =
        'Low NDVI: Plants are very weak or there are almost no crops in this area. It may be bare soil, dry field, or damaged crop.';
        ndviColor = Colors.red;
      } else if (ndviValue! < 0.5) {
        description =
        'Medium NDVI: Plants are growing, but some parts of the field may be weak. Check for problems like lack of water, nutrients, or pests.';
        ndviColor = Colors.orange;
      } else {
        description =
        'High NDVI: Plants are green and healthy. This part of the field is doing well.';
        ndviColor = Colors.green;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('NDVI Index'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : error != null
          ? Center(
        child: Text(
          error!,
          style: const TextStyle(color: Colors.red, fontSize: 16),
          textAlign: TextAlign.center,
        ),
      )
          : ndviValue != null
          ? SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // IMAGE AT THE VERY TOP, NO GAP
            Image.asset(
              'lib/NDVI.jpeg',
              width: 1800,
              height: 250,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 14),
            const Text(
              'NDVI for Your Field',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 1),
            Text(
              ndviValue!.toStringAsFixed(3),
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: ndviColor,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: ndviColor.withOpacity(0.15),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: ndviColor),
              ),
              child: Text(
                description,
                style: TextStyle(
                  fontSize: 16,
                  color: ndviColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 24),
            const Divider(),
            const SizedBox(height: 12),
            const Text(
              'What is NDVI?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'NDVI is a number between -1 and 1 that tells how green and healthy the plants are in your field. '
                  'Higher values mean more green leaves and better crop growth. Lower values mean weak plants, bare soil, or water.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            const Text(
              'How to use this:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            const Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '• NDVI below 0.2 – Very poor or no crop. Check for drought, flood, or soil problems.',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '• NDVI between 0.2 and 0.5 – Crop is growing, but some parts may need more water, fertilizer, or pest control.',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '• NDVI above 0.5 – Crop is generally healthy. Keep monitoring and continue good practices.',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Tip: If NDVI is low in a specific area of your farm, visit that spot in the field and check what is wrong. This helps you save money by treating only problem areas.',
              style: TextStyle(fontSize: 15),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      )
          : const Center(
        child: Text(
          'No NDVI data available',
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
