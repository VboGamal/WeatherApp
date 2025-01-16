class WeatherModel {
  final double currentTemp;
  final String currentCondition;
  final String lastUpdate;
  final num humidity;
  final double maxTemp;
  final double minTemp;
  final String city;
  final String? img;

  WeatherModel({
    required this.currentTemp,
    required this.currentCondition,
    required this.lastUpdate,
    required this.humidity,
    required this.maxTemp,
    required this.minTemp,
    required this.city,
    required this.img,
  });

  factory WeatherModel.fromData(Map<String, dynamic> data) {
    return WeatherModel(
      currentTemp: data["currentTemp"] as double,
      currentCondition: data["currentCondition"] as String,
      lastUpdate: data["lastUpdate"] as String,
      humidity: data["humidity"] as num,
      maxTemp: data["maxTemp"] as double,
      minTemp: data["minTemp"] as double,
      city: data["city"] as String,
      img: data["img"] as String?,
    );
  }
}
