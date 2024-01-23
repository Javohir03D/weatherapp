import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:wheather/infrastructure/model/weather_data.dart';

class GetInfo {
  GetInfo._();

  static Future<WeatherData?> getWeather() async {
    final dio = Dio();
    try {
      final res = await dio.get(
        "https://api.weatherapi.com/v1/forecast.json?key=b5671b5fe8c54bab8f2175922242201&q=Tashkent&days=10",
      );

      return WeatherData.fromJson(res.data);
    } catch (e,s) {
      debugPrint("$e,$s");
    }
    return null;
  }
}
