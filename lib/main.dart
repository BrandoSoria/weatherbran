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
  //

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meteorologia',
      initialRoute: 'home',
      routes: {
        //
        'home': (_) =>CurrentWeatherScreen(datum: null,),
      },
    );
  }
}
