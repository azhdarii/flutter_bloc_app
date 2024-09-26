import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crypto1/blocs/weather bloc/weather_bloc.dart';
import 'package:crypto1/blocs/weather bloc/weather_event.dart';
import 'package:crypto1/blocs/weather bloc/weather_state.dart';
import 'package:bloc/bloc.dart';

class MySearchBar extends StatelessWidget {
  TextEditingController textEditingController;

  MySearchBar(this.textEditingController);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {
            context
                .read<WeatherBloc>()
                .add(FetchWeatherEvent(textEditingController.text));
          },
          style: const ButtonStyle(),
          child: const Text('search'),
        ),
        Expanded(
            child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: TextField(
              controller: textEditingController,
              decoration: InputDecoration(
                hintText: 'insert your city',
              )),
        ))
      ],
    );
  }
}
