part of 'weather_bloc.dart';

enum ResponseStatus { initial, loading, success, failure }

class WeatherState extends Equatable {
  final ResponseStatus status;
  final Weather weather;
  final bool isCelsius;

  const WeatherState({
    this.status = ResponseStatus.initial,
    Weather? weather,
    this.isCelsius = true,
  }) : weather = weather ?? Weather.empty;

  WeatherState copyWith({
    ResponseStatus? status,
    Weather? weather,
    bool? isCelsius,
  }) =>
      WeatherState(
        status: status ?? this.status,
        weather: weather ?? this.weather,
        isCelsius: isCelsius ?? this.isCelsius,
      );

  factory WeatherState.fromJson(Map<String, dynamic> json) =>
      _$WeatherStateFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherStateToJson(this);

  @override
  List<Object> get props => [
        status,
        weather,
        isCelsius,
      ];
}
