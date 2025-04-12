import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopzen/core/app/app_localizations.dart';
import 'package:shopzen/core/shared_pref/shared_pref.dart';

import '../../shared_pref/shared_prefs_key.dart';

part 'app_state.dart';
part 'app_cubit.freezed.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState.initial());
  bool isDark = true;

  String currentLangCode = ENGLISH;

//Theme Mode
  Future<void> changeAppThemeMode({bool? sharedMode}) async {
    if (sharedMode != null) {
      isDark = sharedMode;
      emit(AppState.changeThemeMode(isDark: isDark));
    } else {
      isDark = !isDark;
      await SharedPref().setBoolean(PrefKeys.themeMode, isDark).then((value) {
        emit(AppState.changeThemeMode(isDark: isDark));
      });
    }
  }

//Language Change
  void getSavedLanguage() {
    final result = SharedPref().containPreference(PrefKeys.language)
        ? SharedPref().getString(PrefKeys.language)
        : ENGLISH;

    currentLangCode = result!;

    emit(AppState.languageChange(locale: Locale(currentLangCode)));
  }

  Future<void> _changeLang(String langCode) async {
    await SharedPref().setString(PrefKeys.language, langCode);
    currentLangCode = langCode;
    emit(AppState.languageChange(locale: Locale(currentLangCode)));
  }

  void toArabic() => _changeLang(ARABIC);

  void toEnglish() => _changeLang(ENGLISH);
}
