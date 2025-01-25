import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen/core/app/app_localizations.dart';
import 'package:shopzen/core/helper/extension.dart';
import 'package:shopzen/core/routes/route_name.dart';
import 'package:shopzen/core/shared_pref/shared_pref.dart';
import 'package:shopzen/core/shared_pref/shared_prefs_key.dart';
import 'package:shopzen/core/utils/show_toast.dart';
import 'package:shopzen/core/utils/styles/colors_manger.dart';
import 'package:shopzen/core/utils/styles/test_styles.dart';
import 'package:shopzen/core/widgets/custom_button.dart';
import 'package:shopzen/features/auth/presentation/bloc/bloc/login_bloc.dart';
import 'package:shopzen/features/on_boarding/presentation/view/widgets/custom_linear_button.dart';

class CustomLoginButton extends StatelessWidget {
  const CustomLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (userRole) {
            ShowToast.showToastSuccessTop(
              context: context,
              message: "login_success".tr(context),
              seconds: 2,
            );
            if (userRole == "admin") {
              ShowToast.showToastErrorTop(
                context: context,
                message: "you_are_admin".tr(context),
                seconds: 1,
              );
            } else {
              SharedPref().setString(PrefKeys.isLogin, "true");
              context.pushNamed(RouteName.main);
            }
          },
          failure: (message) {
            ShowToast.showToastErrorTop(
              context: context,
              message: "please_try_again_we_have_error".tr(context),
              seconds: 3,
            );
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
            loading: () => CustomLinearButton(
                  onPressed: () {},
                  height: 40.h,
                  width: double.infinity,
                  child: CircularProgressIndicator(
                    color: ColorsManger.whiteColor,
                  ),
                ),
            orElse: () => CustomButton(
                  onPressed: () {
                    _validateThenLogin(context);
                  },
                  title: "login".tr(context),
                  backgroundColor: ColorsManger.primaryColor400,
                  textStyle: AppTestStyles.font16Regular(context),
                ));
      },
    );
  }

  void _validateThenLogin(BuildContext context) {
    if (context.read<LoginBloc>().formKey.currentState?.validate() ?? false) {
      context.read<LoginBloc>().add(const LoginEvent.login());
    }
  }
}
