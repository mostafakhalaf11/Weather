import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/get_weather_cubit/get_weather_cubit.dart';
import '../main.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  const MyAppBar({
    super.key,
    required this.title,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        actions: actions,
        backgroundColor: getThemeColor(
          BlocProvider.of<GetWeatherCubit>(context).weatherModel?.weatherStatus,
        )[100]);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
