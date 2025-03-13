import 'package:flutter/material.dart';
import 'package:shopzen/core/app/app_localizations.dart';

import '../../../../../core/utils/styles/test_styles.dart';

class CategoriesText extends StatelessWidget {
  const CategoriesText({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "categories".tr(context),
          style: AppTestStyles.font20Bold(context),
        ),
        TextButton(
          child: Text(
            "view_all".tr(context),
            style: AppTestStyles.font16MediumPrimary700(context),
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}