import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:thi/NetWork/dioHelper.dart';
import 'package:thi/auth/Login/login.dart';
import 'package:thi/auth/ResetPassWord/model/ResetPassWord.dart';

part 'reset_pass_word_state.dart';

class ResetPassWordCubit extends Cubit<ResetPassWordState> {
  ResetPassWordCubit() : super(ResetPassWordInitial());

  static ResetPassWordCubit getObject(context) => BlocProvider.of(context);
  RestPassWordandCode? restPassWordandCode;
  bool isLoad = false;
  chaingLoaging(bool Loading) {
    this.isLoad = Loading;
    emit(ResetPassWordChaingloading());
  }

  void postResetPassWord(
      {required String email,
      required String codeEmail,
      required String passWord,
      required String conf_PassWord,
      required BuildContext context}) {
    emit(ResetPassWordLoading1());
    FormData formData = FormData.fromMap({
      "email": email,
      "resetToken": codeEmail,
      "password": passWord,
      "password_confirmation": conf_PassWord
    });
    DioHelper.postData("reset-password", data: formData).then((value) {
      restPassWordandCode = RestPassWordandCode.fromJson(value.data);
      Fluttertoast.showToast(
          msg: restPassWordandCode!.message.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 10,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);

      if (restPassWordandCode!.status!) {
        Navigator.pushReplacement<void, void>(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => LoginW(),
          ),
        );
      }
      isLoad = false;
      emit(ResetPassWordSueccsfuly1());
    }).catchError((onError) {
      isLoad = false;

      Fluttertoast.showToast(
          msg: restPassWordandCode!.message.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      print(onError.toString());
      emit(ResetPassWordErorr1());
    });
  }
}
