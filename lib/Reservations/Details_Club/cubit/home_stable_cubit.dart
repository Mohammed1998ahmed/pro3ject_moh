import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
import 'package:thi/NetWork/dioHelper.dart';
import 'package:thi/Reservations/Details_Club/model/ClubIDmodel.dart';
import 'package:thi/Reservations/Details_Club/model/EvarageModel.dart';
import 'package:thi/Reservations/Details_Club/model/FavoratieModel.dart';
import 'package:thi/Reservations/Details_Club/model/GetServiceIDClubs.dart';
import 'package:thi/Reservations/Details_Club/model/IsResavtions.dart';
import 'package:thi/Reservations/Details_Club/model/RevewListModelGet.dart';
import 'package:thi/Reservations/Details_Club/model/SendRevew.dart';
import 'package:thi/Reservations/Details_Club/model/TraninerModel.dart';
import 'package:thi/Reservations/Details_Club/model/TrinerIdByClub.dart';
import 'package:thi/Reservations/Details_Club/model/deleteReviewClub.dart';
import 'package:thi/Reservations/Details_Club/model/getRatingIDMoel.dart';
import 'package:thi/Reservations/Details_Club/model/ratingModel.dart';
import 'package:thi/Reservations/Details_Club/model/removeFavoratiemodel.dart';
import 'package:thi/Reservations/Details_Club/model/reserviationReviewModel.dart';
import 'package:thi/Reservations/Details_Club/model/updataReview.dart';
import 'package:thi/mPusherConig/piusherConfig.dart';
import 'package:thi/sharePreferinces/shardprefericences.dart';

import '../../../component/conset/Const.dart';
import '../model/modelClubget.dart';

part 'home_stable_state.dart';

class HomeStableCubit extends Cubit<HomeStableState> {
  HomeStableCubit() : super(HomeStableInitial());
  static HomeStableCubit getObject(context) => BlocProvider.of(context);
  bool favorate = false;
  chaingFavorite(bool favoratie) {
    this.favorate = favoratie;
    emit(HomeStableChaingFavorite());
  }

  List<bool> isSelected = [
    true,
    false,
  ];

  int selectedButton = 0;

  void seclectPage(int index) {
    if (index == 1) {
      secrbool1 = false;
    } else {
      secrbool1 = true;
    }
    for (int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++) {
      isSelected[buttonIndex] = buttonIndex == index;
    }

    selectedButton = index;
    emit(HomeStableChaingPageService());
  }

  double rating = 0.0;
  void chaingStar(double valueStar) {
    rating = valueStar;
    emit(HomeStableValueStar());
  }

