import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen/core/animations/animate_do.dart';
import 'package:shopzen/core/app/app_localizations.dart';
import 'package:shopzen/core/utils/styles/test_styles.dart';
import 'package:shopzen/features/profile/presentation/bloc/bloc/profile_bloc.dart';
import 'package:shopzen/features/profile/presentation/view/widgets/lang_change.dart';

import '../../../../../core/helper/spacing.dart';
import 'theme_change.dart';
import 'user_profile_info.dart';
import 'user_profile_shimmer.dart';

class ProfileScreenBody extends StatelessWidget {
  const ProfileScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  return state.when(
                      loading: () => UserProfileShimmer.new(),
                      success: (userInfo) {
                        return UserProfileInfo(
                          userRoleModel: userInfo,
                        );
                      },
                      failure: (message) {
                        return Text(
                          "please_try_again_we_have_error".tr(context),
                          style: AppTestStyles.font16Regular(context),
                        );
                      });
                },
              ),
            ),
            verticalSpacing(20.h),
            Text(
              "application_features".tr(context),
              style: AppTestStyles.font20Bold(context),
            ),
            verticalSpacing(20.h),
            CustomFadeInRight(child: LangChange(), duration: 400),
            verticalSpacing(20.h),
            CustomFadeInRight(child: ThemeChange(), duration: 400),
          ],
        ),
      ),
    );
  }
}
