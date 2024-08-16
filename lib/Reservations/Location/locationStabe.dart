import 'dart:async';

 import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationStable extends StatefulWidget {
  LocationStable({Key? key, required this.latitude, required this.longitude})
      : super(key: key);

  final double latitude;
  final double longitude;

  @override
  State<LocationStable> createState() => LocationStableState();
}

class LocationStableState extends State<LocationStable> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  late CameraPosition _initialCameraPosition;
  Set<Marker> _markers = {};
  @override
  void initState() {
    super.initState();
    _initialCameraPosition = CameraPosition(
      target: LatLng(widget.latitude, widget.longitude),
      zoom: 8.0,
    );

    _markers.add(
      Marker(
        markerId: MarkerId('location'),
        position: LatLng(widget.latitude, widget.longitude),
      ),
    );

    // Marker(
    //   markerId: MarkerId('abu_dhabi'),
    //   position: LatLng(24.4539, 54.3773),
    //   infoWindow: InfoWindow(title: 'أبوظبي'),
    // ),
    // Marker(
    //   markerId: MarkerId('dubai'),
    //   position: LatLng(25.2048, 55.2708),
    //   infoWindow: InfoWindow(title: 'دبي'),
    // ),
    // Marker(
    //   markerId: MarkerId('sharjah'),
    //   position: LatLng(25.3463, 55.4209),
    //   infoWindow: InfoWindow(title: 'الشارقة'),
    // ),
    // Marker(
    //   markerId: MarkerId('murban_horse_stables'),
    //   position: LatLng(25.1515, 55.3588),
    //   infoWindow: InfoWindow(title: 'Murban Horse Stables'),
    // ),
    // Marker(
    //   markerId: MarkerId('dubai_polo_equestrian_club'),
    //   position: LatLng(25.1142, 55.2428),
    //   infoWindow: InfoWindow(title: 'Dubai Polo & Equestrian Club'),
    // ),
    // Marker(
    //   markerId: MarkerId('desert_palm_riding_school'),
    //   position: LatLng(25.0791, 55.3181),
    //   infoWindow: InfoWindow(title: 'Desert Palm Riding School'),
    // ),
    // Marker(
    //   markerId: MarkerId('al_habtoor_polo_resort_club'),
    //   position: LatLng(25.0326, 55.2633),
    //   infoWindow: InfoWindow(title: 'Al Habtoor Polo Resort & Club'),
    // ),
    // Marker(
    //   markerId: MarkerId('dubai_riding_centre'),
    //   position: LatLng(25.0929, 55.2231),
    //   infoWindow: InfoWindow(title: 'Dubai Riding Centre'),
    // ),
    // Marker(
    //   markerId: MarkerId('dubai_international_endurance_city'),
    //   position: LatLng(24.8326, 55.1554),
    //   infoWindow: InfoWindow(title: 'Dubai International Endurance City'),
    // ),
    // Marker(
    //   markerId: MarkerId('abu_dhabi_equestrian_club'),
    //   position: LatLng(24.3991, 54.4960),
    //   infoWindow: InfoWindow(title: 'Abu Dhabi Equestrian Club'),
    // ),
    // Marker(
    //   markerId: MarkerId('al_masaood_stables'),
    //   position: LatLng(24.3693, 54.5260),
    //   infoWindow: InfoWindow(title: 'Al Masaood Stables'),
    // ),
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GoogleMap(
          mapType: MapType.hybrid,
          initialCameraPosition: _initialCameraPosition,
          markers: _markers,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: _goToLocation,
          label: const Text('Go to location'),
          icon: const Icon(Icons.location_on),
        ),
      ),
    );
  }

  Future<void> _goToLocation() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(widget.latitude, widget.longitude),
          zoom: 16.0,
          bearing: 200000,
          tilt: 60,
        ),
      ),
      // duration: Duration(seconds: 3),  // قم بضبط المدة حسب رغبتك
    );
  }
}
