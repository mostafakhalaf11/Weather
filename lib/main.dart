import 'package:flutter/material.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather/views/home_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const Weather());
}

class Weather extends StatelessWidget {
  const Weather({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(builder: (context) {
        return MaterialApp(
          theme: ThemeData(
            primarySwatch: getThemeColor(
              BlocProvider.of<GetWeatherCubit>(context)
                  .weatherModel
                  ?.weatherStatus,
            ),
          ),
          debugShowCheckedModeBanner: false,
          home: const HomeView(),
        );
      }),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  switch (condition) {
    case 'Sunny':
      return Colors.yellow;
    case 'Clear':
      return Colors.blue;
    case 'Partly cloudy':
    case 'Fog':
    case 'Freezing fog':
      return Colors.lightBlue;
    case 'Cloudy':
    case 'Overcast':
    case 'Mist':
      return Colors.grey;
    case 'Patchy rain possible':
    case 'Patchy snow possible':
    case 'Patchy sleet possible':
    case 'Patchy freezing drizzle possible':
    case 'Thundery outbreaks possible':
    case 'Blowing snow':
    case 'Blizzard':
      return Colors.blueGrey;
    case 'Patchy light drizzle':
    case 'Light drizzle':
    case 'Freezing drizzle':
    case 'Heavy freezing drizzle':
    case 'Patchy light rain':
    case 'Light rain':
    case 'Moderate rain at times':
    case 'Moderate rain':
    case 'Heavy rain at times':
    case 'Heavy rain':
    case 'Light freezing rain':
    case 'Moderate or heavy freezing rain':
      return Colors.blue;
    case 'Light sleet':
    case 'Moderate or heavy sleet':
    case 'Patchy light snow':
    case 'Light snow':
    case 'Patchy moderate snow':
    case 'Moderate snow':
    case 'Patchy heavy snow':
    case 'Heavy snow':
    case 'Ice pellets':
      return Colors.cyan;
    case 'Light rain shower':
    case 'Moderate or heavy rain shower':
    case 'Torrential rain shower':
    case 'Light sleet showers':
    case 'Moderate or heavy sleet showers':
    case 'Light snow showers':
    case 'Moderate or heavy snow showers':
    case 'Light showers of ice pellets':
    case 'Moderate or heavy showers of ice pellets':
      return Colors.lightBlue;
    case 'Patchy light rain with thunder':
    case 'Moderate or heavy rain with thunder':
    case 'Patchy light snow with thunder':
    case 'Moderate or heavy snow with thunder':
      return Colors.orange;
    default:
      return Colors.lightBlue;
  }
}
