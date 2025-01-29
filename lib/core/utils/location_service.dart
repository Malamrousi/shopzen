import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shopzen/core/app/app_localizations.dart';
import 'package:shopzen/core/di/di.dart';

class LocationService {

 Future<bool> checkAndRequestLocationService() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }
    return true;
  }

  Future<bool> checkAndRequestLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      return false;
    }
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      return permission == LocationPermission.whileInUse || permission == LocationPermission.always;
    }
    return true;
  }

  Future<Position?> getCurrentLocation() async {
    try {
      bool serviceEnabled = await checkAndRequestLocationService();
      if (!serviceEnabled) {
        await showAlertPermissionDialog();
        return null;
      }

      bool permissionGranted = await checkAndRequestLocationPermission();
      if (!permissionGranted) {
        await showAlertPermissionDialog();
        return null;
      }

      return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    } catch (e) {
      debugPrint("Location Exception: $e");
      return null;
    }
  }
  Future<void> showAlertPermissionDialog() async {
    return showCupertinoDialog(
      context: getIt.get<GlobalKey<NavigatorState>>().currentState!.context,
      builder: (context) {
        return CupertinoAlertDialog(
          title:  Text("permission_denied".tr(context)),
          content:  Text("please_allow_location".tr(context)),
          actions: [
            CupertinoDialogAction(
              child:  Text("cancel".tr(context)),
              onPressed: () => Navigator.pop(context),
            ),
            CupertinoDialogAction(
              isDefaultAction: true,
              child:  Text("setting".tr(context)),
              onPressed: () async {
                await openAppSettings();
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }
}
