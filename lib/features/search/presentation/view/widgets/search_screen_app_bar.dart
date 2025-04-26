import 'package:flutter/material.dart';
import 'package:shopzen/core/app/app_localizations.dart';

import '../../../../../core/utils/styles/test_styles.dart';

class SearchScreenAppBar extends StatelessWidget {
  const SearchScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
    "search_for_products".tr(context),
      style: AppTestStyles.font20Bold(context),
    );
  }
}
