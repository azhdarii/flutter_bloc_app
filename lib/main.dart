import 'dart:async';
import 'dart:js_interop';
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
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {



    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'weather app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
      ),
      // darkTheme: ThemeData(
      //     useMaterial3: true,
      //     colorScheme: ColorScheme.fromSeed(
      //         seedColor: Colors.blue, brightness: Brightness.dark)),
      // themeMode: ThemeMode.system,
      home: const MyHomePage(),
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

  TextEditingController textEditingController=TextEditingController();



  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Weather'),
        centerTitle: true,
      ),
      body: Container(decoration: BoxDecoration(),
        child: Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Center(
                child: Container(
                    height: 3000,
                    child:BlocProvider (
                      create: (context)=>WeatherBloc(),
                      child:BlocBuilder<WeatherBloc,WeatherState>(
                        builder: (context,state){
                          if(state is WeatherLoading){
                            return Center(child: CircularProgressIndicator());
                          }
                          else if(state is WeatherLoaded){
                            return  Column(
                              children: [
                                MySearchBar(textEditingController),
                                WeatherStatus(state),

                                   Container(width:MediaQuery.of(context).size.width,height: 150,child: WeeklyWeather(state)),

                                OtherStatus(state)






                              ],
                            );
                          }
                          else if(state is WeatherError){
                            return Text(state.message);
                          }
                          else return Text('nothing');

                        },
                      )
                    )
                )
            ),
          ),
        ),
      ),
    );
  }
}
