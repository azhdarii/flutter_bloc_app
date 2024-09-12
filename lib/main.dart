import 'dart:js_interop';

import 'package:crypto1/providers/currentTheme.dart';
import 'package:crypto1/ui/widgets/themeSwitcher.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, mamad, child) {
      var myThemeMode = (mamad.isDark) ? ThemeMode.dark : ThemeMode.light;

      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'azhoo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.blue, brightness: Brightness.dark)),
        themeMode: myThemeMode,
        home: const MyHomePage(),
      );
    });
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
  var counter = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Exchange'),
        centerTitle: true,
        actions: [Themeswitcher()],
      ),
      body: Expanded(
        child: Center(
            child: Container(
          child: ValueListenableBuilder<int>(
            valueListenable: counter,
            builder: (context, jojo, child) {
              return Text('$jojo');
            },
          ),
        )),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){counter.value++;},),
    );
  }
}
