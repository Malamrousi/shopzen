import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'user_profile_info.dart';

class ProfileScreenBody extends StatelessWidget {
  const ProfileScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal:20.w , vertical: 20.h ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Center(child: UserProfileInfo())
          ],
        ),
      ),
    );
  }
}