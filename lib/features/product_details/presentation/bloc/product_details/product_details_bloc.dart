import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/product_details_model.dart';
import '../../../data/repo/product_details_repo.dart';

part 'product_details_event.dart';
part 'product_details_state.dart';
part 'product_details_bloc.freezed.dart';

class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  ProductDetailsBloc({required this.productDetailsRepo}) : super(ProductDetailsState.loading()) {
    on<GetProductDetails>(getProductDetails);
  }
  final ProductDetailsRepo productDetailsRepo;
  FutureOr<void> getProductDetails(
      GetProductDetails event, Emitter<ProductDetailsState> emit) async{
        emit(ProductDetailsState.loading());
       final result = await productDetailsRepo.getProductDetails(event.id);
       result.when(success: (data) {
         emit(ProductDetailsState.success(productDetailsModel: data.data.productDetailsModel));
       }, failure: (failure) {
         emit(ProductDetailsState.failure(message: failure));
       });
      }
}
