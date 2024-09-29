import 'package:crypto1/blocs/theme%20bloc/theme_event.dart';
import 'package:crypto1/blocs/theme%20bloc/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';

class ThemeBloc extends Bloc<ToggleThemeEvent, ThemeState> {
  ThemeBloc():super(LightThemeState()) {
    on<ToggleThemeEvent>(
      (event, emit) {
        print(state);
        if (state is LightThemeState) {
          emit(DarkThemeState());
        } else {
          emit(LightThemeState());
        }
      },
    );

  }
}
