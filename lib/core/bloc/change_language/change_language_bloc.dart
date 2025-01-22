// lib/core/bloc/language/language_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopzen/core/bloc/change_language/change_language_event.dart';
import 'package:shopzen/core/bloc/change_language/change_language_state.dart';
import '../../app/app_prefs.dart';
import '../../app/app_localizations_setup.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  final AppPreferences _appPreferences;

  LanguageBloc({
    required AppPreferences appPreferences,
  }) : _appPreferences = appPreferences,
       super(LanguageState.initial(appPreferences.getLocal())) {
    
    on<GetCurrentLanguage>(_getCurrentLanguage);
    on<ChangeLanguageToEnglish>(_changeToEnglish);
    on<ChangeLanguageToArabic>(_changeToArabic);
  }

  void _getCurrentLanguage(
    GetCurrentLanguage event,
    Emitter<LanguageState> emit,
  ) {
    emit(state.copyWith(locale: _appPreferences.getLocal()));
  }

  void _changeToEnglish(
    ChangeLanguageToEnglish event,
    Emitter<LanguageState> emit,
  ) async {
    if (!_appPreferences.isEnglish()) {
      await _appPreferences.changeAppLanguage();
      emit(state.copyWith(locale: ENGLISH_LOCAL));
    }
  }

  void _changeToArabic(
    ChangeLanguageToArabic event,
    Emitter<LanguageState> emit,
  ) async {
    if (_appPreferences.isEnglish()) {
      await _appPreferences.changeAppLanguage();
      emit(state.copyWith(locale: ARABIC_LOCAL));
    }
  }
}