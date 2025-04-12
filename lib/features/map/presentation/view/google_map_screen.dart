import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shopzen/core/app/app_localizations.dart';
import 'package:shopzen/core/helper/extension.dart';
import 'package:shopzen/core/shared_pref/shared_pref.dart';
import 'package:shopzen/core/utils/location_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shopzen/core/utils/styles/colors_manger.dart';
import 'package:shopzen/core/utils/styles/test_styles.dart';
import 'package:shopzen/core/widgets/custom_button.dart';
import 'package:geocoding/geocoding.dart';
import 'package:shopzen/core/shared_pref/shared_prefs_key.dart';

import '../../../../core/routes/route_name.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({super.key});

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  late LocationService locationService;
  late CameraPosition initialCameraPosition;
  GoogleMapController? googleMapController;
  Set<Marker> markers = {};
    bool isLocationFetched = false; // متغير لمنع استدعاء الموقع أكثر من مرة

  String? savedAddress;

  @override
  void initState() {
    super.initState();
    locationService = LocationService();
    initialCameraPosition = const CameraPosition(
      target: LatLng(30.0444, 31.2357),
      zoom: 15.0,
    );
    getMyLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            GoogleMap(
              zoomControlsEnabled: false,
              mapType: MapType.normal,
              markers: markers,
              onMapCreated: (controller) {
                googleMapController = controller;
                initMapStyle();
              },
              initialCameraPosition: initialCameraPosition,
            ),
               Positioned(
            bottom: 80,
            right: 20,
            child: FloatingActionButton(
              onPressed: getMyLocation,
              child: const Icon(Icons.my_location),
            ),
          ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: CustomButton(
                  onPressed: saveUserLocation,
                  title: "save_location".tr(context),
                  textStyle: AppTestStyles.font16RegularWhiteColor(context),
                  backgroundColor: ColorsManger.primaryColor700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void initMapStyle() async {
    bool isDark = SharedPref().getBoolean(PrefKeys.themeMode) ?? false;
    var mapStyle = await DefaultAssetBundle.of(context).loadString(
      isDark ? 'assets/map_styles/light_map_styles.json' : 'assets/map_styles/dark_map_styles.json',
    );
    googleMapController!.setMapStyle(mapStyle);
  }

void getMyLocation() async {
    if (isLocationFetched) return; // منع الاستدعاء المتكرر
    isLocationFetched = true;

    bool hasService = await locationService.checkAndRequestLocationService();
    bool hasPermission = await locationService.checkAndRequestLocationPermission();

    if (hasService && hasPermission) {
      Position? position = await locationService.getCurrentLocation();
      if (position != null) {
        Marker userMarker = Marker(
          markerId: const MarkerId("user_location"),
          position: LatLng(position.latitude, position.longitude),
        );

     

        googleMapController?.animateCamera(
          CameraUpdate.newLatLng(userMarker.position),
        );
      }
    }
  }

   void saveUserLocation() async {
    if (markers.isNotEmpty) {
      LatLng userPosition = markers.first.position;
      try {
        List<Placemark> placemark = await placemarkFromCoordinates(
          userPosition.latitude,
          userPosition.longitude,
        );
        if (placemark.isNotEmpty) {
          Placemark place = placemark.first;
          String fullAddress =
              "${place.locality}, ${place.country}";
          setState(() {
            savedAddress = fullAddress;
          });
          await SharedPref().setString(PrefKeys.location, fullAddress);
          context.pushNamedAndRemoveUntil(RouteName.main,);
        }
      } catch (e) {
        debugPrint("Geocoding Exception: $e");
      }
    }
  }
}


