import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen/core/helper/spacing.dart';
import 'package:shopzen/core/utils/styles/colors_manger.dart';
import 'package:shopzen/core/widgets/custom_container_linear.dart';

class BannersSlider extends StatefulWidget {
  const BannersSlider({super.key});

  @override
  State<BannersSlider> createState() => _BannersSliderState();
}

class _BannersSliderState extends State<BannersSlider> {
  int activeIndex = 0;
  List<String> imageList = [
    "assets/images/banner_1.jpg",
    "assets/images/banner_2.jpg",
    "assets/images/banner_3.jpg",
    "assets/images/banner_4.jpg",
    "assets/images/banner_5.jpg",
    "assets/images/banner_6.jpg",
    "assets/images/banner_7.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: imageList.length,
          itemBuilder: (context, int itemIndex, int pageViewIndex) {
            return CustomContainerLinear(
              height: 150.h,
              width: MediaQuery.sizeOf(context).width,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: Image(
                  image: AssetImage(imageList[itemIndex]),
                  fit: BoxFit.fill,
                ),
              ),
            );
          },
          options: CarouselOptions(
            height: 160.h,
            aspectRatio: 16 / 9,
            viewportFraction: 1,
            initialPage: 0,
            enableInfiniteScroll: true,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) {
              activeIndex = index;
              setState(() {});
            },
          ),
        ),
        verticalSpacing(10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(imageList.length, (index) {
            return Container(
              width: 6,
              height: 6,
              margin: EdgeInsets.symmetric(horizontal: 3.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: activeIndex == index
                    ? ColorsManger.blueDark
                    : ColorsManger.gray300,
              ),
            );
          }),
        )
      ],
    );
  }
}
