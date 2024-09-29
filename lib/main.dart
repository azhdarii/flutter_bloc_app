import 'dart:async';
import 'dart:js_interop';
import 'package:crypto1/blocs/theme%20bloc/theme_bloc.dart';
import 'package:crypto1/blocs/theme bloc/theme_state.dart';
import 'package:crypto1/blocs/theme%20bloc/theme_event.dart';
import 'package:crypto1/blocs/weather%20bloc/weather_bloc.dart';
import 'package:crypto1/blocs/weather%20bloc/weather_state.dart';
import 'package:crypto1/repositories/day_weather_model.dart';
import 'package:crypto1/repositories/my_Api.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:crypto1/ui/widgets/other_status.dart';
import 'package:crypto1/ui/widgets/searchBar.dart';
import 'package:crypto1/ui/widgets/weather_status.dart';
import 'package:crypto1/ui/widgets/weekly_weather.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => ThemeBloc(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'weather app',
         theme: themeState.themeData,
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // functions and variables here

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        actions: [IconButton(onPressed: (){
          context.read<ThemeBloc>().add(ToggleThemeEvent());

        }, icon: Icon(context.watch<ThemeBloc>().state is LightThemeState?Icons.dark_mode:Icons.light_mode))],
        title: Text('Weather'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(),
        child: Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Center(
                child: Container(
                    height: 3000,
                    child: BlocProvider(
                        create: (context) => WeatherBloc(),
                        child: BlocBuilder<WeatherBloc, WeatherState>(
                          builder: (context, state) {
                            if (state is WeatherLoading) {
                              return Center(child: CircularProgressIndicator());
                            } else if (state is WeatherLoaded) {
                              return Column(
                                children: [
                                  MySearchBar(textEditingController),
                                  WeatherStatus(state),
                                  Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 150,
                                      child: WeeklyWeather(state)),
                                  OtherStatus(state)
                                ],
                              );
                            } else if (state is WeatherError) {
                              return Text(state.message);
                            } else
                              return Text('nothing');
                          },
                        )))),
          ),
        ),
      ),
    );
  }
}
