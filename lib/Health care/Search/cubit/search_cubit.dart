import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import 'package:thi/Health%20care/Search/model/searchMOdel.dart';
import 'package:thi/NetWork/dioHelper.dart';
import 'package:thi/sharePreferinces/shardprefericences.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  static SearchCubit getObject(context) => BlocProvider.of(context);
  TextEditingController SeachController = TextEditingController();

  GetSearchHealthModel? getSearchModel;
  void getDataSearch(String? search) {
    emit(Searchloading());
    DioHelper.getDataClub(
            endpoint: "searchHealthCareByNameUser/${search ?? 0}",
            token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      getSearchModel = GetSearchHealthModel.fromJson(value.data);
      // print(listClubsmodel!.images.toString() +
      //     "LLLLLLLLLLLLLLLLLLLLLLKKKKKKKKKKKKKKKKKKKKKKKKK");
      // print(value.data.toString());
      if (getSearchModel!.status == true) {
        chaingBooleanSearch(isChaing: true);
      }
      if (getSearchModel!.status == false) {
        chaingBooleanSearch(isChaing: false);
      }
      Fluttertoast.showToast(
          msg: getSearchModel!.message.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      emit(SearchSeccessfluy());
    }).catchError((onError) {
      // print("object");
      Fluttertoast.showToast(
          msg: "Not Found",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      emit(SearchError());
    });
  }
  bool isLoad = false;
  void chaingLoading(bool Loading) {
    this.isLoad = Loading;
    emit(SearchBooleanLoading());
  }
  bool istoggel = true;
  void chaingBooleanSearch({required bool isChaing}) {
    this.istoggel = isChaing;
    emit(SearchBoolean());
  }
}
