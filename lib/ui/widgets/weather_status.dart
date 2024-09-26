import 'package:crypto1/blocs/weather%20bloc/weather_state.dart';
import 'package:crypto1/repositories/day_weather_model.dart';
import 'package:flutter/material.dart';
import 'package:crypto1/ui/helper/icon_maker.dart';

class WeatherStatus extends StatelessWidget {
  WeatherLoaded weatherState;

  WeatherStatus(this.weatherState, {super.key});

  @override
  Widget build(BuildContext context) {
    DayWeatherModel todayWeather = weatherState.weathers[0];

    return Column(
      children: [

        Padding(
          padding: const EdgeInsets.only(bottom: 10.0, top: 30),
          child: Text(
            todayWeather.cityName,
            style: const TextStyle(fontSize: 25),
          ),
        ),
        Icon(size: 60,IconMaker(todayWeather.icon))
        ,
        Padding(
          padding: EdgeInsets.only(
            bottom: 10.0,
          ),
          child: Text(
            todayWeather.temperature.toString(),
            style: TextStyle(fontSize: 40),
          ),
        ),
        Text(
          todayWeather.description,
          style: TextStyle(fontSize: 20),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [Text('max'), Text(todayWeather.tempMax.toString())],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [Text('min'), Text(todayWeather.tempMin.toString())],
              ),
            )
          ],
        )
      ],
    );
  }
}
