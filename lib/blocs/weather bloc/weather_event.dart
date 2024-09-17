abstract class WeatherEvent{}
class FetchWeatherEvent extends WeatherEvent{
  String cityName;
  FetchWeatherEvent(this.cityName);
}