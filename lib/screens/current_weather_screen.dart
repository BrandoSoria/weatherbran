import 'package:flutter/material.dart';
import 'package:weatherbran/models/datum.dart';

enum WeatherCondition {
  clear,
  cloudy,
  rainy,
  snowy,
  windy,
}

@override
Widget build(BuildContext context) {

  //Recibir argumentos de otra pantalla
  final Datum datum =
      //d
      ModalRoute.of(context)?.settings.arguments as Datum;
  return Scaffold(
    body: CustomScrollView(
      //Widget con comportamientos predefinidos al scroll
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate.fixed(
            [
              CurrentWeatherScreen(datum: datum),
            ],
          ),
        )
      ],
    ),
  );
}

class CurrentWeatherScreen extends StatelessWidget {
  final Datum? datum;

  CurrentWeatherScreen({super.key, required this.datum});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      //temperatura cambio new
                      this.datum?.weather.description ?? 'No hay datos',
                      style: TextStyle(fontSize: 24),
                    ),
                    Text(
                      "°C (sensación térmica)",
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
                      'Cantidad de nubes: ${datum?.clouds}',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Fecha y hora:',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'AQI: ${datum?.aqi}',
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
