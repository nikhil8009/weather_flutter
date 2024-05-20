import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/src/bloc/weather_bloc/weather_bloc.dart';
import 'package:weather/src/views/search/search_screen.dart';
import 'package:weather/src/views/settings/settings_screen.dart';
import 'package:weather/src/views/weather/components/current_weather.dart';
import 'package:weather/src/views/weather/components/weather_empty.dart';
import 'package:weather/src/views/weather/components/weather_error.dart';
import 'package:weather/src/views/weather/components/weather_loading.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.of(context).push<void>(
                MaterialPageRoute(
                  builder: (context) => const SettingsScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            //Bloc initial state
            if (state.status == ResponseStatus.initial) {
              return const WeatherEmpty();
            }

            //Bloc loading state
            if (state.status == ResponseStatus.loading) {
              return const WeatherLoading();
            }

            //Bloc failure state
            if (state.status == ResponseStatus.failure) {
              return const WeatherError();
            }

            //Bloc success state with data
            return CurrentWeather(
              weather: state.weather,
            );
          },
        ),
      ),
      //Floating button to navigate to search screen
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.search,
        ),
        onPressed: () async {
          final city = await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const SearchScreen(),
            ),
          );
          if (city == null) return;
          if (!context.mounted) return;
          //Refresh bloc with city entered by user
          context.read<WeatherBloc>().add(
                FetchWeather(
                  city: city,
                ),
              );
        },
      ),
    );
  }
}
