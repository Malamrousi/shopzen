import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen/core/app/app_localizations.dart';
import 'package:shopzen/core/app/app_regex.dart';
import 'package:shopzen/core/helper/spacing.dart';
import 'package:shopzen/core/routes/route_name.dart';
import 'package:shopzen/core/utils/styles/colors_manger.dart';
import 'package:shopzen/core/utils/styles/test_styles.dart';
import 'package:shopzen/core/widgets/app_text_form_filed.dart';
import 'package:shopzen/features/auth/presentation/bloc/bloc/login_bloc.dart';
import 'package:shopzen/features/auth/presentation/view/widgets/custom_login_button.dart';
import 'package:shopzen/features/auth/presentation/view/widgets/custom_text_rich.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  bool isObscureText = true;
  late LoginBloc _loginBloc;
  @override
  void initState() {
    super.initState();
    _loginBloc = context.read<LoginBloc>();
  }

  @override
  void dispose() {
    super.dispose();
    _loginBloc.emailController.dispose();
    _loginBloc.passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 24.h),
      child: Form(
    
        key: _loginBloc.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "login_with_email".tr(context),
              style: AppTestStyles.font20Bold(context),
            ),
            verticalSpacing(48),
            Text(
              "email".tr(context),
              style: AppTestStyles.font16Medium(context),
            ),
            verticalSpacing(8),
            AppTextFormFiled(
              controller: _loginBloc.emailController,
              hintText: "enter_email".tr(context),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "please_enter_email".tr(context);
                } else if (AppRegex.isPasswordValid(
                    _loginBloc.emailController.text)) {
                  return "please_enter_valid_email".tr(context);
                }
                return null;
              },
            ),
            verticalSpacing(16),
            Text(
              "password".tr(context),
              style: AppTestStyles.font16Medium(context),
            ),
            verticalSpacing(8),
            AppTextFormFiled(
              isObscureText: isObscureText,
              suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      isObscureText = !isObscureText;
                    });
                  },
                  child: Icon(
                    isObscureText
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: ColorsManger.gray600,
                  )),
              controller: _loginBloc.passwordController,
              hintText: "enter_password".tr(context),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "please_enter_password".tr(context);
                } else if (AppRegex.isPasswordValid(
                    _loginBloc.passwordController.text)) {
                  return "please_enter_valid_password".tr(context);
                }
                return null;
              },
            ),
            verticalSpacing(78),
            CustomLoginButton(),
            Spacer(),
            Center(
              child: CustomTextRich(
                routeName: RouteName.signUp,
                tittle: "dont_have_an_account".tr(context),
                authText: "signup".tr(context),
              ),
            ),
            verticalSpacing(78),
          ],
        ),
      ),
    );
  }
}
