import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopzen/core/assets/assets.dart';
import 'package:shopzen/core/helper/theme_extension.dart';
import 'package:shopzen/features/notification/data/model/notification_model.dart';

import '../../../../../core/routes/route_name.dart';
import '../../../../../core/utils/styles/colors_manger.dart';
import '../../../../../core/utils/styles/test_styles.dart';
import '../../../../notification/presentation/controller/notification_controller.dart';

class NotificationBarIcon extends StatelessWidget {
  const NotificationBarIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RouteName.notification);
      },
      child: StreamBuilder<List<NotificationModel>>(
        stream: NotificationController().getNotification(),
        builder: (context, snapshot) {
          if(!snapshot.hasData) {
            return SizedBox.shrink();
          }else{
            final numberOfNotification = snapshot.data!.where((e)=>e.isSeen==false).length;
            return badges.Badge(
            showBadge: numberOfNotification !=0,
            badgeAnimation: const badges.BadgeAnimation.scale(),
            position: badges.BadgePosition.topEnd(top: -8.h, end: -4.w),
            badgeContent: Text(
              numberOfNotification >=9 ?"9+":numberOfNotification.toString(),
              style: AppTestStyles.font14Regular(context)
                  .copyWith(fontSize: 12.sp, color: ColorsManger.whiteColor),
            ),
            badgeStyle: badges.BadgeStyle(
                badgeColor: Colors.pink,
                shape: badges.BadgeShape.circle,
                padding: REdgeInsets.all(4),
                elevation: 0),
            child: SvgPicture.asset(
              Assets.svgNotificationIcon,
              color: context.colorThemeExtension.textColor,
              height: 24.h,
            ),
          );
          }
        }
      ),
    );
  }
}
