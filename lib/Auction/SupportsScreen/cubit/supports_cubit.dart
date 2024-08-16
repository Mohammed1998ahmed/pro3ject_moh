import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import 'package:thi/Auction/SupportsScreen/model/supportmodel.dart';
import 'package:thi/NetWork/dioHelper.dart';
import 'package:thi/sharePreferinces/shardprefericences.dart';
import 'package:dio/dio.dart';

part 'supports_state.dart';

class SupportsCubit extends Cubit<SupportsState> {
  SupportsCubit() : super(SupportsInitial());
  static SupportsCubit getObject(context) => BlocProvider.of(context);
  SupportsModel? supportsModel;
  void postSupport(
      {required String email, required String phone, required String massage}) {
    emit(SupportsLoading());
    FormData formData = FormData.fromMap({
      "email": email,
      "phone": phone,
      "message": massage,
    });
    DioHelper.postData(
      "createSupport",
      data: formData,
      token: CachShpreafapp.getdata(key: "tokenProfile"),
    ).then((value) {
      supportsModel = SupportsModel.fromJson(value.data);
      chingLoading(false);
      Fluttertoast.showToast(
          msg: "The request has been sent..",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      emit(SupportsSueccessfluy());
    }).catchError((onError) {
      chingLoading(false);
      emit(SupportsError());
    });
  }

  bool isload = false;
  void chingLoading(bool isloading) {
    this.isload = isloading;
    emit(SupportsChaingBoolean());
  }
}
