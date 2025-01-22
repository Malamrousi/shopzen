// lib/core/bloc/language/language_state.dart
import 'package:flutter/material.dart';

class LanguageState {
  final Locale locale;
  
  LanguageState({
    required this.locale,
  });

  factory LanguageState.initial(Locale locale) {
    return LanguageState(locale: locale);
  }

  LanguageState copyWith({
    Locale? locale,
  }) {
    return LanguageState(
      locale: locale ?? this.locale,
    );
  }
}