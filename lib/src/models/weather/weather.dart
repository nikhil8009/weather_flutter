import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather extends Equatable {
  @JsonKey(name: 'cloud_pct')
  final int? cloudPct;
  final int? temp;
  @JsonKey(name: 'feels_like')
  final int? feelsLike;
  final int? humidity;
  @JsonKey(name: 'min_temp')
  final int? minTemp;
  @JsonKey(name: 'max_temp')
  final int? maxTemp;
  @JsonKey(name: 'wind_speed')
  final double? windSpeed;
  @JsonKey(name: 'wind_degrees')
  final int? windDegrees;
  final int? sunrise;
  final int? sunset;
  final String? city;

  const Weather({
    this.cloudPct,
    this.temp,
    this.feelsLike,
    this.humidity,
    this.minTemp,
    this.maxTemp,
    this.windSpeed,
    this.windDegrees,
    this.sunrise,
    this.sunset,
    this.city,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return _$WeatherFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WeatherToJson(this);

  Weather copyWith({
    int? cloudPct,
    int? temp,
    int? feelsLike,
    int? humidity,
    int? minTemp,
    int? maxTemp,
    double? windSpeed,
    int? windDegrees,
    int? sunrise,
    int? sunset,
    String? city,
  }) {
    return Weather(
      cloudPct: cloudPct ?? this.cloudPct,
      temp: temp ?? this.temp,
      feelsLike: feelsLike ?? this.feelsLike,
      humidity: humidity ?? this.humidity,
      minTemp: minTemp ?? this.minTemp,
      maxTemp: maxTemp ?? this.maxTemp,
      windSpeed: windSpeed ?? this.windSpeed,
      windDegrees: windDegrees ?? this.windDegrees,
      sunrise: sunrise ?? this.sunrise,
      sunset: sunset ?? this.sunset,
      city: city ?? this.city,
    );
  }

  static const empty = Weather(
    cloudPct: 0,
    temp: 0,
    feelsLike: 0,
    humidity: 0,
    minTemp: 0,
    maxTemp: 0,
    windSpeed: 0,
    windDegrees: 0,
    sunrise: 0,
    sunset: 0,
    city: "",
  );

  @override
  List<Object?> get props {
    return [
      cloudPct,
      temp,
      feelsLike,
      humidity,
      minTemp,
      maxTemp,
      windSpeed,
      windDegrees,
      sunrise,
      sunset,
      city,
    ];
  }
}
