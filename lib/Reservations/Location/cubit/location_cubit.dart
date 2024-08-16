 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
 import 'package:thi/NetWork/dioHelper.dart';
import 'package:thi/Reservations/Location/model/listClubs.dart';

import '../../../sharePreferinces/shardprefericences.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationInitial());
  static LocationCubit getObject(context) => BlocProvider.of(context);

  ListClubModel? listClubsmodel;
  void getDataClubList() {
    emit(LocationLoading());
    DioHelper.getDataClub(
            endpoint: "showAllClubs",
            token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      listClubsmodel = ListClubModel.fromJson(value.data);
      // print(listClubsmodel!.images.toString() +
      //     "LLLLLLLLLLLLLLLLLLLLLLKKKKKKKKKKKKKKKKKKKKKKKKK");
      // for (var i = 0; i < listClubsmodel!.data!.length; i++) {
      //   CachShpreafapp.getdata(
      //           key:
      //               "boolfavoratie${CachShpreafapp.getdata(key: "UserID")}${listClubsmodel!.data![i].id}") ??
      //       CachShpreafapp.sevedata(
      //           key:
      //               "boolfavoratie${CachShpreafapp.getdata(key: "UserID")}${listClubsmodel!.data![i].id}",
      //           value: false);
      // }

      print(value.data.toString());
      Fluttertoast.showToast(
          msg: "Ok",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      emit(LocationSueccfuly());
    }).catchError((onError) {
      print("object");
      Fluttertoast.showToast(
          msg: "Error",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      emit(LocationError());
    });
  }

  double? lat, long;
  void ChaningLatLng(double? latitude, double? longitude) {
    this.lat = latitude;
    this.long = longitude;
    emit(LocationChaningLatLng());
  }
}
