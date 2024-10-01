import 'package:bloc/bloc.dart';
import 'package:crypto1/blocs/language%20bloc/language_event.dart';
import 'package:crypto1/blocs/language%20bloc/language_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(EnglishState()) {
    on<ChangeLanguageEvent>(
      (event, emit) {
        if (event.Language == 'fa') {
          emit(FarsiState());
        }
        // else if(event.Language=='en')
        else {
          emit(EnglishState());
        }
      },
    );
  }
}
