import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopzen/features/search/data/repo/search_repo.dart';

import '../../../../home/data/model/get_all_product.dart';
import '../../../data/model/search_request_body.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepo searchRepo;
  SearchBloc({required this.searchRepo}) : super(SearchState.initial()) {
    on<SearchForProductEvent>(searchForProduct);
  }

  FutureOr<void> searchForProduct(SearchForProductEvent event,Emitter<SearchState> emit) async{
    emit(SearchState.loading());
     final result =await searchRepo.searchProduct(event.body);
     result.when(success: (data) {
       if (data.productGetAllList.isEmpty) {
         emit(SearchState.empty());
       } else {
         emit(SearchState.success(products: data.productGetAllList));
       }
     }, failure: (failure) {
       emit(SearchState.failure(message: failure));
     });
  }
}
