import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:thi/NetWork/dioHelper.dart';
import 'package:thi/sharePreferinces/shardprefericences.dart';

import '../model/modelRegister.dart';
import '../model/vmodel.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit getObject(context) => BlocProvider.of(context);
  File? imageFile1;
  void imagepath(File imagePath) {
    this.imageFile1 = imagePath;
    emit(RegisterImagePath());
  }

  User1? user;
  void postReister(
      {required File imageFile,
      required String Email,
      required String Name,
      required String LName,
      required String PassWord,
      required String Conf_PassWord,
      required String Phone,
      required String address,
      required String gender,
      required String birth,
      required BuildContext context}) async {
    List<int> fileBytes = await imageFile.readAsBytes();

    FormData formData = FormData.fromMap({
      'image': MultipartFile.fromBytes(fileBytes, filename: 'image.jpg'),
      "FName": Name,
      "LName": LName,
      "mobile": Phone,
      "email": Email,
      "password": PassWord,
      "password_confirmation": Conf_PassWord,
      "address": address,
      "gender": gender,
      "birth": birth,
      "type": "profile",
    });
    DioHelper.postData(
      "register",
      data: formData,
    ).then((value) {
      user = User1.fromJson(value.data);

      Fluttertoast.showToast(
          msg: user!.message!,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);

      // CachShpreafapp.sevedata(key: "tokenProfile", value: user!.data!.token);
      chingLoading(false);
      if (user!.status == true) {
        CachShpreafapp.sevedata(key: "tokenProfile", value: user!.data!.token!);
        CachShpreafapp.sevedata(key: "UserID", value: user!.data!.user!.id!);
        CachShpreafapp.sevedata(
            key: "FName", value: user!.data!.profile!.fName);
        CachShpreafapp.sevedata(
            key: "LName", value: user!.data!.profile!.lName);
        CachShpreafapp.sevedata(
            key: "ImageProfile", value: user!.data!.profile!.profile);

        CachShpreafapp.sevedata(
            key: "ProfileID", value: user!.data!.profile!.id!);
        postVerfitionCode(email: Email);
        emit(RegisterSeccsfully());
      }
    }).catchError((onError) {
      print(onError.toString());
      Fluttertoast.showToast(
          msg: user!.message!,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      chingLoading(false);
      emit(RegisterError());
    });
  }

  VerfictionModel? verficitionModel;
  void postVerfitionCode({required String email}) {
    emit(RegisterLoadingVerfetion());
    FormData formData = FormData.fromMap({
      "email": email,
    });
    DioHelper.postData("send-verification-email", data: formData).then((value) {
      verficitionModel = VerfictionModel.fromJson(value.data);
      if (verficitionModel!.status == true) {
        Fluttertoast.showToast(
            msg: verficitionModel!.message.toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        emit(RegisterSeccsfullyVerfetion());
      }
    }).catchError((onError) {
      if (verficitionModel!.status == false) {
        Fluttertoast.showToast(
            msg: verficitionModel!.message.toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        emit(RegisterErrorVerfetion());
      }
    });
  }
  // postDataReister(
  //     {required File imageFile,
  //     required String Email,
  //     required String Name,
  //     required String PassWord,
  //     required String Phone}) async {
  //   List<int> fileBytes = await imageFile.readAsBytes();
  //   String base64Image = base64Encode(fileBytes);
  //   print(base64Image.toString() +
  //       "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO");
  //   emit(LodingReister());
  //   ServerApi.postData(
  //     path: "register",
  //     data: {
  //       "image": base64Image,
  //       //     await MultipartFile.fromFile(imageFile.path, filename: "image.jpg"),
  //       "name": Name,
  //       "phone": Phone,
  //       "email": Email,
  //       "password": PassWord,
  //     },
  //   ).then((value) {
  //     print("Reister Moham,med mohran to Abo Dubi");
  //     print(value.data.toString());
  //     modelRegister = ModelRegister.fromJson(json: value.data);
  //     CachShpreaf.sevedata(key: "Token", value: modelRegister.data!.token);

  //     print(modelRegister.data!.image.toString());

  //     print(modelRegister.message);
  //     Fluttertoast.showToast(
  //         msg: modelRegister.message ?? "",
  //         toastLength: Toast.LENGTH_SHORT,
  //         gravity: ToastGravity.BOTTOM,
  //         timeInSecForIosWeb: 1,
  //         backgroundColor: Colors.green,
  //         textColor: Colors.white,
  //         fontSize: 16.0);
  //     print("mohammed Mohamemmd Mohamedd Mohammed Mohammed" +
  //         CachShpreaf.getdata(key: "Token").toString());
  //     emit(SuccesfulyReister());
  //   }).catchError((onError) {
  //     print(onError.toString());
  //     Fluttertoast.showToast(
  //         msg: modelRegister.message ?? "",
  //         toastLength: Toast.LENGTH_SHORT,
  //         gravity: ToastGravity.BOTTOM,
  //         timeInSecForIosWeb: 1,
  //         backgroundColor: Colors.red,
  //         textColor: Colors.white,
  //         fontSize: 16.0);
  //     emit(ErrorReister());
  //   });
  // }

  bool isload = false;
  void chingLoading(bool isloading) {
    this.isload = isloading;
    emit(RegisterChangLoading());
  }

  int selectedValue = 1;
  void chaingSelectValue(int selectindex) {
    this.selectedValue = selectindex;
    emit(RegisterSelectedValue());
  }

  String selectGender = "Male";
  void SelectGender(String gender) {
    this.selectGender = gender;
    emit(RegisterSelectGender());
  }
}
