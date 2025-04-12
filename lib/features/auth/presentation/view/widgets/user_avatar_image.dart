import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen/core/animations/animate_do.dart';
import 'package:shopzen/core/app/app_localizations.dart';
import 'package:shopzen/core/assets/assets.dart';
import 'package:shopzen/core/cubit/upload_image/upload_image_cubit.dart';
import 'package:shopzen/core/helper/theme_extension.dart';
import 'package:shopzen/core/utils/show_toast.dart';
import 'package:shopzen/core/utils/styles/colors_manger.dart';

class UserAvatarImage extends StatelessWidget {
  const UserAvatarImage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadeInDown(
      duration: 500,
      child: BlocConsumer<UploadImageCubit, UploadImageState>(
        listener: (context, state) {
          state.whenOrNull(success: () {
            ShowToast.showToastSuccessTop(
              message: "image_uploaded_successfully".tr(context),
              seconds: 2,
            );
          },
          failure: (message) {
            ShowToast.showToastErrorTop(
              message: "image_upload_failed".tr(context),
              seconds: 3,
            );
          },
          remove: (remove) {
            ShowToast.showToastSuccessTop(
              message: "image_removed_successfully".tr(context),
              seconds: 2,
            );
          }
          );
        
          
        },
        builder: (context, state) {
          final isImageUploaded =
              context.read<UploadImageCubit>().imageUrl.isNotEmpty;
          return state.maybeWhen(loading: () {
            return CircleAvatar(
              radius: 38,
              backgroundImage: AssetImage(Assets.imagesUserAvatar),
              child: CircularProgressIndicator(
                color: context.colorThemeExtension.mainColor,
              ),
            );
          }, orElse: () {
            return CircleAvatar(
              radius: 38,
              backgroundImage: isImageUploaded
                  ? NetworkImage(context.read<UploadImageCubit>().imageUrl)
                  : AssetImage(Assets.imagesUserAvatar),
              backgroundColor: Colors.black.withOpacity(.2),
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    width: 100.w,
                    height: 100.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black.withOpacity(.1),
                        width: 4.w,
                      ),
                    ),
                  ),
                  Positioned(
                    top: -15.h,
                    right: -15.w,
                    child: isImageUploaded
                        ? IconButton(
                            onPressed: () {
                              context.read<UploadImageCubit>().removeImage();
                            },
                            icon: Icon(
                              Icons.delete,
                              size: 24.sp,
                              color: Colors.red,
                            ),
                            color: ColorsManger.whiteColor,
                          )
                        : SizedBox.shrink(),
                  ),
                  IconButton(
                    onPressed: () {
                      context.read<UploadImageCubit>().uploadImage();
                    },
                    icon: isImageUploaded
                        ? Icon(
                            Icons.edit,
                            size: 28.sp,
                          )
                        : Icon(
                            Icons.add_a_photo,
                            size: 28.sp,
                          ),
                    color: ColorsManger.whiteColor,
                  ),
                ],
              ),
            );
          });
        },
      ),
    );
  }
}
