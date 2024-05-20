// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherState _$WeatherStateFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'WeatherState',
      json,
      ($checkedConvert) {
        final val = WeatherState(
            status: $checkedConvert(
                'status',
                (v) =>
                    $enumDecodeNullable(_$WeatherStatusEnumMap, v) ??
                    ResponseStatus.initial),
            weather: $checkedConvert(
                'weather',
                (v) => v == null
                    ? null
                    : Weather.fromJson(v as Map<String, dynamic>)),
            isCelsius: $checkedConvert(
                'isCelsius', (v) => v == null ? true : v as bool));
        return val;
      },
    );

Map<String, dynamic> _$WeatherStateToJson(WeatherState instance) =>
    <String, dynamic>{
      'status': _$WeatherStatusEnumMap[instance.status]!,
      'weather': instance.weather.toJson(),
      'isCelsius': instance.isCelsius,
    };

const _$WeatherStatusEnumMap = {
  ResponseStatus.initial: 'initial',
  ResponseStatus.loading: 'loading',
  ResponseStatus.success: 'success',
  ResponseStatus.failure: 'failure',
};
