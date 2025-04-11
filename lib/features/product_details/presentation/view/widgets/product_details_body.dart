import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen/features/product_details/data/models/product_details_model.dart';

import '../../../../../core/cubit/share/share_cubit.dart';
import '../../../../../core/helper/spacing.dart';
import '../../../../../core/utils/styles/colors_manger.dart';
import '../../../../../core/utils/styles/test_styles.dart';
import '../../../../../core/widgets/custom_favorite_icon.dart';
import '../../../../../core/widgets/custom_share_icon.dart';
import 'product_details_image_slider.dart';

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({super.key, required this.productDetailsModel});

  final ProductDetailsModel productDetailsModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlocBuilder<ShareCubit, ShareState>(
                  builder: (context, state) {
                    return state.when(initial: () {
                      return CustomShareIcon(onTap: () {
                        context.read<ShareCubit>().sendDynamicLink(
                            productDescription: productDetailsModel.description ?? "",
                            productImage: productDetailsModel.images.first ,
                            productTitle: productDetailsModel.title ?? "",
                            productId: int.parse(productDetailsModel.id ?? "0"));
                      });
                    }, loading: (int id) {
                      if (id == productDetailsModel.id) {
                        return Padding(
                          padding: EdgeInsets.only(left: 10.w),
                          child: SizedBox(
                            height: 20.h,
                            width: 20.w,
                            child: CircularProgressIndicator(
                              color: ColorsManger.primaryColor400,
                            ),
                          )
                        );
                      }else{
                     return  CustomShareIcon(
                          onTap: () {},
                        );
                      }
                    }, success: () {
                      return CustomShareIcon(onTap: () {
                        context.read<ShareCubit>().sendDynamicLink(
                          productDescription: productDetailsModel.description ?? "",
                            productImage: productDetailsModel.images.first ,
                            productTitle: productDetailsModel.title ?? "",
                            productId: int.parse(productDetailsModel.id ?? "0"));
                      });
                    });
                  },
                ),
                CustomFavoriteIcon(),
              ],
            ),
            verticalSpacing(10.h),
            ProductDetailsImageSlider(
              imageList: productDetailsModel.images,
            ),
            verticalSpacing(20.h),
            Text(productDetailsModel.title ?? '',
                style: AppTestStyles.font20Bold(context)),
            verticalSpacing(10.h),
            Text(productDetailsModel.description ?? '',
                style: AppTestStyles.font14Regular(context)),
          ],
        ),
      ),
    );
  }
}
