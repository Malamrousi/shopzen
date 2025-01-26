
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopzen/core/upload/repo/upload_image_repo.dart';
import 'package:shopzen/core/utils/app_image_picker.dart';

part 'upload_image_state.dart';
part 'upload_image_cubit.freezed.dart';

class UploadImageCubit extends Cubit<UploadImageState> {
  UploadImageCubit({required this.uploadImageRepo})
      : super(UploadImageState.initial());
  final UploadImageRepo uploadImageRepo;

  String imageUrl = '';

  Future<void> uploadImage() async {
    final pickImage = await AppImagePicker().pickImage();
    if (pickImage == null) return;
    emit(const UploadImageState.loading());
    final result = await uploadImageRepo.uploadImage(file: pickImage);

    result.when(success: (image) {
      imageUrl = image.location ?? '';
      emit(UploadImageState.success());
    }, failure: (failure) {
      emit(UploadImageState.failure(message: failure));
    });
  }

void removeImage() async {
    imageUrl = '';
    emit( UploadImageState.remove(imageUrl: imageUrl ));
  }
}
