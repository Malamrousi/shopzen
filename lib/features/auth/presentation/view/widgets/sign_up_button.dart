import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen/core/app/app_localizations.dart';
import 'package:shopzen/core/cubit/upload_image/upload_image_cubit.dart';
import 'package:shopzen/core/helper/extension.dart';
import 'package:shopzen/core/routes/route_name.dart';
import 'package:shopzen/core/shared_pref/shared_pref.dart';
import 'package:shopzen/core/utils/show_toast.dart';
import 'package:shopzen/core/utils/styles/colors_manger.dart';
import 'package:shopzen/core/utils/styles/test_styles.dart';
import 'package:shopzen/core/widgets/custom_button.dart';
import 'package:shopzen/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:shopzen/features/on_boarding/presentation/view/widgets/custom_linear_button.dart';

import '../../../../../core/shared_pref/shared_prefs_key.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        state.whenOrNull(success: (_) {
          ShowToast.showToastSuccessTop(
            message: "sign_up_successfully".tr(context),
            seconds: 2,
          );
          SharedPref().setString(PrefKeys.isLogin, "true");
          context.pushNamedAndRemoveUntil(RouteName.main);
        }, failure: (message) {
          ShowToast.showToastErrorTop(
            message: "please_try_again_we_have_error".tr(context),
            seconds: 3,
          );
        });
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: () {
            return CustomLinearButton(
              onPressed: () {},
              height: 40.h,
              width: double.infinity,
              child: CircularProgressIndicator(
                color: ColorsManger.whiteColor,
              ),
            );
          },
          orElse: () => CustomButton(
            onPressed: () {
              _validateThenSignUp(context);
            },
            title: "signup".tr(context),
            backgroundColor: ColorsManger.primaryColor400,
            textStyle: AppTestStyles.font16Regular(context),
          ),
        );
      },
    );
  }

  void _validateThenSignUp(BuildContext context) {
    final authBloc = context.read<AuthBloc>();
    final imageCubit = context.read<UploadImageCubit>();
    if (!authBloc.formKey.currentState!.validate() ||
        imageCubit.imageUrl.isEmpty) {
      if (imageCubit.imageUrl.isEmpty) {
        ShowToast.showToastErrorTop(
          message: "please_upload_image".tr(context),
        );
      }
    } else {
      context.read<AuthBloc>().add(
            AuthEvent.signUp(imageUrl: imageCubit.imageUrl),
          );
    }
  }
}
