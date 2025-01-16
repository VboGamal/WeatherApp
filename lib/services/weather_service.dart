import "package:dio/dio.dart";
import "package:weather_app/models/weather_model.dart";

final Dio dio = Dio();

class WeatherService {
  WeatherService();

  final String baseUrl = "https://api.weatherapi.com/v1";
  final String apiKey = "29e7ff6c0f0c4226a57201318250901";

  Future<WeatherModel?> getWeatherData(String city) async {
    try {
      var response =
          await dio.get("$baseUrl/forecast.json?key=$apiKey&q=$city");

      Map<String, dynamic> weatherDataMap = {};

      Map<String, dynamic> responseData = response.data;

      weatherDataMap["currentTemp"] = responseData["current"]["temp_c"];
      weatherDataMap["currentCondition"] =
          responseData["current"]["condition"]["text"];
      weatherDataMap["lastUpdate"] = responseData["current"]["last_updated"];
      weatherDataMap["humidity"] = responseData["current"]["humidity"];
      weatherDataMap["maxTemp"] =
          responseData["forecast"]["forecastday"][0]["day"]["maxtemp_c"];
      weatherDataMap["minTemp"] =
          responseData["forecast"]["forecastday"][0]["day"]["mintemp_c"];
      weatherDataMap["city"] = responseData["location"]["name"];
      weatherDataMap["img"] = responseData["current"]["condition"]["icon"];

      WeatherModel weatherModel = WeatherModel.fromData(weatherDataMap);

      return weatherModel;
    } on DioException catch (e) {
      final String errMsg =
          e.response?.data["eror"]["message"] ?? "Eror, Try again later";
      throw Exception(errMsg);
    } catch (e) {
      throw Exception("Eror, Try again Later");
    }
  }
}
