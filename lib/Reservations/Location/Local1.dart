import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thi/Reservations/Booking/servic.dart';
import 'package:thi/Reservations/Location/cubit/location_cubit.dart';
import 'package:thi/Reservations/Details_Club/Home.dart';
import 'package:thi/component/Widght.dart';
import 'package:thi/component/conset/Const.dart';

import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Local1 extends StatefulWidget {
  Local1({Key? key}) : super(key: key);

  @override
  State<Local1> createState() => _Local1State();
}

class _Local1State extends State<Local1> {
  GoogleMapController? _mapController;
  TextEditingController _searchController = TextEditingController();
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  List<Placemark> _searchResults = [];

  void _showBottomSheet(BuildContext context,
      {required LocationCubit cubitLocation}) {
    showModalBottomSheet(
      context: context,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(136, 207, 255, 0.548), // اللون الأصلي

                    Color.fromRGBO(71, 181, 255, 0.925), // اللون الأصلي

                    Color.fromRGBO(199, 255, 255, 1), // اللون المتناسق
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0))),
            // clipBehavior: Clip.hardEdge,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                text(
                    title: "Stable Nearby",
                    color: Color3,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.005,
                ),
                text(
                    title: "Found place near Abu Dhabi",
                    color: Color2,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.010,
                ),
                cubitLocation.listClubsmodel == null
                    ? Center(child: CircularProgressIndicator())
                    : Container(
                        height: MediaQuery.of(context).size.height * 0.4069,
                        width: MediaQuery.of(context).size.width * 1.59999,
                        child: ListView.separated(
                          itemCount: cubitLocation.listClubsmodel!.data!.length,
                          separatorBuilder: (BuildContext context, int index) =>
                              const Divider(
                            color: Colors.black,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              width: MediaQuery.of(context).size.width * 0.75,
                              height: MediaQuery.of(context).size.height * 0.15,
                              child: Stack(
                                children: [
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: (() {
                                          /////////////////////////// edit edit
                                          Navigator.push<void>(
                                            context,
                                            MaterialPageRoute<void>(
                                              builder: (BuildContext context) =>
                                                  Home(
                                                Id: cubitLocation
                                                    .listClubsmodel!
                                                    .data![index]
                                                    .id!,
                                              ),
                                            ),
                                          );
                                        }),
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.250,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.10,
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            image: DecorationImage(
                                                image: NetworkImage(ImagesPath +
                                                    cubitLocation
                                                        .listClubsmodel!
                                                        .data![index]
                                                        .profile
                                                        .toString()),
                                                fit: BoxFit.fill),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.60,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.10,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            GestureDetector(
                                              onTap: () async {
                                                print("object");
                                                cubitLocation.ChaningLatLng(
                                                    double.parse(cubitLocation
                                                        .listClubsmodel!
                                                        .data![index]
                                                        .lat!),
                                                    double.parse(cubitLocation
                                                        .listClubsmodel!
                                                        .data![index]
                                                        .long!));

                                                final GoogleMapController
                                                    controller =
                                                    await _controller.future;
                                                controller.animateCamera(
                                                    CameraUpdate
                                                        .newCameraPosition(
                                                  CameraPosition(
                                                    target: LatLng(
                                                        double.parse(
                                                            cubitLocation
                                                                .listClubsmodel!
                                                                .data![index]
                                                                .lat!),
                                                        double.parse(
                                                            cubitLocation
                                                                .listClubsmodel!
                                                                .data![index]
                                                                .long!)),
                                                    zoom: 15.0,
                                                  ),
                                                ));

                                                Navigator.pop(context);
                                                // latitude:
                                                //   // 24.4539,
                                                //   longitude: double.parse(cubit
                                                //       .clubIDModel!.club!.long!),
                                              },
                                              child: Container(
                                                child: Column(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 4.0),
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.40,
                                                        child: text(
                                                          title: cubitLocation
                                                              .listClubsmodel!
                                                              .data![index]
                                                              .name
                                                              .toString(),
                                                          fontSize: 16,
                                                          color: Color3,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 4.0),
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.35,
                                                        child: text(
                                                          title: cubitLocation
                                                              .listClubsmodel!
                                                              .data![index]
                                                              .description
                                                              .toString(),
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Color.fromRGBO(
                                                              0, 0, 0, 0.4),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            // IconButton(
                                            //   onPressed: () {},
                                            //   icon: Icon(
                                            //     Icons.star_rate,
                                            //     color: Colors.amber,
                                            //     size: 15,
                                            //   ),
                                            // ),
                                            // Padding(
                                            //   padding:
                                            //       const EdgeInsets.symmetric(
                                            //           horizontal: 4.0),
                                            //   child: Container(
                                            //     width: MediaQuery.of(context)
                                            //             .size
                                            //             .width *
                                            //         0.60,
                                            //     child: text(
                                            //       title: "8:30 am - 9:00pm",
                                            //       maxLines: 1,
                                            //       overflow:
                                            //           TextOverflow.ellipsis,
                                            //       fontSize: 12,
                                            //       fontWeight: FontWeight.w400,
                                            //       color: Color.fromRGBO(
                                            //           0, 0, 0, 0.4),
                                            //     ),
                                            //   ),
                                            // ),
                                            Row(
                                              children: [
                                                Spacer(),
                                                InkWell(
                                                  onTap: (() {
                                                    Navigator.push<void>(
                                                      context,
                                                      MaterialPageRoute<void>(
                                                        builder: (BuildContext
                                                                context) =>
                                                            Service(
                                                          Idcubit: cubitLocation
                                                              .listClubsmodel!
                                                              .data![index]
                                                              .id,
                                                        ),
                                                      ),
                                                    );
                                                    // Navigator.push<void>(
                                                    //   context,
                                                    //   MaterialPageRoute<void>(
                                                    //     builder: (BuildContext context) =>
                                                    //         BookingScreen(),
                                                    //   ),
                                                    // );
                                                  }),
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.20,
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        // vertical: 5,
                                                        horizontal: 10),
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        border: Border.all(
                                                            color: Colors.grey),
                                                        boxShadow: [
                                                          BoxShadow(
                                                              color: Color0,
                                                              blurRadius: 5,
                                                              offset:
                                                                  Offset(5, 5))
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                    child: text(
                                                      title: "Book",
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  // Positioned(
                                  //   child: InkWell(
                                  //     onTap: (() {
                                  //       // Navigator.push<void>(
                                  //       //   context,
                                  //       //   MaterialPageRoute<void>(
                                  //       //     builder: (BuildContext context) =>
                                  //       //         BookingScreen(),
                                  //       //   ),
                                  //       // );
                                  //     }),
                                  //     child: Container(
                                  //       width: MediaQuery.of(context).size.width *
                                  //           0.20,
                                  //       padding: const EdgeInsets.symmetric(
                                  //           vertical: 5, horizontal: 10),
                                  //       decoration: BoxDecoration(
                                  //           color: Colors.white,
                                  //           border:
                                  //               Border.all(color: Colors.grey),
                                  //           boxShadow: [
                                  //             BoxShadow(
                                  //                 color: Color0,
                                  //                 blurRadius: 5,
                                  //                 offset: Offset(5, 5))
                                  //           ],
                                  //           borderRadius:
                                  //               BorderRadius.circular(10)),
                                  //       child: text(
                                  //         title: "Book",
                                  //         fontSize: 14,
                                  //       ),
                                  //     ),
                                  //   ),
                                  //   bottom: 15,
                                  //   right: 0,
                                  // ),
                                ],
                              ),
                            );
                          },
                        ))
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocationCubit()..getDataClubList(),
      child: BlocConsumer<LocationCubit, LocationState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = LocationCubit.getObject(context);
          return Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              title: Container(
                height: MediaQuery.of(context).size.height * 0.05,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    text(
                        title: "Search Loaction",
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(0, 0, 0, 1)),
                    Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width * 0.38,
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(
                                  255, 158, 158, 158)), // Add border
                          borderRadius:
                              BorderRadius.circular(8.0), // Rounded corners
                        ),
                        child: TypeAheadField<String>(
                          controller: _searchController,
                          suggestionsCallback: (pattern) async {
                            print(pattern);
                            if (pattern.isEmpty) return [];
                            return await searchPlace(pattern);
                          },
                          itemBuilder: (context, suggestion) {
                            return Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey), // Add border
                                borderRadius: BorderRadius.circular(
                                    8.0), // Rounded corners
                              ),
                              child: ListTile(
                                title: text(title: suggestion),
                              ),
                            );
                          },
                          onSelected: (suggestion) async {
                            _searchController.text = suggestion;
                            await searchPlace(suggestion);
                          },
                          // onSuggestionSelected:
                        )),
                  ],
                ),
              ),
            ),
            body: Container(
              height: MediaQuery.of(context).size.height,
              child: GoogleMap(
                mapType: MapType.hybrid,

                initialCameraPosition: CameraPosition(
                  target: LatLng(cubit.lat ?? 25.3463, cubit.long ?? 55.4209),
                  zoom: 8.0,
                ),

                //    onMapCreated: (GoogleMapController controller) {
                //   _mapController = controller;
                //   // _mapController?.setMapStyle(_mapStyle);
                // },
                // markers: _markers,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                  _mapController = controller;
                },

                markers: Set<Marker>.of([
                  Marker(
                    markerId: MarkerId('marker_id'),
                    position:
                        LatLng(cubit.lat ?? 25.3463, cubit.long ?? 55.4209),
                    infoWindow: InfoWindow(title: 'موقع المحدد'),
                  ),
                ]),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.startFloat,
            floatingActionButton: FloatingActionButton(
              backgroundColor: Color0,
              onPressed: () {
                _showBottomSheet(context, cubitLocation: cubit);
              },
              child: Container(
                  child: Icon(
                Icons.menu_rounded,
                color: Color3,
                size: 35,
              )),
            ),
          );
        },
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

  void _moveToPlace(Location location) async {
    // _mapController?.animateCamera(
    //   CameraUpdate.newCameraPosition(
    //     CameraPosition(
    //       target: LatLng(location.latitude!, location.longitude!),
    //       zoom: 15,

    //     ),
    //   ),

    // );
    await _mapController!.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        target: LatLng(location.latitude, location.longitude),
        zoom: 15,
      ),
    ));
  }

// Future<void> _goToTheLake() async {
//     final GoogleMapController controller = await _controller.future;
//     await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
//   }
  // ignore: unused_element
  Set<Marker> _buildMarkers() {
    return _searchResults.map((placemark) {
      return Marker(
        markerId: MarkerId(placemark.name ?? ''),
        // position: LatLng(
        //   placemark.position.latitude!,
        //   placemark.position.longitude!,
        // ),
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
