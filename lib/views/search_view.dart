import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weather/widgets/custom_appbar.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    return BlocBuilder<GetWeatherCubit, WeatherState>(
      builder: (context, state) {
        return Scaffold(
            appBar: const MyAppBar(
              title: 'Search For City',
            ),
            body: Center(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: textController,
                onSubmitted: (value) async {
                  var getWeatherCubit =
                      BlocProvider.of<GetWeatherCubit>(context);
                  getWeatherCubit.getWeather(cityName: value);
                  Navigator.pop(context);
                },
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        var getWeatherCubit =
                            BlocProvider.of<GetWeatherCubit>(context);
                        getWeatherCubit.getWeather(
                            cityName: textController.text);
                        Navigator.pop(context);
                      },
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 24),
                    labelText: 'Search',
                    hintText: 'Enter city name...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: const BorderSide(),
                    )),
              ),
            )));
      },
    );
  }
}
