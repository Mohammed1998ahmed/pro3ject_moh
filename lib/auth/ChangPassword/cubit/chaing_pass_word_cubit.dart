import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:thi/NetWork/dioHelper.dart';
 import 'package:thi/auth/ResetPassWord/resetPassWord.dart';

import '../model/restPassWord.dart';

part 'chaing_pass_word_state.dart';

class ChaingPassWordCubit extends Cubit<ChaingPassWordState> {
  ChaingPassWordCubit() : super(ChaingPassWordInitial());
  static ChaingPassWordCubit getObject(context) => BlocProvider.of(context);
  bool isLoad = false;
  chaingLoaging(bool Loading) {
    this.isLoad = Loading;
    emit(ChaingPassWordChaingloading());
  }

  void postEmail({required String Email, required BuildContext context}) {
    emit(ChaingPassWordChaingloading());
    FormData formData = FormData.fromMap({"email": Email});
    RestPassWord? restPassWord;
    DioHelper.postData("send-password-reset-email", data: formData)
        .then((value) {
      print("Chaing page PassWord");
      restPassWord = RestPassWord.fromJson(value.data);
      Fluttertoast.showToast(
          msg: restPassWord!.message.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      chaingLoaging(false);
      Navigator.push<void>(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => ResetPassWord(),
        ),
      );
    }).catchError((onError) {
      chaingLoaging(false);
      Fluttertoast.showToast(
          msg: restPassWord!.message.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      print(onError.toString());
    });
  }
}
