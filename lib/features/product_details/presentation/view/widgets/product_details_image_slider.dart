import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen/core/animations/animate_do.dart';
import '../../../../../core/helper/spacing.dart';

class ProductDetailsImageSlider extends StatefulWidget {
  const ProductDetailsImageSlider({super.key});
  
  @override
  State<ProductDetailsImageSlider> createState() => _ProductDetailsImageSliderState();
}

class _ProductDetailsImageSliderState extends State<ProductDetailsImageSlider> {
  int activeIndex = 0;
  final CarouselSliderController carouselController = CarouselSliderController();
  
  List<String> imageList = [
    "https://d2v5dzhdg4zhx3.cloudfront.net/web-assets/images/storypages/primary/ProductShowcasesampleimages/JPEG/Product+Showcase-1.jpg",
    "https://th.bing.com/th/id/OIP.JN2YuhRiEVw4-QjfLIBHkgHaE8?rs=1&pid=ImgDetMain",
    "https://th.bing.com/th/id/OIP.dmN7KjgwBX3J6Fcqukt4rQHaEN?rs=1&pid=ImgDetMain",
    "https://th.bing.com/th/id/OIP.6-juEx2608vTmrRMAPgRGQHaE8?rs=1&pid=ImgDetMain",
    "https://th.bing.com/th/id/OIP.zJcerO1OR1nSb_UEkRx_aAHaHa?rs=1&pid=ImgDetMain",
  ];

  @override
  Widget build(BuildContext context) {
    return CustomFadeInRight(
      duration: 500,
      child: Column(
        children: [
          CarouselSlider.builder(
            carouselController: carouselController,
            itemCount: imageList.length,
            itemBuilder: (context, int itemIndex, int pageViewIndex) {
              return Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.r),
                  child: CachedNetworkImage(
                    imageUrl: imageList[itemIndex],
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 250.h,
                    errorWidget: (context, url, error) => const Icon(
                      Icons.error,
                      color: Colors.red,
                    ),
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
              );
            },
            options: CarouselOptions(
              height: 250.h,
              aspectRatio: 16 / 9,
              viewportFraction: 1,
              initialPage: 0,
              enableInfiniteScroll: true,
              autoPlay: true, 
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, reason) {
                setState(() {
                  activeIndex = index;
                });
              },
            ),
          ),
          
          verticalSpacing(15.h),
          
          Container(
            height: 70.h,
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  imageList.length,
                  (index) => GestureDetector(
                    onTap: () {
                      carouselController.animateToPage(index);
                      setState(() {
                        activeIndex = index;
                      });
                    },
                    child: Container(
                      width: 60.w,
                      height: 60.h,
                      margin: EdgeInsets.only(right: 8.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(
                          color: activeIndex == index 
                              ? Colors.blue 
                              : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6.r),
                        child: CachedNetworkImage(
                          imageUrl: imageList[index],
                          fit: BoxFit.cover,
                          errorWidget: (context, url, error) => const Icon(
                            Icons.error,
                            color: Colors.red,
                          ),
                          placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}