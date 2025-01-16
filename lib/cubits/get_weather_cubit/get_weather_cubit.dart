import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherStates> {
  GetWeatherCubit() : super(WeatherInitialState());

  WeatherModel? weatherModel;

  getWeather(String cityName) async {
    try {
      weatherModel = await WeatherService().getWeatherData(cityName);

      emit(WeatherLoadedState(weatherModel));
    } catch (e) {
      emit(WeathearFailureState());
    }
  }
}
