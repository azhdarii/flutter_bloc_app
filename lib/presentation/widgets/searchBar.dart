import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crypto1/presentation/blocs/weather bloc/weather_bloc.dart';
import 'package:crypto1/presentation/blocs/weather bloc/weather_event.dart';
import 'package:crypto1/presentation/blocs/weather bloc/weather_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MySearchBar extends StatelessWidget {
  TextEditingController textEditingController;

  MySearchBar(this.textEditingController);

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
        ElevatedButton(
        onPressed: ()
    {
      context.read<WeatherBloc>().add(FetchWeatherEvent(
          textEditingController.text,
          Localizations
              .localeOf(context)
              .languageCode));
    },
    style: const ButtonStyle(),
    child: Text(AppLocalizations.of(context)!.search),
    ),
    Expanded(
    child: Padding(
    padding: EdgeInsets.only(left: 10, right: 10),
    child: TextField(
    style: TextStyle(
    fontSize: 18,
    color: Colors.grey[50], // Text color
    ),
    controller: textEditingController,
    decoration: InputDecoration(
    hintText: AppLocalizations.of(context)!.searchHint,
    hintStyle: TextStyle(color: Colors.grey[50]),
    focusColor: Colors.white,
    border: OutlineInputBorder(
    borderSide: BorderSide(),
    borderRadius: BorderRadius.circular(20))))
    ,
    )
    )
    ]
    ,
    );
  }
}
