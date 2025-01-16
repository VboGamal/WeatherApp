import 'package:weather_app/models/weather_model.dart';

class WeatherStates {}

class WeatherInitialState extends WeatherStates {}

class WeatherLoadedState extends WeatherStates {
  WeatherModel? weatherModel;
  WeatherLoadedState(this.weatherModel);
}

class WeathearFailureState extends WeatherStates {}
