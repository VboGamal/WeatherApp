import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  String? currentCondion;
  Color? currentColor;

  void updateWeatherCondion(condion) {
    setState(() {
      currentColor = getWeatherColor(condion);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(builder: (context) {
        return MaterialApp(
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: currentColor == null ? Colors.blue : currentColor!,
            ),
          ),
          debugShowCheckedModeBanner: false,
          home: BlocListener<GetWeatherCubit, WeatherStates>(
            listener: (context, state) {
              if (state is WeatherLoadedState) {
                updateWeatherCondion(BlocProvider.of<GetWeatherCubit>(context)
                    .weatherModel!
                    .currentCondition);
              }
            },
            child: const HomeView(),
          ),
        );
      }),
    );
  }
}

MaterialColor getWeatherColor(String condition) {
  // Convert to lowercase for case-insensitive comparison
  final lowercaseCondition = condition.toLowerCase();

  // Clear and sunny conditions
  if (lowercaseCondition.contains('sunny') ||
      lowercaseCondition.contains('clear')) {
    return Colors.yellow;
  }

  // Cloudy conditions
  if (lowercaseCondition.contains('cloudy') ||
      lowercaseCondition.contains('overcast')) {
    return Colors.grey;
  }

  // Thunder conditions
  if (lowercaseCondition.contains('thunder')) {
    return Colors.deepPurple;
  }

  // Snow and blizzard conditions
  if (lowercaseCondition.contains('snow') ||
      lowercaseCondition.contains('blizzard')) {
    return Colors.lightBlue;
  }

  // Rain and drizzle conditions
  if (lowercaseCondition.contains('rain') ||
      lowercaseCondition.contains('drizzle') ||
      lowercaseCondition.contains('shower')) {
    return Colors.blue;
  }

  // Sleet conditions
  if (lowercaseCondition.contains('sleet')) {
    return Colors.indigo;
  }

  // Ice conditions
  if (lowercaseCondition.contains('ice') ||
      lowercaseCondition.contains('freezing')) {
    return Colors.cyan;
  }

  // Fog and mist conditions
  if (lowercaseCondition.contains('fog') ||
      lowercaseCondition.contains('mist')) {
    return Colors.blueGrey;
  }

  // Default color for any unhandled conditions
  return Colors.grey;
}
