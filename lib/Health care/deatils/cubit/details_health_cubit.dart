import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
import 'package:thi/Health%20care/deatils/model/AllDotorsmodel.dart';
import 'package:thi/Health%20care/deatils/model/DetailsHelathCare.dart';
import 'package:thi/Health%20care/deatils/model/IsResevittionmodel.dart';
import 'package:thi/Health%20care/deatils/model/average.dart';
import 'package:thi/Health%20care/deatils/model/chickReview.dart';
import 'package:thi/Health%20care/deatils/model/deletePost.dart';
import 'package:thi/Health%20care/deatils/model/getAllReview.dart';
import 'package:thi/Health%20care/deatils/model/getRatingIDModel.dart';
import 'package:thi/Health%20care/deatils/model/postReview.dart';
import 'package:thi/Health%20care/deatils/model/updateReivew.dart';
import 'package:thi/NetWork/dioHelper.dart';
import 'package:thi/sharePreferinces/shardprefericences.dart';

import '../../../mPusherConig/piusherConfig.dart';

part 'details_health_state.dart';

class DetailsHealthCubit extends Cubit<DetailsHealthState> {
  DetailsHealthCubit() : super(DetailsHealthInitial());

  static DetailsHealthCubit getObject(context) => BlocProvider.of(context);
  HealthCaresByIDModel? healthCaresByIDModel;
  void getHomeHelthCare({required int Id_Details}) {
    emit(HomeHelthCareByIDLoading());
    DioHelper.getDataClub(
            endpoint: "getHealthCareByIDUser/${Id_Details}",
            token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      healthCaresByIDModel = HealthCaresByIDModel.fromJson(value.data);
      emit(HomeHelthCareByIDSeccessfluy());
    }).catchError((onError) {
      emit(HomeHelthCareByIDError());
    });
  }

  AllDoctorsModel? allDoctorsModel;
  void getallDoctors({required int Id_Details}) {
    emit(HomeHelthDoctorLoading());
    DioHelper.getDataClub(
            endpoint: "allDoctorsInHealthCareUser/${Id_Details}",
            token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      allDoctorsModel = AllDoctorsModel.fromJson(value.data);
      emit(HomeHelthDoctorSeccessfluy());
    }).catchError((onError) {
      emit(HomeHelthDoctorError());
    });
  }

  ///////Review
  TextEditingController controllerSend = TextEditingController();

  GetRevewListModel? getRevewListModel;
  void getDataClubGetRevewListModel(int Id_Helth) {
    emit(HomeHelthGetAllReviewLoading());
    DioHelper.getDataClub(
            endpoint: "getAllReviewsInHealth/${Id_Helth}",
            token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      print(value.data.toString() +
          "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
      getRevewListModel = GetRevewListModel.fromJson(value.data);
      // CachShpreafapp.sevedata(key: "", value:getRevewListModel.reviews[0]. );

      // print("IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIOOO");
      // print(value.data.toString());
      Fluttertoast.showToast(
          msg: "Ok",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      emit(HomeHelthGetAllReviewSeccessfluy());
    }).catchError((onError) {
      print("object" + onError.toString());
      Fluttertoast.showToast(
          msg: "Error",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      emit(HomeHelthGetAllReviewError());
    });
  }

/////////////////////////////// edit
  IsReservitionModel? isReservitionModel;
  void postIsReservation({required int health_id, required int Profile_Id}) {
    emit(HomeHelthPostChickReviewLoading());
    FormData formData =
        FormData.fromMap({"health_id": health_id, "profile_id": Profile_Id});
    DioHelper.postData("isReservedHealth",
            data: formData, token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      isReservitionModel = IsReservitionModel.fromJson(value.data);
      emit(HomeHelthPostChickReviewSeccessfluy());
    }).catchError((onError) {
      emit(HomeHelthPostChickReviewError());
    });
  }

  ReviewInClubReviewClub? userHasReviewInClub;
  void userHasReviewInTrainerTrinner({
    required int health_id,
    required int profile_id,
  }) {
    emit(HomeHelthPostChickReviewLoading());
    // print(Club_id.toString() + idUser.toString());
    FormData formData = FormData.fromMap({
      "health_id": health_id,
      "profile_id": profile_id,
    });
    DioHelper.postData("userHasReviewInHealth",
            data: formData, token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      userHasReviewInClub = ReviewInClubReviewClub.fromJson(value.data);
      // // chaingFavorite(true);
      // CachShpreafapp.putbool(key: "boolfavoratie", value: false);

      print("objectffffffffffffffffffdfdfdfdfdfdfdffffff");
      getDataClubGetRevewListModel(health_id);
      getDataGetAverageRevewModel(health_id);
      // getDataTrinnerGetRevewListModel(trainer_id);
      // getDataGetAverageTrinnerRevewModel(trainer_id);
      emit(HomeHelthPostChickReviewSeccessfluy());
    }).catchError((onError) {
      emit(HomeHelthPostChickReviewError());
    });
  }

  GetAverageRevewModel? getAverageRevewModel;
  void getDataGetAverageRevewModel(int Id_Helth) {
    emit(HomeHelthEverageLoading());
    DioHelper.getDataClub(
            endpoint: "allAverageHealthRating/${Id_Helth}",
            token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      getAverageRevewModel = GetAverageRevewModel.fromJson(value.data);

      emit(HomeHelthEverageSeccessfluy());
    }).catchError((onError) {
      print("object" + onError.toString());

      emit(HomeHelthEverageReviewError());
    });
  }

  double rating = 0.0;
  void chaingStar(double valueStar) {
    rating = valueStar;
    emit(HomeHelthEverageReviewValueStar());
  }

  UpdataClubReviewClub? updataClubReviewClub;
  void updataReviewSendRevewClub(
      {required int Id_Helth,
      required int rating_id,
      required int Profile_ID,
      int? rating,
      String? review}) {
    emit(HomeHelthUpdataLoading());
    print(rating_id.toString() +
        Profile_ID.toString() +
        rating.toString() +
        review.toString() +
        "UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU");
    FormData formData = FormData.fromMap({
      "rating_id": rating_id,
      "profile_id": Profile_ID,
      "rating": rating,
      "review": review.toString()
    });
    DioHelper.postData("updateHealthRating",
            data: formData, token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      updataClubReviewClub = UpdataClubReviewClub.fromJson(value.data);
      // // chaingFavorite(true);
      // // CachShpreafapp.putbool(key: "boolfavoratie", value: false);
      if (updataClubReviewClub!.status == true) {
        // userHasReviewInTrainerTrinner(trainer_id: trainer_id, idUser: idUser);
        controllerSend.clear();
        rating = 0;
      }
      print("objectffffffffffffffffffdfdfdfdfdfdfdffffff");
      getDataClubGetRevewListModel(Id_Helth);
      getDataGetAverageRevewModel(Id_Helth);
      // getDataTrinnerGetRevewListModel(trainer_id);
      // getDataGetAverageTrinnerRevewModel(trainer_id);
      emit(HomeHelthUpdataSeccessfluy());
    }).catchError((onError) {
      emit(HomeHelthUpdataError());
    });
  }

  PostSendRevewModel? postSendRevewModel;
  void postGetSendRevewModel(
      {required int id_Helth,
      required int Profile_ID,
      int? rating,
      String? review}) {
    emit(HomeHelthPostReivewLoading());
    print(id_Helth.toString() +
        Profile_ID.toString() +
        rating.toString() +
        review.toString() +
        "UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU");

    FormData formData = FormData.fromMap({
      "health_id": id_Helth,
      "profile_id": Profile_ID,
      "rating": rating,
      "review": review.toString()
    });
    DioHelper.postData("createHealthRating",
            data: formData, token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      // favoratieModel = FavoratieModel.fromJson(value.data);
      // // chaingFavorite(true);

      postSendRevewModel = PostSendRevewModel.fromJson(value.data);
      CachShpreafapp.sevedata(
          key: "ratingID", value: postSendRevewModel!.rating!.id!);
      print(postSendRevewModel!.rating!.id.toString() +
          "JJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJ");
      // if (postSendRevewModel!.status == true) {
      //   // userHasReviewInTrainerTrinner(trainer_id: trainer_id, idUser: idUser);
      //   controllerSend.clear();
      //   rating = 0;
      // }

      userHasReviewInTrainerTrinner(
          health_id: id_Helth,
          profile_id: CachShpreafapp.getdata(key: "ProfileID"));
      print("objectffffffffffffffffffdfdfdfdfdfdfdffffff");
      getDataClubGetRevewListModel(id_Helth);
      getDataGetAverageRevewModel(id_Helth);
      emit(HomeHelthPostReivewSeccessfluy());
    }).catchError((onError) {
      print(onError.toString() + "7777777777777777777777777777777");
      emit(HomeHelthPostReivewError());
    });
  }

  DeleteReviewClub? deleteRating;
  void deleteRevewTrinner({
    required int Helth_id,
    required int rating_id,
    required int Profile_id,
  }) {
    emit(HomeHelthDeleteReivewLoading());
    print(rating_id.toString() + Profile_id.toString() + rating.toString());
    FormData formData = FormData.fromMap({
      "rating_id": rating_id,
      "profile_id": Profile_id,
    });
    DioHelper.postData("deleteHealthRating",
            data: formData, token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      deleteRating = DeleteReviewClub.fromJson(value.data);
      // // chaingFavorite(true);
      // // CachShpreafapp.putbool(key: "boolfavoratie", value: false);

      print("objectffffffffffffffffffdfdfdfdfdfdfdffffff");
      getDataClubGetRevewListModel(Helth_id);
      getDataGetAverageRevewModel(Helth_id);
      // getDataTrinnerGetRevewListModel(trainer_id);
      // getDataGetAverageTrinnerRevewModel(trainer_id);
      emit(HomeHelthDeleteReivewSeccessfluy());
    }).catchError((onError) {
      emit(HomeHelthDeleteReivewError());
    });
  }

  GetRatingIDModel? getRatingModel;
  void getRatingID({
    required int Helth_id,
    // required int rating_id,
    required int Profile_id,
  }) {
    emit(HomeHelthRatingIDLoading());
    print(Profile_id.toString() + rating.toString());
    FormData formData = FormData.fromMap({
      "health_id": Helth_id,
      "profile_id": Profile_id,
    });
    DioHelper.postData("getRatingIDByUserHealth",
            data: formData, token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      getRatingModel = GetRatingIDModel.fromJson(value.data);
      print(getRatingModel!.id == null
          ? "0"
          : getRatingModel!.id.toString() +
              "objectffffffffffffffffffdfdfdfdfdfdfdffffff");
      emit(HomeHelthRatingIDSeccessfluy());
    }).catchError((onError) {
      emit(HomeHelthRatingIDError());
    });
  }

  /////////////////////////////////real time rievew
  void configurePusher1({required int Helth_id}) async {
    PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();
    // pusher.connectionState.
    try {
      // app_id = "1793069" key = "e5d6ede1b86a447371cc" secret = "46834166895d119dc392" cluster = "eu"
      await pusher.init(
        apiKey: "e5d6ede1b86a447371cc",
        cluster: "eu",
        useTLS: true,

        onConnectionStateChange: onConnectionStateChange,
        onError: onError,
        onSubscriptionSucceeded: onSubscriptionSucceeded,
        onEvent: (event) {
          print(
              "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL");
          //////////////////////////////////////////////////
          getRatingID(
              Helth_id: Helth_id,
              Profile_id: CachShpreafapp.getdata(key: "tokenProfile"));
          getDataGetAverageRevewModel(Helth_id);
          print(
              "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL");

          print("onEventerererer: ${event.data}" +
              "BookingBookingBookingBookingBookingBooking");
          final data = json.decode(event.data);
          print("BookingBookingBookingBookingonEventerererer:: $event");

          if (data["message"] != null) {
            print("BookingBookingBookingBooking: ${data["message"]}" +
                "((((((((((BookingBookingBookingBooking:onEventerererer:onEventerererer:))))))))))");
            // LocalNotifations.simpleLocalNotifation(
            //     title: "Add Trinner",
            //     body: data["message"].toString(),
            //     payload: "payload");
          }

          emit(MainScreenConfigPusheBookingEvent1());
        },
        onSubscriptionError: onSubscriptionError,
        onDecryptionFailure: onDecryptionFailure,
        onMemberAdded: onMemberAdded,
        onMemberRemoved: onMemberRemoved,
        // onConnectionStateChange: onConnectionStateChange,
        // onError: onError,
        // onSubscriptionSucceeded: onSubscriptionSucceeded,
        // onEvent: onEvent,
        // onSubscriptionError: onSubscriptionError,
        // onDecryptionFailure: onDecryptionFailure,
        // onMemberAdded: onMemberAdded,
        // onMemberRemoved: onMemberRemoved,
        // authEndpoint: "<Your Authendpoint>",
        // onAuthorizer: onAuthorizer1,
      );
      await pusher.subscribe(channelName: "HRating", onEvent: onEvent112);
// await pusher.trigger(onEvent: onEvent1);
      emit(MainScreenConfigPusheBooking1());
      // await pusher.onev
      await pusher.connect();
    } catch (e) {
      print("ERROR: $e" + e.toString());
    }
  }

  void onEvent112(dynamic event) {
    print("BookingBookingBookingBookingonEvent: $event");
    // print("onEvent: $event["data"]["message"].toString());
    // final data = json.decode(event.data);
    // if (data["message"] != null) {
    //   print("onEventerererer: ${data["message"]}" +
    //       "((((((((((9999999999999999999999999999999))))))))))");
    //   LocalNotifations.simpleLocalNotifation(
    //       title: "Add Trinner",
    //       body: data["message"].toString(),
    //       payload: "payload");
    // }
    // LocalNotifations.simpleLocalNotifation(
    //     title: "Add Trinner", body: "sssssssssssssss", payload: "payload");
    emit(MainScreenConfigPusheBookingEvent1());
  }
}
