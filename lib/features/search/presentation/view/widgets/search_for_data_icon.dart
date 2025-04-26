
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen/core/helper/theme_extension.dart';

import '../../../../../core/utils/styles/test_styles.dart';

class SearchFormDataIcon extends StatelessWidget {
  const SearchFormDataIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          Icons.search_sharp,
          color: context.colorThemeExtension.textColor,
          size: 150,
        ),
        SizedBox(height: 10.h),
        Text(
          'Search For Data',
          style: AppTestStyles.font20Bold(context),
        ),
      ],
    );
  }
}