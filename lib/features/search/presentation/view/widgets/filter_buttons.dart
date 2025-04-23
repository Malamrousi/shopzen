
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen/core/app/app_localizations.dart';
import 'package:shopzen/core/widgets/app_text_form_filed.dart';
import 'package:shopzen/features/search/presentation/view/widgets/search_for_data_icon.dart';

import '../../../../../core/animations/animate_do.dart';
import '../../../../../core/utils/filter_button_enum.dart';
import 'save_filter_button.dart';
import 'search_name_price_button.dart';

class FilterButtons extends StatefulWidget {
  const FilterButtons({super.key});

  @override
  State<FilterButtons> createState() => _FilterButtonsState();
}

class _FilterButtonsState extends State<FilterButtons> {
  FilterButtonsEnum searchEnum = FilterButtonsEnum.non;

  final fromKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: fromKey,
      child: Column(
        children: [
          //Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomFadeInRight(
                duration: 200,
                child: SearchNamePriceButton(
                  title: 'search_name'.tr(context),
                  isSelected: searchEnum == FilterButtonsEnum.name,
                  onTap: nameSearchTap,
                ),
              ),
              CustomFadeInRight(
                duration: 200,
                child: SearchNamePriceButton(
                  title: 'search_price'.tr(context),

                  isSelected: searchEnum == FilterButtonsEnum.price,
                  onTap: priceSearchTap,
                ),
              ),
            ],
          ),
          SizedBox(height: 15.h),
          if (searchEnum == FilterButtonsEnum.name) ...[
            //Search Text Field  Name
            CustomFadeInDown(
              duration: 200,
              child: AppTextFormFiled(
                controller: TextEditingController(),
                hintText: 'search_for_product_name'.tr(context),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Search Name Cant be empty';
                  }
                  return null;
                },
              ),
            ),
            SaveFilterButton(
              onTap: () {},
            ),
          ] else if (searchEnum == FilterButtonsEnum.price) ...[
            // Search Price
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomFadeInDown(
                  duration: 200,
                  child: SizedBox(
                    width: 160.w,
                    child: AppTextFormFiled(
                      controller: TextEditingController(),
                      keyboardType: TextInputType.number,
                      hintText: 'price_min'.tr(context),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Price Min Empty';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                CustomFadeInDown(
                  duration: 200,
                  child: SizedBox(
                    width: 160.w,
                    child: AppTextFormFiled(
                      controller: TextEditingController(),
                      keyboardType: TextInputType.number,
                      hintText: 'price_max'.tr(context),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Price Max Empty';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ],
            ),
            SaveFilterButton(
              onTap: () {},
            ),
          ],

          if (searchEnum == FilterButtonsEnum.non) ...[
            SizedBox(height: 100.h),
            const SearchFormDataIcon(),
          ],
        ],
      ),
    );
  }

  void nameSearchTap() {
    if (searchEnum == FilterButtonsEnum.name) {
      setState(() {
        searchEnum = FilterButtonsEnum.non;
        //call api
      });
    } else {
      setState(() {
        searchEnum = FilterButtonsEnum.name;
      });
    }
  }

  void priceSearchTap() {
    if (searchEnum == FilterButtonsEnum.price) {
      setState(() {
        searchEnum = FilterButtonsEnum.non;
        //call api
      });
    } else {
      setState(() {
        searchEnum = FilterButtonsEnum.price;
      });
    }
  }
}