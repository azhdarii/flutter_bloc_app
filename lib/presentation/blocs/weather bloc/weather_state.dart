import 'package:crypto1/data/models/day_weather_model.dart';

abstract class WeatherState{}
class WeatherLoading extends WeatherState{}
class WeatherLoaded extends WeatherState{
  final List<DayWeatherModel> weathers;

  WeatherLoaded(this.weathers);

}
class WeatherError extends WeatherState{
  final String message;

  WeatherError(this.message);
}

class WeatherInitial extends WeatherState {}