import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopzen/features/home/data/repo/product_repo.dart';

import '../../../data/model/get_all_product.dart';

part 'get_all_products_event.dart';
part 'get_all_products_state.dart';
part 'get_all_products_bloc.freezed.dart';

class GetAllProductsBloc
    extends Bloc<GetAllProductsEvent, GetAllProductsState> {
  GetAllProductsBloc({required this.productRepo}) : super(GetAllProductsState.loading()) {
    on<AllProductEvent>(getAllProduct);
  }
  final ProductRepo productRepo;

  FutureOr<void> getAllProduct(
      AllProductEvent event, Emitter<GetAllProductsState> emit) async {
    {
      emit(GetAllProductsState.loading());
      final result = await productRepo.getAllProducts();
      result.when(success: (data) {
        if (data.productGetAllList.isEmpty) {
          emit(GetAllProductsState.empty());
        } else {
          emit(GetAllProductsState.success(products: data.productGetAllList));
        }
      }, failure: (failure) {
        emit(GetAllProductsState.failure(message: failure));
      });
    }
  }
}
