part of 'app_cubit.dart';

@freezed
class AppState with _$AppState {
  const factory AppState.initial() = _Initial;
  const factory AppState.changeThemeMode({required bool isDark}) = changeThemeMode;
   const factory AppState.languageChange({required Locale locale}) =
      LanguageChangeState;
}
