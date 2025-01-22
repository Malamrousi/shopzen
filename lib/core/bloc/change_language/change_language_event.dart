// lib/core/bloc/language/language_event.dart

abstract class LanguageEvent {}

class ChangeLanguageToEnglish extends LanguageEvent {}

class ChangeLanguageToArabic extends LanguageEvent {}

class GetCurrentLanguage extends LanguageEvent {}