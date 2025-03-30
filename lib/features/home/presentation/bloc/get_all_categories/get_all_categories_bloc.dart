import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/model/get_all_categories.dart';
import '../../../data/repo/category_repo.dart';

part 'get_all_categories_event.dart';
part 'get_all_categories_state.dart';
part 'get_all_categories_bloc.freezed.dart';

class GetAllCategoriesBloc
    extends Bloc<GetAllCategoriesEvent, GetAllCategoriesState> {
  GetAllCategoriesBloc({required this.getAllCategoriesRepo})
      : super(const GetAllCategoriesState.loading()) {
    on<GetAllCategoriesEvent>(getAllCategories);
  }
  final CategoryRepo getAllCategoriesRepo;

  FutureOr<void> getAllCategories(
      GetAllCategoriesEvent event, Emitter<GetAllCategoriesState> emit) async {
    emit(GetAllCategoriesState.loading());
    final result = await getAllCategoriesRepo.getAllCategories();
    result.when(success: (data) {
      if (data.categoriesList!.isEmpty) {
        emit(GetAllCategoriesState.empty());
      } else {
        emit(GetAllCategoriesState.success(categories: data.categoriesList!));
      }
    }, failure: (failure) {
      emit(GetAllCategoriesState.failure(message: failure));
    });
  }
}
