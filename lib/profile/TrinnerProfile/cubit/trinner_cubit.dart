import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:thi/NetWork/dioHelper.dart';
import 'package:thi/profile/TrinnerProfile/model/Reservation.dart';
import 'package:thi/profile/TrinnerProfile/model/averageReview.dart';
import 'package:thi/profile/TrinnerProfile/model/createReview.dart';
import 'package:thi/profile/TrinnerProfile/model/deleteRaing.dart';
import 'package:thi/profile/TrinnerProfile/model/getAllReview.dart';
import 'package:thi/profile/TrinnerProfile/model/UserHasReviewInTrainer.dart';
import 'package:thi/profile/TrinnerProfile/model/getRatingModel.dart';
import 'package:thi/profile/TrinnerProfile/model/updataReview.dart';
import 'package:thi/sharePreferinces/shardprefericences.dart';

part 'trinner_state.dart';

class TrinnerCubit extends Cubit<TrinnerState> {
  TrinnerCubit() : super(TrinnerInitial());

  static TrinnerCubit getObject(context) => BlocProvider.of(context);

  TextEditingController controllerSend = TextEditingController();
  double rating = 0.0;
  chaingStar(double value) {
    this.rating = value;
    emit(TrinnerRating());
  }

  CreateReview? createReview;
  void postGetSendRevewTrinner(
      {required int trainer_id,
      required int idUser,
      int? rating,
      String? review}) {
    emit(TrinnerCreatLoading());
    print(trainer_id.toString() +
        idUser.toString() +
        rating.toString() +
        review.toString() +
        "UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU");
    FormData formData = FormData.fromMap({
      "trainer_id": trainer_id,
      "user_id": idUser,
      "rating": rating,
      "review": review.toString()
    });
    DioHelper.postData("createTrainerRating",
            data: formData, token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      createReview = CreateReview.fromJson(value.data);
      CachShpreafapp.sevedata(
          key: "ratingIDTrinner", value: createReview!.rating!.id!);
      // // chaingFavorite(true);
      // // CachShpreafapp.putbool(key: "boolfavoratie", value: false);
      if (createReview!.status == true) {
        userHasReviewInTrainerTrinner(trainer_id: trainer_id, idUser: idUser);
        controllerSend.clear();
        rating = 0;
      }
      print("objectffffffffffffffffffdfdfdfdfdfdfdffffff");
      getDataTrinnerGetRevewListModel(trainer_id);
      getDataGetAverageTrinnerRevewModel(trainer_id);
      emit(TrinnerCreatSeccefuly());
    }).catchError((onError) {
      emit(TrinnerCreatError());
    });
  }

  UpdataReview? updataReview;
  void updataReviewSendRevewTrinner(
      {required int trainer_id,
      required int rating_id,
      required int idUser,
      int? rating,
      String? review}) {
    emit(TrinnerUpdataReviewLoading());
    print(rating_id.toString() +
        idUser.toString() +
        rating.toString() +
        review.toString() +
        "UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU");
    FormData formData = FormData.fromMap({
      "rating_id": rating_id,
      "user_id": idUser,
      "rating": rating,
      "review": review.toString()
    });
    DioHelper.postData("updateTrainerRating",
            data: formData, token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      updataReview = UpdataReview.fromJson(value.data);
      print(updataReview!.status.toString() +
          "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO");
      // // chaingFavorite(true);
      // // CachShpreafapp.putbool(key: "boolfavoratie", value: false);
      if (updataReview!.status == true) {
        // userHasReviewInTrainerTrinner(trainer_id: trainer_id, idUser: idUser);
        controllerSend.clear();
        rating = 0;
      }
      print("objectffffffffffffffffffdfdfdfdfdfdfdffffff");
      getDataTrinnerGetRevewListModel(trainer_id);
      getDataGetAverageTrinnerRevewModel(trainer_id);
      getRatingID(
          trainer_id: trainer_id,
          user_id: CachShpreafapp.getdata(key: "UserID"));
      emit(TrinnerUpdataReviewSeccefuly());
    }).catchError((onError) {
      emit(TrinnerUpdataReviewError());
    });
  }

  UserHasReviewInTrainer? userHasReviewInTrainer;
  void userHasReviewInTrainerTrinner({
    required int trainer_id,
    required int idUser,
  }) {
    emit(TrinnerUserHasReviewInTrainerLoading());
    print(trainer_id.toString() + idUser.toString());
    FormData formData = FormData.fromMap({
      "trainer_id": trainer_id,
      "user_id": idUser,
    });
    DioHelper.postData("userHasReviewInTrainer",
            data: formData, token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      userHasReviewInTrainer = UserHasReviewInTrainer.fromJson(value.data);
      // // chaingFavorite(true);
      // // CachShpreafapp.putbool(key: "boolfavoratie", value: false);

      print("objectffffffffffffffffffdfdfdfdfdfdfdffffff");
      getDataTrinnerGetRevewListModel(trainer_id);
      getDataGetAverageTrinnerRevewModel(trainer_id);
      emit(TrinnerUserHasReviewInTrainerSeccefuly());
    }).catchError((onError) {
      emit(TrinnerUserHasReviewInTrainerError());
    });
  }

  AvarageReviewRating? avarageReviewRating;
  void getDataGetAverageTrinnerRevewModel(int trainer_id) {
    emit(TrinnerAverageLoading());
    DioHelper.getDataClub(
            endpoint: "allAverageTrainerRating/${trainer_id}",
            token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      avarageReviewRating = AvarageReviewRating.fromJson(value.data);

      emit(TrinnerAverageSeccefuly());
    }).catchError((onError) {
      print("object" + onError.toString());

      emit(TrinnerAverageError());
    });
  }

  GetAllReviewUserByTrinner? getAllReviewUserByTrinner;
  void getDataTrinnerGetRevewListModel(int trainer_id) {
    emit(TrinnerAllReviewTrinnerLoading());
    DioHelper.getDataClub(
            endpoint: "getAllReviewsInTrainer/${trainer_id}",
            token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      // print(value.data.toString() +
      //     "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
      getAllReviewUserByTrinner =
          GetAllReviewUserByTrinner.fromJson(value.data);
      print("IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIOOO");
      // print(value.data.toString());
      Fluttertoast.showToast(
          msg: "Ok",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      emit(TrinnerAllReviewTrinnerSeccefuly());
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
      emit(TrinnerAllReviewTrinnerError());
    });
  }

  ReservedTrainerModel? reservedTrainerModel;
  void postIsReservation({required int trainer_id, required int User_Id}) {
    emit(TrinnerIsReservitionLoading());
    FormData formData =
        FormData.fromMap({"trainer_id": trainer_id, "user_id": User_Id});
    DioHelper.postData("isReservedTrainer",
            data: formData, token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      reservedTrainerModel = ReservedTrainerModel.fromJson(value.data);
      emit(TrinnerIsReservitionSeccefuly());
    }).catchError((onError) {
      emit(TrinnerIsReservitionError());
    });
  }

  DeleteRating? deleteRating;
  void deleteRevewTrinner({
    required int trainer_id,
    required int rating_id,
    required int idUser,
  }) {
    emit(TrinnerDeleteLoading());
    print(rating_id.toString() + idUser.toString() + rating.toString());
    FormData formData = FormData.fromMap({
      "rating_id": rating_id,
      "user_id": idUser,
    });
    DioHelper.postData("deleteTrainerRating",
            data: formData, token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      deleteRating = DeleteRating.fromJson(value.data);
      // // chaingFavorite(true);
      // // CachShpreafapp.putbool(key: "boolfavoratie", value: false);

      print("objectffffffffffffffffffdfdfdfdfdfdfdffffff");
      getDataTrinnerGetRevewListModel(trainer_id);
      getDataGetAverageTrinnerRevewModel(trainer_id);
      getRatingID(
          trainer_id: trainer_id,
          user_id: CachShpreafapp.getdata(key: "UserID"));
      emit(TrinnerDeleteSeccefuly());
    }).catchError((onError) {
      emit(TrinnerDeleteError());
    });
  }

  GetRatingIDModel? getRatingModel;
  void getRatingID({
    required int trainer_id,
    // required int rating_id,
    required int user_id,
  }) {
    emit(TrinnerRatingIDLoading());
    print(user_id.toString() + rating.toString());
    FormData formData = FormData.fromMap({
      "trainer_id": trainer_id,
      "user_id": user_id,
    });
    DioHelper.postData("getRatingIDByUserTrainer",
            data: formData, token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      getRatingModel = GetRatingIDModel.fromJson(value.data);
      print(getRatingModel!.id == null
          ? "0"
          : getRatingModel!.id.toString() +
              "objectffffffffffffffffffdfdfdfdfdfdfdffffff");
      print("88888888888888888888888888888888888888888888888");
      emit(TrinnerRatingIDSeccefuly());
    }).catchError((onError) {
      emit(TrinnerRatingIDError());
    });
  }
}
