import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:crypto1/blocs/weather%20bloc/weather_state.dart';
import 'package:crypto1/repositories/day_weather_model.dart';
import 'package:crypto1/ui/helper/icon_maker.dart';

class WeeklyWeather extends StatelessWidget {
  WeatherLoaded weatherState;

  WeeklyWeather(this.weatherState, {super.key});

  @override
  Widget build(BuildContext context) {
    List<DayWeatherModel> daysWeather = weatherState.weathers;
    return Center(
      child: ListView.builder(


          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 7,
          itemBuilder: (context, index) {
            return Container(
              width: 120,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(daysWeather[index].day),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(size: 40,IconMaker(daysWeather[index].icon)),
                      ),
                      Text(daysWeather[index].description,overflow: TextOverflow.fade,maxLines: 1,),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(daysWeather[index].tempMax.toString()+"\u00b0"),
                            Text(daysWeather[index].tempMin.toString()+"\u00b0")
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
