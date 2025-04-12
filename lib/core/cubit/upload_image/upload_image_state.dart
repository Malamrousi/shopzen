part of 'upload_image_cubit.dart';

@freezed
class UploadImageState with _$UploadImageState {
  const factory UploadImageState.initial() = _Initial;
  const factory UploadImageState.loading() = Loading;
  const factory UploadImageState.success() = Success;
  const factory UploadImageState.remove({required String imageUrl}) = Remove;
  const factory UploadImageState.failure({required String message}) = Failure;
}
