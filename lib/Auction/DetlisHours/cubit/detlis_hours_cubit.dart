import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:thi/Auction/AuctionCalender/ActionCalunder.dart';
import 'package:thi/Auction/DetlisHours/model/DetailsAuctionByID.dart';
import 'package:thi/Auction/DetlisHours/model/RemoveFavoriteModel.dart';
import 'package:thi/Auction/DetlisHours/model/addFavoriteModel.dart';
import 'package:thi/Auction/DetlisHours/model/getTimeAuctions.dart';
import 'package:thi/Auction/DetlisHours/model/postcurrentBid.dart';
import 'package:thi/Auction/FaviorteSceen/model/getFavoritemodel.dart';
import 'package:thi/NetWork/dioHelper.dart';
import 'package:thi/sharePreferinces/shardprefericences.dart';

part 'detlis_hours_state.dart';

class DetlisHoursCubit extends Cubit<DetlisHoursState> {
  DetlisHoursCubit() : super(DetlisHoursInitial());
  static DetlisHoursCubit getObject(context) => BlocProvider.of(context);
  bool favorate = false;
  void chaingBooleanFav() {
    this.favorate = !this.favorate;
    emit(DetlisHoursChaingBooleanFav());
  }

  int currentIndex = 0;
  void chaingIndexImageAppBar(int index) {
    this.currentIndex = index;
    emit(DetlisHoursChaingIndexImageAppBar());
  }

  DetailsActionsID? detailsActionsID;
  void getDeaitlsActions(int IDAction) {
    emit(DetlisHoursLoading());
    DioHelper.getDataClub(
            endpoint: "showAuctionByID/${IDAction}",
            token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      detailsActionsID = DetailsActionsID.fromJson(value.data);

      emit(DetlisHoursSceccfuly());
    }).catchError((onError) {
      emit(DetlisHoursError());
    });
  }

  GetTimeActionModel? getTimeActionModel;
  void GetTimeActionModelUpComing({required int idAuctions}) {
    emit(FilterScreenTimeUpComingLoading());

    DioHelper.getDataClub(
            endpoint: "OperationTime/${idAuctions}",
            token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      print(
          "mohammd mohammed Mohammed ***************************** mohammed mohammed mohammed");
      getTimeActionModel = GetTimeActionModel.fromJson(value.data);
      emit(FilterScreenTimeUpComingSceccfuly());
    }).catchError((onError) {
      emit(FilterScreenTimeUpComingError());
    });
  }

  //  bool bookingOk = false;
  // void bookingCours(bool isBooking) {
  //   this.bookingOk = isBooking;
  //   emit(CoursBookingCoursBooking());
  // }

  String currentPayment = "";

  Map<String, dynamic>? paymentIntet;
  void makePayment(int Price, int Id_Actions) async {
    try {
      int amount = Price.toInt();
      paymentIntet = await creatPaymentIntent(amount);
      var gpay = const PaymentSheetGooglePay(
          merchantCountryCode: "US", currencyCode: "US", testEnv: true);
      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntet!["client_secret"],
        style: ThemeMode.dark,
        merchantDisplayName: "mohammed",
        googlePay: gpay,
      ));

      displayPaymentSheet(amount, Id_Actions);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  void displayPaymentSheet(int price, int Actions_Id) async {
    try {
      print("11111111111111111111111111111111111111111111111");
      await Stripe.instance.presentPaymentSheet();
      print(
          "11eeeeeeeeeeeeeeeeeee11111111111111111111111dddddddddddddddddddddddd1111111111111111111111");
      postAddInsurance(insurance: price, Auction_id: Actions_Id);
      emit(FilterScreenTimeUpComingPayMentSceccfuly(
          detailsActionsID: detailsActionsID!));

      print("Done");
    } catch (e) {
      emit(FilterScreenTimeUpComingPayMentError());

      print("faild");
    }
  }

  creatPaymentIntent(int Price) async {
    try {
      print("*******************************************" + Price.toString());
      Map<String, dynamic> body = {
        "amount": "${Price}", //Price.toString(),
        //  amount.toString(),
        "currency": "USD"
      };
      http.Response response = await http.post(
          Uri.parse("https://api.stripe.com/v1/payment_intents"),
          body: body,
          headers: {
            "Authorization":
                "Bearer sk_test_51OpWWDCxQy2AfPxbwTOLYLIlzBFtG8CPvJTJBXmTWPmuiF0nR3pK3xDULZA8JkxUzRaSw78JNKflJPVqg8a5MHh600liN8NUqG",
            "Content-Type": "application/x-www-form-urlencoded"
          });
      print("***************************************");
      return json.decode(response.body);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /////////////////////favorate

  AddFavoriteModel? addFavoriteModel;
  void postFavoratie({required int idActions, required int idUser}) {
    emit(DetlisHoursFavoiteAddLoading());
    DioHelper.postData("addAuctionToFavorites",
            data: {"user_id": idUser, "auction_id": idActions},
            token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      addFavoriteModel = AddFavoriteModel.fromJson(value.data);
      // chaingFavorite(true);
      CachShpreafapp.sevedata(
          key:
              "boolfavoratieActions${CachShpreafapp.getdata(key: "UserID")}${idActions}",
          value: true);
      print("objectfffffffffffffffffffffff");
      emit(DetlisHoursFavoiteAddSceccfuly());
    }).catchError((onError) {
      emit(DetlisHoursFavoiteAddError());
    });
  }

  RemoveFavoriteModel? removeFavoriteModel;

  void postRemoveFavoratie(
      {required int idActions,
      required int idUser,
      required BuildContext context}) {
    emit(DetlisHoursFavoiteRemoveLoading());
    DioHelper.postData("removeAuctionFromFavorites",
            data: {"user_id": idUser, "auction_id": idActions},
            token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      removeFavoriteModel = RemoveFavoriteModel.fromJson(value.data);
      // chaingFavorite(false);
      CachShpreafapp.sevedata(
          key:
              "boolfavoratieActions${CachShpreafapp.getdata(key: "UserID")}${idActions}",
          value: false);

      print("objectfffffffffffffffffffffffrrrrrrrrrrrrrrrrrrrr");
      Navigator.pop(context);
      emit(DetlisHoursFavoiteRemoveSceccfuly());
    }).catchError((onError) {
      emit(DetlisHoursFavoiteRemoveError());
    });
  }

  GetFavoriteModel? getFavoriteModel;
  void getFavorite() {
    emit(DetlisHoursFavoiteLoading());

    DioHelper.getDataClub(
            endpoint:
                "getFavoriteAuctions/${CachShpreafapp.getdata(key: "UserID")}",
            token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      getFavoriteModel = GetFavoriteModel.fromJson(value.data);
      print(getFavoriteModel!.status.toString() +
          "*88888888888888888888888888888888888888888888888888888888");
      emit(DetlisHoursFavoiteSceccfuly());
    }).catchError((onError) {
      emit(DetlisHoursFavoiteError());
    });
  }

  PosttAddInsuranceModel? posttAddInsuranceModel;
  void postAddInsurance({required int insurance, required int Auction_id}) {
    emit(DetlisHoursPostAddInsuranceLoading());
    DioHelper.postData("addInsurance",
            data: {"insurance": insurance, "Auction_id": Auction_id},
            token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      posttAddInsuranceModel = PosttAddInsuranceModel.fromJson(value.data);

      print("objectfffffffffffffffffffffff");
      emit(DetlisHoursFavoitePostAddInsuranceSceccfuly());
    }).catchError((onError) {
      emit(DetlisHoursFavoitePostAddInsuranceError());
    });
  }
}
