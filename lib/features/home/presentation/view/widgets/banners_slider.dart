import 'package:cached_network_image/cached_network_image.dart';
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
    "https://cdn.pixabay.com/photo/2021/06/04/06/09/cherries-6308871_1280.jpg",
    "https://cdn.pixabay.com/photo/2021/01/05/05/30/grapes-5889697_1280.jpg",
    "https://cdn.pixabay.com/photo/2016/08/17/09/57/fruit-bowl-1600003_1280.jpg",
    "https://images.unsplash.com/photo-1523275335684-37898b6baf30?q=80&w=1999&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://plus.unsplash.com/premium_photo-1679913792906-13ccc5c84d44?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1526170375885-4d8ecf77b99f?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://plus.unsplash.com/premium_photo-1664392147011-2a720f214e01?q=80&w=2078&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1546868871-7041f2a55e12?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
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
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: imageList[itemIndex],
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Icon(Icons.error),
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
            reverse: true,
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
        verticalSpacing(20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: imageList.map((e) {
            return Container(
              width: 10,
              height: 10,
              margin: EdgeInsets.symmetric(horizontal: 3.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: activeIndex == e
                    ? ColorsManger.blueDark
                    : ColorsManger.gray300,
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}
