import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/utils/nav_bar_enum.dart';

part 'main_cubit_state.dart';
part 'main_cubit_cubit.freezed.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainState.initial());
   NavBarEnum navBarEnum = NavBarEnum.home;

  void selectedNavBarIcons(NavBarEnum viewEnum) {
    if (viewEnum == NavBarEnum.home) {
      navBarEnum = NavBarEnum.home;
    }
     else if (viewEnum == NavBarEnum.search) {
      navBarEnum = NavBarEnum.search;
    } else if (viewEnum == NavBarEnum.favorites) {
      navBarEnum = NavBarEnum.favorites;
    } else if (viewEnum == NavBarEnum.cart) {
      navBarEnum = NavBarEnum.cart;
    } else if (viewEnum == NavBarEnum.profile) {
      navBarEnum = NavBarEnum.profile;
    }
    
    emit(MainState.barSeletedIcons(navBarEnum: navBarEnum));
  }
}
