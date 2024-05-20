// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
      cloudPct: (json['cloud_pct'] as num?)?.toInt(),
      temp: (json['temp'] as num?)?.toInt(),
      feelsLike: (json['feels_like'] as num?)?.toInt(),
      humidity: (json['humidity'] as num?)?.toInt(),
      minTemp: (json['min_temp'] as num?)?.toInt(),
      maxTemp: (json['max_temp'] as num?)?.toInt(),
      windSpeed: (json['wind_speed'] as num?)?.toDouble(),
      windDegrees: (json['wind_degrees'] as num?)?.toInt(),
      sunrise: (json['sunrise'] as num?)?.toInt(),
      sunset: (json['sunset'] as num?)?.toInt(),
      city: json['city'] as String?,
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'cloud_pct': instance.cloudPct,
      'temp': instance.temp,
      'feels_like': instance.feelsLike,
      'humidity': instance.humidity,
      'min_temp': instance.minTemp,
      'max_temp': instance.maxTemp,
      'wind_speed': instance.windSpeed,
      'wind_degrees': instance.windDegrees,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
      'city': instance.city,
    };
