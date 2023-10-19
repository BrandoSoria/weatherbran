import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherbran/providers/weather_provider.dart';
import 'package:weatherbran/screens/current_weather_screen.dart';
void main() => runApp(const AppState());


class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => WeatherProvider(),
          lazy: false,
        )
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peliculas',
      initialRoute: 'home',
      routes: {
        'home': (_) => CurrentWeatherScreen(city: 'Delicias, México',
        temperature: 20.0,
        feelsLike: 22.0,
        humidity: 50.0,
        rainProbability: 10.0,
        windSpeed: 10.0,
        windDirection: 90.0,
        clouds: 45,
        aqi: 22, 
       weatherCondition: WeatherCondition.clear, 
       dateTime: DateTime.now(), 
        
        ),
    
       
      },
    );
  }
}