import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopzen/core/di/di.dart';
import 'package:shopzen/features/profile/presentation/view/widgets/profile_screen_body.dart';

import '../bloc/bloc/profile_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context)  {
  
    return BlocProvider(
      create: (context) => getIt.get<ProfileBloc>()
        ..add( ProfileEvent.getUserInfo()),
      child: SafeArea(
        child: ProfileScreenBody(),
      ),
    );
  }
}
