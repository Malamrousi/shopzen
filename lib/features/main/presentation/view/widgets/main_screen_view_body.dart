import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopzen/features/cart/presentation/view/cart_screen.dart';
import 'package:shopzen/features/search/presentation/view/search_screen.dart';

import '../../../../../core/utils/nav_bar_enum.dart';
import '../../../../favorites/presentation/view/favorites_screen.dart';
import '../../../../home/presentation/view/home_screen.dart';
import '../../../../profile/presentation/view/profile_screen.dart';
import '../../bloc/main_cubit/main_cubit_cubit.dart';

class MainScreenViewBody extends StatelessWidget {
  const MainScreenViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: BlocBuilder<MainCubit, MainState>(
            builder: (context, state) {
              final cubit = context.read<MainCubit>();
              if (cubit.navBarEnum == NavBarEnum.favorites) {
                return const FavoritesScreen();
              } else if (cubit.navBarEnum == NavBarEnum.search) {
                return const SearchScreen();
              } else if (cubit.navBarEnum == NavBarEnum.profile) {
                return const ProfileScreen();
              } else if (cubit.navBarEnum == NavBarEnum.cart) {
                return const CartScreen();
              }
              return const HomeScreen();
            },
          ),
        ),
      ],
    );
  }
}
