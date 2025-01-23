import 'package:flutter/material.dart';
import 'package:shopzen/core/utils/styles/test_styles.dart';

class CustomTextRich extends StatelessWidget {
  const CustomTextRich(
      {super.key, required this.tittle, required this.authText});
  final String tittle;
  final String authText;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: AppTestStyles.font16Medium(context),
        children: [
          TextSpan(
            text: tittle,
          ),
          TextSpan(
            text: authText,
            style: AppTestStyles.font16MediumPrimary700(context)
          ),
        ],
      ),
    );
  }
}
