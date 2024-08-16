import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
import 'package:thi/NetWork/dioHelper.dart';
import 'package:thi/Reservations/Home_Club/model/CategoriesModel.dart';
import 'package:thi/Reservations/Home_Club/model/SearchModel.dart';
import 'package:thi/Reservations/Home_Club/model/listClubModel.dart';
import 'package:thi/Reservations/Home_Club/model/offersClubsmodels.dart';
import 'package:thi/mPusherConig/piusherConfig.dart';
import 'package:thi/sharePreferinces/shardprefericences.dart';

part 'home1_state.dart';

class Home1Cubit extends Cubit<Home1State> {
  Home1Cubit() : super(Home1Initial());

  static Home1Cubit getObject(context) => BlocProvider.of(context);
  ListClubModel? listClubsmodel;
  TextEditingController SeachController = TextEditingController();
  void getDataClubList() {
    emit(Home1ListClubLoading());
    DioHelper.getDataClub(
            endpoint: "showAllClubs",
            token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      // print(value.data.toString() +
      //     "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO    OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO");
      listClubsmodel = ListClubModel.fromJson(value.data);
      // print(listClubsmodel!.images.toString() +
      //     "LLLLLLLLLLLLLLLLLLLLLLKKKKKKKKKKKKKKKKKKKKKKKKK");
      // for (var i = 0; i < listClubsmodel!.data!.length; i++) {

      //   CachShpreafapp.getdata(
      //           key:
      //               "boolfavoratie${CachShpreafapp.getdata(key: "UserID")}${listClubsmodel!.data![i].id}") ??
      //       CachShpreafapp.sevedata(
      //           key:
      //               "boolfavoratie${CachShpreafapp.getdata(key: "UserID")}${listClubsmodel!.data![i].id}",
      //           value: false);
      // }

      // print(value.data.toString());
      Fluttertoast.showToast(
          msg: "Ok",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      emit(Home1ListClubSueccsufuly());
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
      emit(Home1ListClubError());
    });
  }

  bool istoggel = true;
  void chaingBooleanSearch({required bool isChaing}) {
    this.istoggel = isChaing;
    emit(Home1ListClubBooleanSearch());
  }

  GetSearchModel? getSearchModel;
  void getDataSearch(String? search) {
    emit(Home1SearchClubLoading());
    DioHelper.getDataClub(
            endpoint: "searchClubByName/${search ?? 0}",
            token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      getSearchModel = GetSearchModel.fromJson(value.data);
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
      emit(Home1SearchClubSueccsufuly());
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
      emit(Home1SearchClubError());
    });
  }

  bool isLoad = false;
  void chaingLoading(bool Loading) {
    this.isLoad = Loading;
    emit(Home1ChaingLoading());
  }

  bool about = true;
  void chaingBoolean(bool aboutPage) {
    this.about = aboutPage;
    emit(Home1ChaingBoolean());
  }

  void postSearch({required String Search}) {
    emit(Home1LoadingSearch());
    DioHelper.postData("Search", data: {"searchStable": Search}).then((value) {
      print("Sececcfully Search");
      emit(Home1SceccfullySearch());
    }).catchError((onError) {
      print("Error Search");
      emit(Home1ErrorSearch());
    });
  }

  List category = [
    {
      "image": "assets/images/paralympic equestrian-amico.png",
      "text": "Ability &",
    },
    {
      "image": "assets/images/paralympic equestrian-cuate.png",
      "text": "Flat race"
    },
    // {"image": "assets/images/img_12.png", "text": "Show horse"},
    // {"image": "assets/images/img_13.png", "text": "Pony"},
    {
      "image": "assets/images/horse jumping-bro.png",
      "text": "Race",
    },
  ];
  bool shimmer = false;
  void chaingshimmer() {}

  CategoriesModel? gategoriesModel;
  void getDateGaregories() {
    emit(HomeCategoriesClubLoading());
    DioHelper.getDataClub(
            endpoint: "allCategoryU",
            token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      gategoriesModel = CategoriesModel.fromJson(value.data);

      emit(HomeCategoriesClubSueccsufuly());
    }).catchError((onError) {
      emit(HomeCategoriesClubError());
    });
  }

  void configurePusher() async {
    PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();
    // pusher.connectionState.
    try {
      // app_id = "1793069" key = "e5d6ede1b86a447371cc" secret = "46834166895d119dc392" cluster = "eu"
      await pusher.init(
        apiKey: "e5d6ede1b86a447371cc",
        cluster: "eu",
        useTLS: true,
        // authEndpoint: "https://192.168.109.241:8000/api/pusher/authenticate",
        onEvent: (event) {
          print(event.data.toString());
          getDataClubList();
          emit(HomeCategoriesClubSueccsufulyPusher());
          // chatCubit.pusherMessage.add(event.data);
        },
        // onError: (String moh, int? id, dynamic inmess) {
        //   print(moh + id.toString() + inmess.toString());
        // },
        // authEndpoint: ,
        // authParams: ,
        // useTLS: true,
        onConnectionStateChange: onConnectionStateChange,
        onError: onError,
        onSubscriptionSucceeded: onSubscriptionSucceeded,
        // onEvent: onEvent,
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
      await pusher.subscribe(channelName: "club", onEvent: onEvent1);
// await pusher.trigger(onEvent: onEvent1);

      // await pusher.onev
      await pusher.connect();
    } catch (e) {
      print("ERROR: $e" + e.toString());
    }
  }

  AlloffersClubsModel? alloffersModel;
  void getHomeHelthOffers() {
    emit(HomeOffersClubLoading());
    DioHelper.getDataClub(
            endpoint: "getOffersClubToday",
            token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      alloffersModel = AlloffersClubsModel.fromJson(value.data);
      // print(alloffersModel!.offers![0].toString() +
      //     "7777777777777777777777777777777777777");
      emit(HomeOffersClubSueccsufuly());
    }).catchError((onError) {
      emit(HomeOffersClubError());
    });
  }
}
