class DayWeatherModel {
  final String cityName;
  final String day;
  final String description;
  final double temperature;
  final double tempMin;
  final double tempMax;
  final double humidity;
  final double windSpeed;
  final String sunrise;
  final String sunset;
  final String icon;

  DayWeatherModel(
      this.cityName,
      this.day,
      this.description,
      this.temperature,
      this.tempMin,
      this.tempMax,
      this.humidity,
      this.windSpeed,
      this.sunrise,
      this.sunset, this.icon);
}
