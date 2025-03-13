import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen/core/app/app_localizations.dart';
import 'package:shopzen/core/di/di.dart';
import 'package:shopzen/core/helper/spacing.dart';
import 'package:shopzen/features/home/presentation/view/widgets/category_item.dart';
import 'package:shopzen/features/home/presentation/view/widgets/category_shimmer.dart';

import '../../../../../core/utils/styles/test_styles.dart';
import '../../bloc/get_all_categories/get_all_categories_bloc.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt.get<GetAllCategoriesBloc>()..add(GetCategoriesEvent()),
      child: BlocBuilder<GetAllCategoriesBloc, GetAllCategoriesState>(
        builder: (context, state) {
          return state.when(
            loading: () => CategoryShimmer(),
            success: (categories) => SizedBox(
              height: 140.h,
              child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => horizontalSpacing(10.w),
                  itemBuilder: (context, index) => CategoryItem(
                        title: categories[index].name ?? "no_name".tr(context),
                        image: categories[index].image ??
                            "https://cdn.pixabay.com/photo/2021/10/11/23/49/app-6702045_1280.png",
                      )),
            ),
            empty: () => Center(
              child: Text(
                "no_categories".tr(context),
                style: AppTestStyles.font20Bold(context),
              ),
            ),
            failure: (failure) => Center(
              child: Text(
                "please_try_again_we_have_error".tr(context),
                style: AppTestStyles.font20Bold(context),
              ),
            ),
          );
        },
      ),
    );
  }
}
