import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_clone/screens/home_screen.dart';

void main() => runApp(WeatherApp());

class WeatherApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return MaterialApp(
      title: 'Weather',
      home: HomeScreen(),
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        accentColor: Colors.lightBlueAccent,
      ),
    );
  }

}