  GetServicClubModel? getServicClubModel;
  void getDataServic(int IdClub) {
    emit(BookingServicLoading());
    DioHelper.getDataClub(
            endpoint: "allServicesU/${IdClub}",
            token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      getServicClubModel = GetServicClubModel.fromJson(value.data);
      // print(listClubsmodel!.images.toString() +
      //     "LLLLLLLLLLLLLLLLLLLLLLKKKKKKKKKKKKKKKKKKKKKKKKK");
      // print(value.data.toString());

      emit(BookingServicSuccsfuly());
    }).catchError((onError) {
      // print("object");

      emit(BookingServicError());
    });
  }

  ClubIDModel? clubIDModel;
  ClubProfileGetModel? clubProfileGetModel;
  void getDataClubProfile(int id) {
    emit(HomeStableValueProfileLoading());
    DioHelper.getDataClub(
            endpoint: "getClubByID/${id}",
            token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      clubIDModel = ClubIDModel.fromJson(value.data);
      print(clubIDModel!.images.toString() +
          "LLLLLLLLLLLLLLLLLLLLLLKKKKKKKKKKKKKKKKKKKKKKKKK");
      print(value.data.toString());
      Fluttertoast.showToast(
          msg: "Ok",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      emit(HomeStableValueProfileSeccsfuly());
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
      emit(HomeStableValueProfileError());
    });
  }

  MyClubTrenerIDModel? myClubTrenerIDModel;
  TrinerProfileGetModel? trinerProfileGetModel;
  void getDataClubProfileTrainer(int Id) {
    emit(HomeStableValueProfileLoadingTrainer());
    DioHelper.getDataClub(
            endpoint: "GetTrainersByClub/${Id}",
            token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      myClubTrenerIDModel = MyClubTrenerIDModel.fromJson(value.data);
      print(myClubTrenerIDModel!.trainers!.length.toString() +
          "LLLLLLLLLLLLLLLLLLLLLLKKKKKKKKKKKKKKKKKKKKKKKKK");
      print(value.data.toString());
      Fluttertoast.showToast(
          msg: myClubTrenerIDModel!.message.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      emit(HomeStableValueProfileSeccsfulyTrainer());
    }).catchError((onError) {
      print("object");
      Fluttertoast.showToast(
          msg: myClubTrenerIDModel!.message.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      emit(HomeStableValueProfileErrorTrainer());
    });
  }

  //////////////////////////////////// real time
  void configurePusher({required int id_Club}) async {
    PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();
    // pusher.connectionState.
    try {
      // app_id = "1793069" key = "e5d6ede1b86a447371cc" secret = "46834166895d119dc392" cluster = "eu"
      await pusher.init(
        apiKey: "e5d6ede1b86a447371cc",
        cluster: "eu",
        useTLS: true,
        // authEndpoint: "https://192.168.109.241:8000/api/pusher/authenticate",
        // onEvent: (event) {
        //   print(event.data.toString());
        // },
        // onError: (String moh, int? id, dynamic inmess) {
        //   print(moh + id.toString() + inmess.toString());
        // },
        // authEndpoint: ,
        // authParams: ,
        // useTLS: true,
        onConnectionStateChange: onConnectionStateChange,
        onError: onError,
        onSubscriptionSucceeded: onSubscriptionSucceeded,
        onEvent: (event) {
          print(
              "100trainertrainertrainerLLLLLLLLLLLLLLLLLLLLLLLLLkjhkjhhLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL");
          getDataClubProfileTrainer(id_Club);
          print(
              "100trainertrainertrainerLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL");

          print("100onEventerererer: ${event.data}" +
              "((((((((((9999999999999999,,,,,,,,,,,999999999999999))))))))))");
          final data = json.decode(event.data);
          print("100onEventerererer: $event");

          if (data["message"] != null) {
            print("100onEventerererer: ${data["message"]}" +
                "((((((((((9999999999999ggggggggggggggggttttttt999999999999999999))))))))))");
            // LocalNotifations.simpleLocalNotifation(
            //     title: "Add Trinner",
            //     body: data["message"].toString(),
            //     payload: "payload");
          }

          emit(MainScreenConfigPusheTrinnerEvent());
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
      await pusher.subscribe(
          channelName: "trainer", onEvent: onEvent11(id_Club));
// await pusher.trigger(onEvent: onEvent1);
      emit(MainScreenConfigPusheTrinner());
      // await pusher.onev
      await pusher.connect();
    } catch (e) {
      print("ERROR: $e" + e.toString());
    }
  }

  Function onEvent11(int idClub) {
    return (dynamic event) {
      // قم بتنفيذ العمليات المطلوبة هنا باستخدام event و id
      getDataClubProfileTrainer(idClub);

      print(
          'Received event in customEventHandler with id: $idClub - ${event.toString()}');
    };
    // print("onEvent: $event");

    // print(
    //     "trainertrainertrainerLLLLLLLLLLLLLLLLLLLLLLLLLkjhkjhhLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL");
    // getDataClubProfileTrainer(idClub);
    // print(
    //     "trainertrainertrainerLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL");

    // print("onEventerererer: ${event.data}" +
    //     "((((((((((9999999999999999,,,,,,,,,,,999999999999999))))))))))");
    // final data = json.decode(event.data);
    // print("onEventerererer: $event");

    // if (data["message"] != null) {
    //   print("onEventerererer: ${data["message"]}" +
    //       "((((((((((9999999999999ggggggggggggggggttttttt999999999999999999))))))))))");
    //   // LocalNotifations.simpleLocalNotifation(
    //   //     title: "Add Trinner",
    //   //     body: data["message"].toString(),
    //   //     payload: "payload");
    // }

    // emit(MainScreenConfigPusheTrinnerEvent());
    // // print("onEvent: $event["data"]["message"].toString());
    // // final data = json.decode(event.data);
    // // if (data["message"] != null) {
    // //   print("onEventerererer: ${data["message"]}" +
    // //       "((((((((((9999999999999999999999999999999))))))))))");
    // //   LocalNotifations.simpleLocalNotifation(
    // //       title: "Add Trinner",
    // //       body: data["message"].toString(),
    // //       payload: "payload");
    // // }
    // // LocalNotifations.simpleLocalNotifation(
    // //     title: "Add Trinner", body: "sssssssssssssss", payload: "payload");
    // emit(MainScreenConfigPusheTrinnerEvent());
  }

  FavoratieModel? favoratieModel;
  void postFavoratie(int idClube, int idUser) {
    emit(HomeStableValueProfileFavoratieLoading());
    DioHelper.postData("addClubToFavorites",
            data: {"user_id": idUser, "club_id": idClube},
            token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      favoratieModel = FavoratieModel.fromJson(value.data);
      chaingFavorite(true);
      CachShpreafapp.sevedata(
          key:
              "boolfavoratie${CachShpreafapp.getdata(key: "UserID")}${idClube}",
          value: true);
      print("objectfffffffffffffffffffffff");
      emit(HomeStableValueProfileFavoratieSeccsfuly());
    }).catchError((onError) {
      emit(HomeStableValueProfileFavoratieError());
    });
  }

  RemovefavoratieModel? removefavoratieModel;

  void postRemoveFavoratie(int idClube, int idUser) {
    emit(HomeStableValueProfileRemoveFavoratieLoading());
    DioHelper.postData("removeClubFromFavorites",
            data: {"user_id": idUser, "club_id": idClube},
            token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      favoratieModel = FavoratieModel.fromJson(value.data);
      chaingFavorite(false);
      CachShpreafapp.sevedata(
          key:
              "boolfavoratie${CachShpreafapp.getdata(key: "UserID")}${idClube}",
          value: false);

      print("objectfffffffffffffffffffffffrrrrrrrrrrrrrrrrrrrr");
      emit(HomeStableValueProfileRemoveFavoratieSeccsfuly());
    }).catchError((onError) {
      emit(HomeStableValueProfileRemoveFavoratieError());
    });
  }

  // void initbool() {
  //   CachShpreafapp.sevedata(key: "boolfavoratie", value: false);
  //   emit(HomeStableInitBoolFavoratie());
  // }

  GetRevewListModel? getRevewListModel;
  void getDataClubGetRevewListModel(int IdClub) {
    emit(HomeStableValueProfileLoadingGetRevewListModel());
    DioHelper.getDataClub(
            endpoint: "getAllReviewsInClub/${IdClub}",
            token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      print(value.data.toString() +
          "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
      getRevewListModel = GetRevewListModel.fromJson(value.data);
      // CachShpreafapp.sevedata(key: "", value:getRevewListModel.reviews[0]. );

      print("IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIOOO");
      print(value.data.toString());
      Fluttertoast.showToast(
          msg: "Ok",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      emit(HomeStableValueProfileSeccsfulyGetRevewListModel());
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
      emit(HomeStableValueProfileErrorGetRevewListModel());
    });
  }

  DeleteReviewClub? deleteRating;
  void deleteRevewTrinner({
    required int Club_id,
    required int rating_id,
    required int idUser,
  }) {
    emit(HomeStableDeleteRviewClubLoading());
    print(rating_id.toString() + idUser.toString() + rating.toString());
    FormData formData = FormData.fromMap({
      "rating_id": rating_id,
      "user_id": idUser,
    });
    DioHelper.postData("deleteClubRating",
            data: formData, token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      deleteRating = DeleteReviewClub.fromJson(value.data);
      // // chaingFavorite(true);
      // // CachShpreafapp.putbool(key: "boolfavoratie", value: false);

      print("objectffffffffffffffffffdfdfdfdfdfdfdffffff");
      getDataClubGetRevewListModel(Club_id);
      getDataGetAverageRevewModel(Club_id);
      getRatingID(
          club_id: Club_id, user_id: CachShpreafapp.getdata(key: "UserID"));
      // getDataTrinnerGetRevewListModel(trainer_id);
      // getDataGetAverageTrinnerRevewModel(trainer_id);
      emit(HomeStableDeleteRviewClubSeccsfuly());
    }).catchError((onError) {
      emit(HomeStableDeleteRviewClubError());
    });
  }

  ReviewInClubReviewClub? userHasReviewInClub;
  void userHasReviewInTrainerTrinner({
    required int Club_id,
    required int idUser,
  }) {
    emit(HomeStableReservationRviewClubLoading());
    print(Club_id.toString() + idUser.toString());
    FormData formData = FormData.fromMap({
      "club_id": Club_id,
      "user_id": idUser,
    });
    DioHelper.postData("userHasReviewInClub",
            data: formData, token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      userHasReviewInClub = ReviewInClubReviewClub.fromJson(value.data);
      // // chaingFavorite(true);
      // CachShpreafapp.putbool(key: "boolfavoratie", value: false);

      print("objectffffffffffffffffffdfdfdfdfdfdfdffffff");
      getDataClubGetRevewListModel(Club_id);
      getDataGetAverageRevewModel(Club_id);
      // getDataTrinnerGetRevewListModel(trainer_id);
      // getDataGetAverageTrinnerRevewModel(trainer_id);
      emit(HomeStableReservationRviewClubSeccsfuly());
    }).catchError((onError) {
      emit(HomeStableReservationRviewClubError());
    });
  }

  GetFavorateRatingModel? getFavorateRatingModel;
  void getDataClubGetGetFavorateRatingModel(int IdClub) {
    emit(HomeStableValueRatingLoading());
    DioHelper.getDataClub(
            endpoint: "allAverageClubRating/${IdClub}",
            token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      getFavorateRatingModel = GetFavorateRatingModel.fromJson(value.data);

      // print(value.data.toString());
      Fluttertoast.showToast(
          msg: "Ok",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      emit(HomeStableValueRatingSueccsfuly());
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
      emit(HomeStableValueRatingError());
    });
  }

  TextEditingController controllerSend = TextEditingController();

  PostSendRevewModel? postSendRevewModel;
  void postGetSendRevewModel(
      {required int idClube,
      required int idUser,
      int? rating,
      String? review}) {
    emit(HomeStableValueSendRevewLoading());
    print(idClube.toString() +
        idUser.toString() +
        rating.toString() +
        review.toString() +
        "UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU");

    FormData formData = FormData.fromMap({
      "club_id": idClube,
      "user_id": idUser,
      "rating": rating,
      "review": review.toString()
    });
    DioHelper.postData("createClubRating",
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
          Club_id: idClube, idUser: CachShpreafapp.getdata(key: "UserID"));
      print("objectffffffffffffffffffdfdfdfdfdfdfdffffff");
      getDataClubGetRevewListModel(idClube);
      getDataGetAverageRevewModel(idClube);
      emit(HomeStableValueSendRevewSueccsfuly());
    }).catchError((onError) {
      print(onError.toString() + "7777777777777777777777777777777");
      emit(HomeStableValueSendRevewError());
    });
  }

  UpdataClubReviewClub? updataClubReviewClub;
  void updataReviewSendRevewClub(
      {required int Club_id,
      required int rating_id,
      required int idUser,
      int? rating,
      String? review}) {
    emit(HomeStableUpdataRviewClubLoading());
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
    DioHelper.postData("updateClubRating",
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
      getDataClubGetRevewListModel(Club_id);
      getDataGetAverageRevewModel(Club_id);
      getRatingID(
          club_id: Club_id, user_id: CachShpreafapp.getdata(key: "UserID"));
      // getDataTrinnerGetRevewListModel(trainer_id);
      // getDataGetAverageTrinnerRevewModel(trainer_id);
      emit(HomeStableUpdataRviewClubSeccsfuly());
    }).catchError((onError) {
      emit(HomeStableUpdataRviewClubError());
    });
  }

  GetAverageRevewModel? getAverageRevewModel;
  void getDataGetAverageRevewModel(int IdClub) {
    emit(Home1EverageClubLoading());
    DioHelper.getDataClub(
            endpoint: "allAverageClubRating/${IdClub}",
            token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      getAverageRevewModel = GetAverageRevewModel.fromJson(value.data);

      emit(Home1EverageClubSueccsufuly());
    }).catchError((onError) {
      print("object" + onError.toString());

      emit(Home1EverageClubError());
    });
  }

