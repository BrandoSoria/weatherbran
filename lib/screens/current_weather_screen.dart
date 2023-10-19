import 'package:flutter/material.dart';
import 'package:weatherbran/models/datum.dart';

enum WeatherCondition {
  clear,
  cloudy,
  rainy,
  snowy,
  windy,
}

// @override
// Widget build(BuildContext context) {
//   //Recibir argumentos de otra pantalla
//   final Datum datum =
//       //d
//       ModalRoute.of(context)?.settings.arguments as Datum;
//   return Scaffold(
//     body: CustomScrollView(
//       //Widget con comportamientos predefinidos al scroll
//       slivers: [
//         SliverList(
//           delegate: SliverChildListDelegate.fixed(
//             [
//               _PosterAndTitle(movie: movie),
//               _Overview(),
//             ],
//           ),
//         )
//       ],
//     ),
//   );
// }

class CurrentWeatherScreen extends StatelessWidget {
  // final Datum datum;
//  CurrentWeatherScreen({super.key, required this.datum});
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
  final WeatherCondition weatherCondition;

  CurrentWeatherScreen({
    required this.city,
    required this.temperature,
    required this.feelsLike,
    required this.humidity,
    required this.rainProbability,
    required this.windSpeed,
    required this.windDirection,
    required this.clouds,
    required this.aqi,
    required this.weatherCondition,
    required this.dateTime,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(city),
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
                      getWeatherIcon(weatherCondition) ??
                          'assets/weather_unknown.png',
                      width: 200,
                    ),
                    Text(
                      "${temperature.toStringAsFixed(1)}°C",
                      style: TextStyle(fontSize: 24),
                    ),
                    Text(
                      "${feelsLike.toStringAsFixed(1)}°C (sensación térmica)",
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
                      'Cantidad de nubes: ${clouds}',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Fecha y hora: ${dateTime.toIso8601String()}',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'AQI: ${aqi}',
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
