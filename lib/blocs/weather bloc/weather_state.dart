import 'package:crypto1/repositories/day_weather_model.dart';

abstract class WeatherState{}
class WeatherLoading extends WeatherState{}
class WeatherLoaded extends WeatherState{
  final List<DayWeatherModel> weather;

  WeatherLoaded(this.weather);

}
class WeatherError extends WeatherState{
  final String message;

  WeatherError(this.message);
}

class WeatherInitial extends WeatherState {}