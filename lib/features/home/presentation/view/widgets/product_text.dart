import 'package:flutter/material.dart';
import 'package:shopzen/core/app/app_localizations.dart';

import '../../../../../core/utils/styles/test_styles.dart';

class ProductText extends StatelessWidget {
  const ProductText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "products".tr(context),
          style: AppTestStyles.font18Bold(context),
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