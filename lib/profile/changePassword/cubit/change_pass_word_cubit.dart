 import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
 import 'package:thi/NetWork/dioHelper.dart';
import 'package:thi/profile/changePassword/model/changePassWordModel.dart';
import 'package:thi/sharePreferinces/shardprefericences.dart';

part 'change_pass_word_state.dart';

class ChangePassWordCubitProfile extends Cubit<ChangePassWordState> {
  ChangePassWordCubitProfile() : super(ChangePassWordInitial());
  static ChangePassWordCubitProfile getObject(context) =>
      BlocProvider.of(context);
  bool isLoad1 = false;
  chaingLoaging1(bool Loading) {
    this.isLoad1 = Loading;
    emit(ChangePassWordCliekChange());
  }

  ChanagPassWord? changePassWord;
  void ChangPassWord(
      {required String oldPassWord,
      required String newPassWord,
      required String conf_PassWord}) {
    emit(ChangePassWordLoading());
    print(CachShpreafapp.getdata(key: "tokenProfile").toString() +
        "PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP");
    FormData formData = FormData.fromMap({
      "current_password": oldPassWord,
      "new_password": newPassWord,
      "new_password_confirmation": conf_PassWord,
    });
    DioHelper.postData("change-password",
            data: formData,
            token: CachShpreafapp.getdata(key: "tokenProfile").toString())
        .then((value) {
      chaingLoaging1(true);

      changePassWord = ChanagPassWord.fromJson(value.data);
      Fluttertoast.showToast(
          msg: changePassWord!.message.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 6,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      chaingLoaging1(false);

      emit(ChangePassWordSueccsufly());
    }).catchError((onError) {
      Fluttertoast.showToast(
          msg: changePassWord!.message.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 6,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      chaingLoaging1(false);

      emit(ChangePassWordError());
    });
  }
}
