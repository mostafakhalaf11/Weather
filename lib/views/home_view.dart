import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather/views/search_view.dart';
import 'package:weather/widgets/custom_appbar.dart';
import 'package:weather/widgets/no_weather_body.dart';
import 'package:weather/widgets/weather_info_body.dart';
import '../cubits/get_weather_cubit/get_weather_state.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWeatherCubit, WeatherState>(
      builder: (context, state) {
        return Scaffold(
          appBar: MyAppBar(
            title: 'Weather App',
            actions: [
              Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return const SearchView();
                      }));
                    },
                    icon: const Icon(
                      Icons.search,
                      size: 32,
                    ),
                  ))
            ],
          ),
          body: BlocBuilder<GetWeatherCubit, WeatherState>(
            builder: (context, state) {
              if (state is WeatherInitialState) {
                return const NoWeatherBody();
              } else if (state is WeatherLoadedState) {
                return WeatherInfoBody(weatherModel: state.weatherModel);
              } else {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Oops There was No Location..Try Searching again!',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                );
              }
            },
          ),
        );
      },
    );
  }
}
