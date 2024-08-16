import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlaceSearchScreen extends StatefulWidget {
  @override
  _PlaceSearchScreenState createState() => _PlaceSearchScreenState();
}

class _PlaceSearchScreenState extends State<PlaceSearchScreen> {
  GoogleMapController? _mapController;
  TextEditingController _searchController = TextEditingController();
  List<Placemark> _searchResults = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Place Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TypeAheadField<String>(
              // transitionBuilder: (context, animation, child) {
              //   controller: _searchController,
              //     decoration: InputDecoration(
              //       labelText: 'Search Place',
              //     ),
              // },

              controller: _searchController,

              // textFieldConfiguration: TextFieldConfiguration(

              // ),
              suggestionsCallback: (pattern) async {
                if (pattern.isEmpty) return [];
                return await searchPlace(pattern);
              },
              itemBuilder: (context, suggestion) {
                return ListTile(
                  title: Text(suggestion),
                );
              },

              onSelected: (suggestion) async {
                _searchController.text = suggestion;
                await searchPlace(suggestion);
              },

              // onSuggestionSelected:
            ),
          ),
          Expanded(
            child: GoogleMap(
              mapType: MapType.satellite,
              onMapCreated: (controller) {
                setState(() {
                  _mapController = controller;
                });
              },
              initialCameraPosition: CameraPosition(
                target: LatLng(40.7128, -74.0060), // New York City coordinates
                zoom: 12,
              ),
              markers: _buildMarkers(),
            ),
          ),
        ],
      ),
    );
  }

  Future<List<String>> searchPlace(String query) async {
    if (query.isEmpty) {
      setState(() {
        _searchResults = [];
      });
      return [];
    }

    try {
      List<Location> locations = await locationFromAddress(query);
      List<Placemark> placemarks = await placemarkFromCoordinates(
        locations[0].latitude,
        locations[0].longitude,
      );

      setState(() {
        _searchResults = placemarks;
        _moveToPlace(locations[0]);
      });

      return placemarks.map((placemark) => placemark.name ?? '').toList();
    } catch (e) {
      print('Error searching place: $e');
      return [];
    }
  }

  void _moveToPlace(Location location) {
    _mapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(location.latitude, location.longitude),
          zoom: 15,
        ),
      ),
    );
  }

  Set<Marker> _buildMarkers() {
    return _searchResults.map((placemark) {
      return Marker(
        markerId: MarkerId(placemark.name ?? ''),
        position: LatLng(40.7128, -74.0060),
        infoWindow: InfoWindow(
          title: placemark.name ?? '',
          snippet: placemark.subThoroughfare != null
              ? '${placemark.thoroughfare}, ${placemark.subThoroughfare}'
              : placemark.thoroughfare ?? '',
        ),
      );
    }).toSet();
  }
}
