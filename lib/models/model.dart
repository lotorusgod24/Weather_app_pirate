class WeatherInfo {
  final String description;
  final String icon;
  WeatherInfo({required this.description, required this.icon});

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    final description = json['description'];
    final icon = json['icon'];
    return WeatherInfo(description: description, icon: icon);
  }
}

class WeatherResponse {
  final String cityName;
  final double tempInfo;
  final WeatherInfo weatherInfo;
  final double feelsLikeTemp;

  WeatherResponse({
    required this.feelsLikeTemp,
    required this.weatherInfo,
    required this.tempInfo,
    required this.cityName,
  });

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    final cityName = json['name'];

    final tempInfo = json['main']['temp'];
    final feelsLikeTemp = json['main']['feels_like'];

    final weatherInfoJson = json['weather'][0];
    final weatherInfo = WeatherInfo.fromJson(weatherInfoJson);

    return WeatherResponse(
        feelsLikeTemp: feelsLikeTemp,
        cityName: cityName,
        tempInfo: tempInfo,
        weatherInfo: weatherInfo);
  }
}

class TemperatureInfo {
  final double temperature;
  final double likeTemperatur;

  TemperatureInfo({required this.likeTemperatur, required this.temperature});

  factory TemperatureInfo.fromJson(Map<String, dynamic> json) {
    final temperature = json['temp'];
    final likeTemperature = json['feels_like'];

    return TemperatureInfo(
        temperature: temperature, likeTemperatur: likeTemperature);
  }
}
