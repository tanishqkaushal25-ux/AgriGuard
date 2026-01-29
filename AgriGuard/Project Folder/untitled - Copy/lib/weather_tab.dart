  import 'dart:convert';
  import 'package:flutter/material.dart';
  import 'package:http/http.dart' as http;
  import 'package:intl/intl.dart';

  class WeatherTab extends StatefulWidget {
    final String apiKey;
    final String city;

    WeatherTab({required this.apiKey, required this.city});

    @override
    _WeatherTabState createState() => _WeatherTabState();
  }

  class _WeatherTabState extends State<WeatherTab> {
    bool _loading = true;
    String? _error;
    Map<String, dynamic>? _today;
    List<Map<String, dynamic>>? _forecasts;

    @override
    void initState() {
      super.initState();
      fetchWeather();
    }

    Future<void> fetchWeather() async {
      setState(() {
        _loading = true;
        _error = null;
        _today = null;
        _forecasts = null;
      });

      final url =
          'https://api.openweathermap.org/data/2.5/forecast?q=${widget.city}&appid=${widget.apiKey}&units=metric';

      try {
        final response = await http.get(Uri.parse(url));
        if (response.statusCode == 200) {
          final parsed = jsonDecode(response.body);
          _processForecast(parsed);
        } else {
          setState(() {
            _error = 'Failed to fetch weather (${response.statusCode}): ${response.body}';
            _loading = false;
          });
        }
      } catch (e) {
        setState(() {
          _error = 'Error: $e';
          _loading = false;
        });
      }
    }

    void _processForecast(Map<String, dynamic> data) {
      final List list = data['list'];
      Map<String, Map<String, dynamic>> byDay = {};
      for (var entry in list) {
        DateTime dt = DateTime.fromMillisecondsSinceEpoch(entry['dt'] * 1000);
        String dayKey = DateFormat('yyyy-MM-dd').format(dt);
        if (!byDay.containsKey(dayKey)) {
          byDay[dayKey] = {
            'temps': [],
            'humidities': [],
            'weather': entry['weather'][0]['description'],
            'icon': entry['weather'][0]['icon'],
            'winds': [],
            'rains': [],
          };
        }
        byDay[dayKey]!['temps'].add(entry['main']['temp']);
        byDay[dayKey]!['humidities'].add(entry['main']['humidity']);
        byDay[dayKey]!['winds'].add(entry['wind']['speed']);
        if (entry['rain'] != null) {
          byDay[dayKey]!['rains'].add(entry['rain']['3h'] ?? 0.0);
        }
      }
      List<Map<String, dynamic>> result = [];
      byDay.forEach((date, stats) {
        result.add({
          'date': date,
          'minTemp': stats['temps'].reduce((a, b) => a < b ? a : b),
          'maxTemp': stats['temps'].reduce((a, b) => a > b ? a : b),
          'humidity': (stats['humidities'].reduce((a, b) => a + b) / stats['humidities'].length).round(),
          'weather': stats['weather'],
          'icon': stats['icon'],
          'wind': (stats['winds'].reduce((a, b) => a + b) / stats['winds'].length).toStringAsFixed(1),
          'rain': stats['rains'].isEmpty ? 0 : stats['rains'].reduce((a, b) => a + b).toStringAsFixed(1),
        });
      });
      result.sort((a, b) => a['date'].compareTo(b['date']));
      setState(() {
        _today = result.first;
        _forecasts = result.skip(1).take(5).toList();
        _loading = false;
      });
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Weather'),
          centerTitle: true,
          backgroundColor: Colors.blue[700],
        ),
        backgroundColor: Color(0xFFF1F3F6),
        body: _loading
            ? Center(child: CircularProgressIndicator())
            : _error != null
            ? Center(
          child: Text(
            _error!,
            style: TextStyle(color: Colors.red, fontSize: 16),
          ),
        )
            : (_today != null && _forecasts != null)
            ? ListView(
          padding: EdgeInsets.all(18),
          children: [
            _buildTodayCard(_today!),
            SizedBox(height: 28),
            Text("Upcoming 5 Days", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 12),
            ..._forecasts!.map(_buildForecastCard).toList(),
          ],
        )
            : Center(child: Text("No data")),
      );
    }

    Widget _buildTodayCard(Map<String, dynamic> data) {
      return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 7,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 6),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.wb_sunny, size: 48, color: Colors.orange[400]), // Simple sun icon replacing weather api icon
              SizedBox(height: 10),
              Text('TODAY', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, letterSpacing: 2, color: Colors.blue[700])),
              SizedBox(height: 8),
              Text('${widget.city}', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 6),
              Text('${data['weather']}'.toUpperCase(), style: TextStyle(fontSize: 14, color: Colors.grey[800])),
              Divider(height: 20, thickness: 1.2 ),
              Wrap(
                spacing: 16,
                runSpacing: 10,
                alignment: WrapAlignment.center,
                children: [
                  _weatherStat('Min', '${data['minTemp'].round()}°C', Icons.thermostat_outlined, Colors.blue[300]),
                  _weatherStat('Max', '${data['maxTemp'].round()}°C', Icons.wb_sunny, Colors.orange[400]),
                  _weatherStat('Humidity', '${data['humidity']}%', Icons.water_drop_outlined, Colors.teal[400]),
                  _weatherStat('Wind', '${data['wind']} m/s', Icons.air_outlined, Colors.grey[600]),
                  _weatherStat('Rain', '${data['rain']} mm', Icons.cloud_queue, Colors.indigo[300]),
                ],
              ),
            ],
          ),
        ),
      );
    }

    Widget _buildForecastCard(Map<String, dynamic> data) {
      final dayOfWeek = DateFormat('EEE').format(DateTime.parse(data['date']));
      final dateShort = DateFormat('d MMM').format(DateTime.parse(data['date']));
      return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 3,
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 18, horizontal: 16),
          constraints: BoxConstraints(minHeight: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.wb_sunny, color: Colors.orange[400], size: 32),
                  SizedBox(width: 10),
                  Text(
                    "$dayOfWeek, $dateShort",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: 6),
              Text('${data['weather']}'.toUpperCase(), style: TextStyle(fontSize: 14)),
              SizedBox(height: 10),
              Wrap(
                spacing: 32,
                runSpacing: 12,
                children: [
                  _weatherStat('Min', '${data['minTemp'].round()}°C', Icons.thermostat_outlined, Colors.blue[300]),
                  _weatherStat('Max', '${data['maxTemp'].round()}°C', Icons.wb_sunny, Colors.orange[400]),
                  _weatherStat('Humidity', '${data['humidity']}%', Icons.water_drop_outlined, Colors.teal[400]),
                  _weatherStat('Rain', '${data['rain']} mm', Icons.cloud_queue, Colors.indigo[300]),
                  _weatherStat('Wind', '${data['wind']} m/s', Icons.air_outlined, Colors.grey[600]),
                ],
              ),
            ],
          ),
        ),
      );
    }


    Widget _weatherStat(String label, String value, IconData icon, Color? iconColor) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 28, color: iconColor),
          SizedBox(height: 5),
          Text(value, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          Text(label, style: TextStyle(fontSize: 11, color: Colors.grey[700])),
        ],
      );
    }
  }
