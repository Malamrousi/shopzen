import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shopzen/core/app/app_localizations.dart';
import 'package:shopzen/core/di/di.dart';
import 'package:shopzen/core/helper/extension.dart';

class AppImagePicker {
  const AppImagePicker._();

  static const AppImagePicker _instance = AppImagePicker._();

  factory AppImagePicker() {
    return _instance;
  }

  Future<XFile?> pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image != null) {
        return XFile(image.path);
      }
      return null;
    } catch (e) {
      final permissionStatus = await Permission.photos.status;
      if (permissionStatus.isDenied) {
        await showAlertPermissionDialog();
      } else {
        debugPrint("Image Exception======> $e");
      }
    }
    return null;
  }

  Future<void> showAlertPermissionDialog() async {
    return showCupertinoDialog(
      context: getIt.get<GlobalKey<NavigatorState>>().currentState!.context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text("permission_denied".tr(context)),
          content: Text("allow_access_to_gallery_and_camera".tr(context)),
          actions: [
            CupertinoDialogAction(
              child: Text("Cancel".tr(context)),
              onPressed: () => context.pop(),
            ),
            CupertinoDialogAction(
              isDefaultAction: true,
              child: Text("setting".tr(context)),
              onPressed: () => openAppSettings,
            )
          ],
        );
      },
    );
  }
}
