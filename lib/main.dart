import 'dart:async';
import 'dart:js_interop';
import 'package:crypto1/blocs/language%20bloc/language_bloc.dart';
import 'package:crypto1/blocs/language%20bloc/language_event.dart';
import 'package:crypto1/blocs/language%20bloc/language_state.dart';
import 'package:crypto1/blocs/theme%20bloc/theme_bloc.dart';
import 'package:crypto1/blocs/theme bloc/theme_state.dart';
import 'package:crypto1/blocs/theme%20bloc/theme_event.dart';
import 'package:crypto1/blocs/weather%20bloc/weather_bloc.dart';
import 'package:crypto1/blocs/weather%20bloc/weather_event.dart';
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
import 'package:intl/intl.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => ThemeBloc(),
      ),
      BlocProvider(
        create: (context) => LanguageBloc(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) =>
          BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, langState) => MaterialApp(
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            Locale('en'), // English
            Locale('fa'), // farsi
          ],
          locale: Locale.fromSubtags(languageCode: langState.language),
          debugShowCheckedModeBanner: false,
          title: 'weather app',
          theme: themeState.themeData,
          home: const MyHomePage(),

          //   routes:{
          //  // '/':(context)=>MyHomePage(),
          // '/second':(context)=>SecondPage()
          //
          //   },
        ),
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

  void handleClick(String value) {
    switch (value) {
      case 'English(en)':
        context.read<LanguageBloc>().add(ChangeLanguageEvent('en'));

        break;
      case 'farsi(fa)':
        context.read<LanguageBloc>().add(ChangeLanguageEvent('fa'));

        break;
    }
  }

  var myState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: Drawer(
      //     child: Column(
      //   children: [
      //     Text('language'),
      //   ],
      // )),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
              onPressed: () {
                context.read<ThemeBloc>().add(ToggleThemeEvent());
              },
              icon: Icon(context.watch<ThemeBloc>().state is LightThemeState
                  ? Icons.dark_mode
                  : Icons.light_mode)),
          PopupMenuButton<String>(
              icon: Icon(Icons.translate_outlined),
              onSelected: handleClick,
              itemBuilder: (BuildContext context) {
                return {'English(en)', 'farsi(fa)'}.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              })
        ],
        title: Text(AppLocalizations.of(context)!.weather),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => WeatherBloc(),
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) => Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(isCurrentTimeAfter(state is WeatherLoaded?state.weathers[0].sunset:'00:00:00')),
                    fit: BoxFit.cover)),
            child: Expanded(
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Center(
                        child: Container(
                      height: 1000,
                      child: w(state, textEditingController, context),
                    )
                    )
                )
            ),
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(onPressed: (){Navigator.of(context).pushNamed('/second');},),
    );
  }
}

String isCurrentTimeAfter(String timeString) {

  DateTime now = DateTime.now();
  DateFormat format = DateFormat('HH:mm:ss');


  DateTime inputTime = format.parse(timeString);


  inputTime = DateTime(now.year, now.month, now.day, inputTime.hour,
      inputTime.minute, inputTime.second);


  if (now.isAfter(inputTime)) {
    return 'assets/images/1 (1).jpg';
  } else {
    return 'assets/images/1 (2).jpg';
  }
}

Widget w(state, textEditingController, context) {
  if (state is WeatherLoading) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          height: 50, width: 50, child: JumpingDotsProgressIndicator()),
    );
  } else if (state is WeatherLoaded) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top:8.0,bottom: 15),
          child: MySearchBar(textEditingController),
        ),
        WeatherStatus(state),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              child: WeeklyWeather(state)),
        ),
        OtherStatus(state)
      ],
    );
  } else if (state is WeatherError) {
    return Text(state.message);
  } else
    return Text('nothing');
}
