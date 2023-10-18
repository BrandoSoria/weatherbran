import 'package:flutter/material.dart';

enum WeatherCondition {
  clear,
  cloudy,
  rainy,
  snowy,
  windy,
}

class CurrentWeatherScreen extends StatefulWidget {
  final String city;
  final double temperature;
  final double feelsLike;
  final double humidity;
  final double rainProbability;
  final double windSpeed;
  final double windDirection;
  final int clouds;
  final DateTime dateTime;
  final int aqi;

  const CurrentWeatherScreen({
    required this.city,
    required this.temperature,
    required this.feelsLike,
    required this.humidity,
    required this.rainProbability,
    required this.windSpeed,
    required this.windDirection,
    required this.clouds,
    required this.aqi, 
    required this.dateTime,
  });

  @override
  _CurrentWeatherScreenState createState() => _CurrentWeatherScreenState();
}

class _CurrentWeatherScreenState extends State<CurrentWeatherScreen> {
  WeatherCondition _weatherCondition = WeatherCondition.clear;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.city),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      getWeatherIcon(_weatherCondition) ?? 'assets/weather_unknown.png',
                      width: 200,
                    ),
                    Text(
                      "${widget.temperature.toStringAsFixed(1)}°C",
                      style: TextStyle(fontSize: 24),
                    ),
                    Text(
                      "${widget.feelsLike.toStringAsFixed(1)}°C (sensación térmica)",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Cantidad de nubes: ${widget.clouds}',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Fecha y hora: ${widget.dateTime.toIso8601String()}',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'AQI: ${widget.aqi}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String? getWeatherIcon(WeatherCondition weatherCondition) {
  switch (weatherCondition) {
    case WeatherCondition.clear:
      return 'assets/weather_clear.png';
    case WeatherCondition.cloudy:
      return 'assets/weather_cloudy.png';
    case WeatherCondition.rainy:
      return 'assets/weather_rainy.png';
    case WeatherCondition.snowy:
      return 'assets/weather_snowy.png';
    case WeatherCondition.windy:
      return 'assets/weather_windy.png';
    default:
      return null;
  }
}
