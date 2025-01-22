import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopzen/core/bloc/change_language/change_language_bloc.dart';
import 'package:shopzen/core/bloc/change_language/change_language_event.dart';
import 'package:shopzen/core/helper/theme_extension.dart';
import 'package:shopzen/core/app/app_localizations_setup.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,  // لتوسيط المحتوى
        children: [
          Center(
            child: Text(
              "email".tr(context),  // استخدام tr() للترجمة
              style: TextStyle(
                color: context.colorThemeExtension.mainColor,
                fontSize: 20,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              context.read<LanguageBloc>().add(
                context.read<LanguageBloc>().state.locale == ENGLISH_LOCAL
                    ? ChangeLanguageToArabic()
                    : ChangeLanguageToEnglish(),
              );
            },
            icon: const Icon(Icons.language),
          ),
        ],
      ),
    );
  }
}