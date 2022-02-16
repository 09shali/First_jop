import 'package:flutter/material.dart';
import 'package:weather_app/misaldar/misal_page.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/weather_model_page.dart';
import 'package:weather_app/pages/weather_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WeatherModelPage(),
    );
  }
}