///////////////
  IsReservitionModel? isReservitionModel;
  void postIsReservation({required int Club_Id, required int User_Id}) {
    emit(BookingServicISRaserationLoading());
    FormData formData = FormData.fromMap({"club": Club_Id, "user_id": User_Id});
    DioHelper.postData("isReserved",
            data: formData, token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      isReservitionModel = IsReservitionModel.fromJson(value.data);
      emit(BookingServicISRaserationSuccsfuly());
    }).catchError((onError) {
      emit(BookingServicISRaserationError());
    });
  }

  GetRatingIDModel? getRatingModel;
  void getRatingID({
    required int club_id,
    // required int rating_id,
    required int user_id,
  }) {
    emit(HomeStableRatingIDLoading());
    print(user_id.toString() + rating.toString());
    FormData formData = FormData.fromMap({
      "club_id": club_id,
      "user_id": user_id,
    });
    DioHelper.postData("getRatingIDByUserClub",
            data: formData, token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      getRatingModel = GetRatingIDModel.fromJson(value.data);
      print(getRatingModel!.id == null
          ? "0"
          : getRatingModel!.id.toString() +
              "objectffffffffffffffffffdfdfdfdfdfdfdffffff");
      print("88888888888888888888888888888888888888888888888");
      emit(HomeStableRatingIDSeccsfuly());
    }).catchError((onError) {
      emit(HomeStableRatingIDError());
    });
  }

  /////////////////////////////////real time rievew
  void configurePusher1({required int Club_id}) async {
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
              club_id: Club_id, user_id: CachShpreafapp.getdata(key: "UserID"));
          getDataGetAverageRevewModel(Club_id);
          getDataClubGetRevewListModel(Club_id);

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
      await pusher.subscribe(channelName: "CRating", onEvent: onEvent112);
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

  void configurePusher11({required int Club_id}) async {
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
              club_id: Club_id, user_id: CachShpreafapp.getdata(key: "UserID"));
          getDataGetAverageRevewModel(Club_id);
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

          emit(MainScreenConfigPusheBookingEvent11());
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
      await pusher.subscribe(channelName: "CRating", onEvent: onEvent112);
// await pusher.trigger(onEvent: onEvent1);
      emit(MainScreenConfigPusheBooking11());
      // await pusher.onev
      await pusher.connect();
    } catch (e) {
      print("ERROR: $e" + e.toString());
    }
  }

  void onEvent1122(dynamic event) {
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
    emit(MainScreenConfigPusheBookingEvent11());
  }
}
