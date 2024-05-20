import 'package:http/http.dart' as http;

import '../config/constants.dart';

class WeatherService {
  static Future<http.Response> fetchWeather(String city) async =>
      await http.get(
        Uri.parse(
          "${Constants.host}?city=$city",
        ),
        headers: {"X-Api-Key": Constants.apiKey},
      );
}
