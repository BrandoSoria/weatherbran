import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weatherbran/models/models.dart';

// import 'package:weatherbran/models/models.dart';
// import 'package:weatherbran/models/current_weather_response.dart';
class WeatherProvider with ChangeNotifier {
  String _baseUrl = 'api.weatherbit.io';
  String _apiKey = '51eef3e352ac456587064cbc94a83c1b';

  List<Datum> onDisplayCurrentWeather = [];

  WeatherProvider() {
    getOnDisplayCurrentWeather();
  }

  getOnDisplayCurrentWeather() async {
    var url = Uri.https(_baseUrl, '/v2.0/current', {
     
      'key': _apiKey,
    });

    final response = await http.get(url);
    final Map<String, dynamic> decodeData = json.decode(response.body);
    final currentWeatherResponse =
        NowCurrentWeatherResponse.fromRawJson(response.body);
    //
    onDisplayCurrentWeather = currentWeatherResponse.data;
    notifyListeners();
    
  }
}