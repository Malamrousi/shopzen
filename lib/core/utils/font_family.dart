
import 'package:shopzen/core/shared_pref/shared_pref.dart';
import 'package:shopzen/core/shared_pref/shared_prefs_key.dart';

class FontFamily {
  FontFamily._();
  static const String satoshiEnglish = 'Satoshi';
  static const String cairoArabic = 'Cairo';

  static String getFontFamily() {
    final currentLanguage = SharedPref().getString(PrefKeys.language);
    if (currentLanguage == 'ar') {
      return cairoArabic;
    } else {
      return satoshiEnglish;
    }
  }
}
