import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopzen/core/app/app_localizations.dart';
import 'package:shopzen/core/assets/assets.dart';
import 'package:shopzen/core/helper/extension.dart';
import 'package:shopzen/core/helper/spacing.dart';
import 'package:shopzen/core/routes/route_name.dart';
import 'package:shopzen/core/widgets/custom_button.dart';

import '../../../../../core/utils/styles/test_styles.dart';

class LocationScreenViewBody extends StatelessWidget {
  const LocationScreenViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.svgLocation,
            ),
            verticalSpacing(24),
            Text(
              "what_is_your_location".tr(context),
              style: AppTestStyles.font24Bold(context),
            ),
            verticalSpacing(8),
            Text(
              "we_need_your_location".tr(context),
              style: AppTestStyles.font16Regular(context),
            ),
            verticalSpacing(48),
            CustomButton(
              onPressed: () {
                context.pushNamedAndRemoveUntil(RouteName.map);
              },
              title: "allow_location".tr(context),
              textStyle: AppTestStyles.font16Regular(context),
            )
          ],
        ),
      ),
    );
  }
}
