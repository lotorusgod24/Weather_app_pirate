import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app_pirate/models/model.dart';

class DataService {
  Future<WeatherResponse> getWeather(String city) async {
    final queryParametrs = {
      'q': city,
      'appid': 'b4cf65c8fbf696644bf485c760eac4ad',
      'units': 'metric',
      'lang': 'ru'
    };

    final uri =
        Uri.http('api.openweathermap.org', '/data/2.5/weather', queryParametrs);

    final response = await http.get(uri);
    print(response.body);
    final json = jsonDecode(response.body);

    return WeatherResponse.fromJson(json);
  }
}
