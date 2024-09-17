import 'package:bloc/bloc.dart';
import 'package:crypto1/blocs/weather%20bloc/weather_event.dart';
import 'package:crypto1/blocs/weather%20bloc/weather_state.dart';
import 'package:crypto1/repositories/day_weather_model.dart';
import 'package:crypto1/repositories/my_Api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {

    on<FetchWeatherEvent>((event, emit) async {
      List<DayWeatherModel> dayWeatherModels;
      MyApi myApi = MyApi();
      emit(WeatherLoading());
      try {
        dayWeatherModels =await myApi.sendRequest7days(event.cityName);
        print(dayWeatherModels);
        emit(WeatherLoaded(dayWeatherModels));
      } catch (e) {
        emit(WeatherError(e.toString()));
      }
    });

    add(FetchWeatherEvent('tehran'));
  }

}
