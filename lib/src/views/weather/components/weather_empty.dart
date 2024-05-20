import 'package:flutter/material.dart';

class WeatherEmpty extends StatelessWidget {
  const WeatherEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('🏙️', style: TextStyle(fontSize: 64)),
        Text(
          'Please Select a City!',
        ),
      ],
    );
  }
}
