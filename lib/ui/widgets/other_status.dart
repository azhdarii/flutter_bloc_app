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
    DayWeatherModel todayWeather = weatherState.weathers[1];
    String source1='sample name';
    String source2='sample data';

    return
       Container(height: 100,
         child: ListView.builder(
         
         
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) {
              switch(index){
                case 0:
                  source1=AppLocalizations.of(context)!.humidity;
                  source2=todayWeather.humidity.toString()+'%';
                  break;
                case 1:
                  source1=AppLocalizations.of(context)!.windSpeed;
                  source2=todayWeather.windSpeed.toString()+'km/h';
                  break;
                case 2:
                  source1=AppLocalizations.of(context)!.sunrise;
                  source2=todayWeather.sunrise.toString();
                  break;
                case 3:
                  source1=AppLocalizations.of(context)!.sunset;
                  source2=todayWeather.sunset.toString();
                  break;
              }
         
              return
         
                   Padding(
                     padding: const EdgeInsets.all(15.0),
                     child: Card(
                       child: Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [

                              Text(source1,),
                              Text(source2)


                            ],

                                           ),
                       ),
                     ),
                   );
            }),
       );
    // return  Row(
    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //   children: [
    //     Card(
    //       child: Padding(
    //         padding: EdgeInsets.all(8.0),
    //         child: Column(
    //           children: [Text(AppLocalizations.of(context)!.humidity), Text(todayWeather.humidity.toString()+'%')],
    //         ),
    //       ),
    //     ),
    //     Card(
    //       child: Padding(
    //         padding: EdgeInsets.all(8.0),
    //         child: Column(
    //           children: [Text(AppLocalizations.of(context)!.windSpeed), Text(todayWeather.windSpeed.toString())],
    //         ),
    //       ),
    //     ),
    //     Card(
    //       child: Padding(
    //         padding: EdgeInsets.all(8.0),
    //         child: Column(
    //           children: [Text(AppLocalizations.of(context)!.sunrise), Text(todayWeather.sunrise)],
    //         ),
    //       ),
    //     ),
    //     Card(
    //       child: Padding(
    //         padding: EdgeInsets.all(8.0),
    //         child: Column(
    //           children: [Text(AppLocalizations.of(context)!.sunset), Text(todayWeather.sunset)],
    //         ),
    //       ),
    //     )
    //   ],
    // );
  }
}
