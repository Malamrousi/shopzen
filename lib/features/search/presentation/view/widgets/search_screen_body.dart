import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen/core/app/app_localizations.dart';
import 'package:shopzen/core/helper/spacing.dart';
import 'package:shopzen/core/helper/theme_extension.dart';
import 'package:shopzen/features/search/presentation/view/widgets/filter_buttons.dart';
import 'package:shopzen/features/search/presentation/view/widgets/search_screen_app_bar.dart';

import '../../../../../core/utils/styles/test_styles.dart';
import '../../../../../core/widgets/custom_product_item.dart';
import '../../bloc/search_bloc/search_bloc.dart';

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

          BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
            return state.when(
              initial: () {
                return const SizedBox.shrink();
              },
              loading: () {
                return Expanded(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: context.colorThemeExtension.textColor,
                    ),
                  ),
                );
              },
              success: (productList) {
                return Expanded(
                  child: GridView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: productList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, //Number of cloums
                      crossAxisSpacing: 8, // Spacing between colums
                      mainAxisSpacing: 15, //Spacing between rows
                      childAspectRatio: 165 / 250,
                    ),
                    itemBuilder: (context, index) {
                      return CustomProductItem(
                        product: productList[index],
                        productId: int.parse(productList[index].id ?? "0"),
                      );
                    },
                  ),
                );
              },
              empty: () {
                return Center(
                  child: Text(
                    "no_products_found".tr(context),
                    style: AppTestStyles.font16RegularThemeColor(context),
                  ),
                );
              },
              failure: Text.new,
            );
          })
        ],
      ),
    );
  }
}
