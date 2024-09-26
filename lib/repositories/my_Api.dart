import 'package:crypto1/repositories/day_weather_model.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
class MyApi{
  Future<List<DayWeatherModel>> sendRequest7days(String City) async {
    List<DayWeatherModel> weatherData = [];

    String key = 'your key';

      var response = await Dio().get(
          'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/$City',
          queryParameters: {
            'key': key,
            'include': 'days',
            'unitGroup': 'metric',
            'elements': 'icon,conditions,temp,tempmax,tempmin,humidity,windspeed,datetimeEpoch,sunrise,sunset'

            // 'elements': 'temp,tempmax,tempmin,datetimeEpoch,conditions,datetime'
          });

      // var response = await Dio().get(
      //     'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/$City',
      //     queryParameters: {
      //       'key': key,
      //       'include': 'days',
      //       'unitGroup': 'metric',
      //       // 'elements': 'conditions,description,temp,tempmax,tempmin,pressure,humidity,windspeed,datetimeEpoch,resolvedAddress,sunrise,sunset'
      //     });




      DayWeatherModel dayWeatherModel;

      var formatter = DateFormat.E();

      for (int i = 0; i < 7; i++) {
        var dayData = response.data['days'][i];
        var date = formatter.format(DateTime.fromMillisecondsSinceEpoch(
            dayData['datetimeEpoch'] * 1000,
            isUtc: true));

        dayWeatherModel = DayWeatherModel(response.data['address'],date, dayData['conditions'], dayData['temp'],
            dayData['tempmin'], dayData['tempmax'],dayData['humidity'],dayData['windspeed'],dayData['sunrise'],dayData['sunset'],dayData['icon']);
        weatherData.add(dayWeatherModel);
      }



      return weatherData;





  }
}