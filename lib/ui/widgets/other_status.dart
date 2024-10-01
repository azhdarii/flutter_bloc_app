import 'package:flutter/material.dart';
import 'package:crypto1/blocs/weather%20bloc/weather_state.dart';
import 'package:crypto1/repositories/day_weather_model.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class OtherStatus extends StatelessWidget {
  WeatherLoaded weatherState;
   OtherStatus(this.weatherState,{super.key});


  @override
  Widget build(BuildContext context) {
    DayWeatherModel todayWeather = weatherState.weathers[0];
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Card(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [Text(AppLocalizations.of(context)!.humidity), Text(todayWeather.humidity.toString()+'%')],
            ),
          ),
        ),
        Card(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [Text(AppLocalizations.of(context)!.windSpeed), Text(todayWeather.windSpeed.toString())],
            ),
          ),
        ),
        Card(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [Text(AppLocalizations.of(context)!.sunrise), Text(todayWeather.sunrise)],
            ),
          ),
        ),
        Card(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [Text(AppLocalizations.of(context)!.sunset), Text(todayWeather.sunset)],
            ),
          ),
        )
      ],
    );
  }
}
