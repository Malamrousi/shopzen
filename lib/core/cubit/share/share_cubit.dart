import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopzen/core/dynamic_link/dynamic_link.dart';
import 'package:share_plus/share_plus.dart';
part 'share_state.dart';
part 'share_cubit.freezed.dart';

class ShareCubit extends Cubit<ShareState> {
  ShareCubit() : super(ShareState.initial());

  Future<void> sendDynamicLink({
    required int productId,
    required String productTitle,
    required String productImage,
    required String productDescription,
  }) async {
    emit(ShareState.loading(productId: productId));

    await DynamicLink()
        .getDynamicLink(
      productId: productId,
      productTitle: productTitle,
      productImage: productImage,
      productDescription: productDescription,
    )
        .then((value) {
      Share.share(value);
    });

    emit(ShareState.success());
  }
}
