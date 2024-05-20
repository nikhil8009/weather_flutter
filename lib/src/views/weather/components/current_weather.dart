import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/src/bloc/weather_bloc/weather_bloc.dart';
import 'package:weather/src/models/weather/weather.dart';

class CurrentWeather extends StatelessWidget {
  final Weather weather;
  const CurrentWeather({
    super.key,
    required this.weather,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 48),
        Text(
          weather.city!,
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w200,
          ),
        ),
        Text(
          formattedWeather(
            weather.temp!,
            context.watch<WeatherBloc>().state.isCelsius,
          ),
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "${formattedWeather(
            weather.maxTemp!,
            context.watch<WeatherBloc>().state.isCelsius,
          )} / ${formattedWeather(
            weather.minTemp!,
            context.watch<WeatherBloc>().state.isCelsius,
          )} Feels like ${formattedWeather(
            weather.feelsLike!,
            context.watch<WeatherBloc>().state.isCelsius,
          )}",
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "💧",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${weather.humidity}%",
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      const Text(
                        "Humidity",
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    " 🌫 ",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${weather.windSpeed} km/h",
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      const Text(
                        "Wind",
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }

  String formattedWeather(int temp, bool isCelsius) {
    return isCelsius
        ? '${temp.toStringAsPrecision(2)}°C'
        : "${(temp * 9 / 5) + 32}°F";
  }
}
