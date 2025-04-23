import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen/core/helper/spacing.dart';
import 'package:shopzen/features/search/presentation/view/widgets/filter_buttons.dart';
import 'package:shopzen/features/search/presentation/view/widgets/search_screen_app_bar.dart';

class SearchScreenBody extends StatelessWidget {
  const SearchScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
      child: Column(
        children: [
          SearchScreenAppBar(),
          verticalSpacing(20.h),
          // filter buttons
          FilterButtons(),

          // SizedBox(height: 20.h),

          // SearchFormDataIcon(),
        ],
      ),
    );
  }
}