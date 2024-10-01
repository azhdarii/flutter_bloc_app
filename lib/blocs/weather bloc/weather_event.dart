abstract class WeatherEvent{}
class FetchWeatherEvent extends WeatherEvent{
  String cityName;
  String currentLanguage;

  FetchWeatherEvent(this.cityName, this.currentLanguage);
}