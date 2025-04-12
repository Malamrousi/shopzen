import 'package:flutter/material.dart';
import 'package:shopzen/features/map/presentation/view/widgets/location_screen_view_body.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: LocationScreenViewBody()),
    );
  }
}
