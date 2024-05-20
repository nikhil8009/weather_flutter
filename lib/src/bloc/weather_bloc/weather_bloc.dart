import 'dart:async';
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather/src/services/weather_service.dart';

import '../../models/weather/weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';
part 'weather_bloc.g.dart';

class WeatherBloc extends HydratedBloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(const WeatherState()) {
    on<FetchWeather>(_fetchWeather);
    on<ToggleUnits>(_toggleUnits);
  }

  FutureOr<void> _fetchWeather(
      FetchWeather event, Emitter<WeatherState> emit) async {
    try {
      emit(
        state.copyWith(
          status: ResponseStatus.loading,
        ),
      );

      final response = await WeatherService.fetchWeather(event.city);
      if (response.statusCode == 200) {
        return emit(
          state.copyWith(
            status: ResponseStatus.success,
            weather: Weather.fromJson(
              jsonDecode(response.body),
            ).copyWith(
              city: event.city,
            ),
          ),
        );
      }
      emit(
        state.copyWith(
          status: ResponseStatus.failure,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: ResponseStatus.failure,
        ),
      );
    }
  }

  @override
  WeatherState? fromJson(Map<String, dynamic> json) =>
      WeatherState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(WeatherState state) => state.toJson();

  FutureOr<void> _toggleUnits(ToggleUnits event, Emitter<WeatherState> emit) {
    emit(
      state.copyWith(
        isCelsius: !state.isCelsius,
      ),
    );
  }
}
