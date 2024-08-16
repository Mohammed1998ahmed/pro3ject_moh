import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:thi/Health%20care/Home/home.dart';
import 'package:thi/NetWork/dioHelper.dart';
import 'package:thi/sharePreferinces/shardprefericences.dart';

part 'verternaty_state.dart';

class VerternatyCubit extends Cubit<VerternatyState> {
  VerternatyCubit() : super(VerternatyInitial());

  static VerternatyCubit getObject(context) => BlocProvider.of(context);

  int selectedValue = 1;
  void chaingSelectValue(int selectindex) {
    this.selectedValue = selectindex;
    emit(VerternatySelectValue());
  }

  String selectGender = "Male";
  void SelectGender(String gender) {
    this.selectGender = gender;
    emit(VerternatySelectGender());
  }

  String? selectedColor;
  final List<String> horseColors = [
    'Bay',
    'Black',
    'Brown',
    'Chestnut',
    'Gray',
    'Palomino',
    'Roan',
    'Buckskin',
    'Dun',
    'Appaloosa',
    'Paint',
    'Pinto'
  ];
  void chaingSelectColor({required String color}) {
    this.selectedColor = color;
    emit(VerternatySelectColor());
  }

  bool isload = false;
  void chingLoading(bool isloading) {
    this.isload = isloading;
    emit(VerternatyChangLoading());
  }

  void postCreateConsultation(
      {required BuildContext context,
      required int health_care_id,
      required List<XFile> selectedImages,
      required String hoursName,
      required String age,
      required String hoursColor,
      required String symptoms,
      required String gender,
      required List<Map<String, String>> vaccinations,
      required List<Map<String, dynamic>> treatment,
      required List<Map<String, dynamic>> medical,
      required String questions}) async {
    List<MultipartFile> imageFiles = [];

    for (XFile image in selectedImages) {
      File file = File(image.path);
      String fileName = image.path.split('/').last;
      MultipartFile multipartFile = await MultipartFile.fromFile(
        file.path,
        filename: fileName,
      );
      imageFiles.add(multipartFile);
    }
    print(vaccinations.toString() + "PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP");
    emit(VerternatyCreateLoading());
    FormData formData = FormData.fromMap({
      for (int i = 0; i < imageFiles.length; i++) 'images[$i]': imageFiles[i],
      "name": hoursName,
      "age": age,
      "color": hoursColor,
      "gender": gender,
      "symptoms": symptoms,
      "question": questions,
      "profile_id": CachShpreafapp.getdata(key: "ProfileID"),
      "health_care_id": health_care_id,
      "vaccinations": vaccinations,
      "treatments": treatment,
      "medicals": medical
    });
    DioHelper.postData(
      "createConsultation",
      data: formData,
      token: CachShpreafapp.getdata(key: "tokenProfile"),
    ).then((value) {
      chingLoading(false);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeHealth(),
        ),
      );
      emit(VerternatyCreateSeccesssfluy());
    }).catchError((onError) {
      print(onError.toString());
      chingLoading(false);

      emit(VerternatyCreateError());
    });
  }
}
