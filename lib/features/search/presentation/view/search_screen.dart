import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopzen/core/di/di.dart';

import 'package:shopzen/features/search/presentation/view/widgets/search_screen_body.dart';

import '../bloc/search_bloc/search_bloc.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<SearchBloc>(),
      child: SearchScreenBody(),
    );
  }
}
