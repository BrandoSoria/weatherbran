import 'package:flutter/material.dart';
import 'package:weatherbran/screens/current_weather_screen.dart';
void main() {
  runApp(
    MaterialApp(
      title: 'Flutter Weather App',
      home: CurrentWeatherScreen(
        city: 'Delicias, México',
        temperature: 20.0,
        feelsLike: 22.0,
        humidity: 50.0,
        rainProbability: 10.0,
        windSpeed: 10.0,
        windDirection: 90.0,
        clouds: 45,
        aqi: 22, 
        dateTime: DateTime.now(),
        
      ),
    ),
  );
}