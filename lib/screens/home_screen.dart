import 'package:flutter/material.dart';
import 'package:weather_clone/widgets/background_widget.dart';
import 'package:weather_clone/widgets/weather_widget.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        BackgroundWidget(),
        WeatherWidget(),
      ],
    );
  }

}