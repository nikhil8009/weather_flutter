import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/weather_bloc/weather_bloc.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Settings",
        ),
      ),
      body: Column(
        children: [
          //Toggle for switching between units
          BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
              return SwitchListTile(
                value: !state.isCelsius,
                title: Text("Change unit to ${state.isCelsius ? "°F" : "°C"}"),
                onChanged: (_) => context.read<WeatherBloc>().add(
                      ToggleUnits(),
                    ),
              );
            },
          ),
        ],
      ),
    );
  }
}
