import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
import 'package:thi/Auction/AuctionShare/model/AddBideModel.dart';
import 'package:thi/Auction/AuctionShare/model/getBuyerListModel.dart';
import 'package:thi/Auction/AuctionShare/model/getCurentBidModel.dart';
import 'package:thi/NetWork/dioHelper.dart';
import 'package:thi/localNotifation.dart';
import 'package:thi/mPusherConig/piusherConfig.dart';
import 'package:thi/sharePreferinces/shardprefericences.dart';

part 'actions_share_state.dart';

class ActionsShareCubit extends Cubit<ActionsShareState> {
  ActionsShareCubit() : super(ActionsShareInitial());

  static ActionsShareCubit getObject(context) => BlocProvider.of(context);
  AddBidModel? addBidModel;
  void postAddBid({required int Id_Auctions, required int amountAuctions}) {
    FormData formData = FormData.fromMap({"offeredPrice": amountAuctions});
    emit(ActionsShareAddBidLoading());
    DioHelper.postData("AddBid/${Id_Auctions}",
            data: formData, token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      addBidModel = AddBidModel.fromJson(value.data);
      if (addBidModel!.status == true) {
        getCurentBid(ID_Acutions: Id_Auctions);
      }
      Fluttertoast.showToast(
          msg: addBidModel!.message.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 15,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      emit(ActionsShareAddBidSeccesfuly());
    }).catchError((onError) {
      emit(ActionsShareAddBidErorr());
    });
  }

  GetCurrntBidModel? getCurrntBidModel;
  void getCurentBid({required int ID_Acutions}) {
    emit(ActionsShareGetCurentBidLoading());
    DioHelper.getDataClub(
            endpoint: "getCurrentBid/${ID_Acutions}",
            token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      getCurrntBidModel = GetCurrntBidModel.fromJson(value.data);
      emit(ActionsShareGetCurentBidSeccesfuly());
    }).catchError((onError) {
      emit(ActionsShareGetCurentBidErorr());
    });
  }

  GetBuyerListModel? getBuyerListModel;
  void getBuyerList({required int ID_Acutions}) {
    emit(ActionsShareGetBuyerLoading());
    DioHelper.getDataClub(
            endpoint: "getBuyersIN_Auction/${ID_Acutions}",
            token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      getBuyerListModel = GetBuyerListModel.fromJson(value.data);
      emit(ActionsShareGetBuyerSeccesfuly());
    }).catchError((onError) {
      emit(ActionsShareGetBuyerErorr());
    });
  }

  void configurePusher1({required int ID_Acutions}) async {
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
          // getRatingID(
          //     Helth_id: Helth_id,
          //     Profile_id: CachShpreafapp.getdata(key: "tokenProfile"));
          // getDataGetAverageRevewModel(Helth_id);

          getCurentBid(ID_Acutions: ID_Acutions);
          getBuyerList(ID_Acutions: ID_Acutions);
          print(
              "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL");

          print("onEventerererer: ${event.data}" +
              "BookingBookingBookingBookingBookingBooking");
          final data = json.decode(event.data);
          print("BookingBookingBookingBookingonEventerererer:: $event");

          if (data["message"] != null) {
            print("BookingBookingBookingBooking: ${data["message"]}" +
                "((((((((((BookingBookingBookingBooking:onEventerererer:onEventerererer:))))))))))");
            LocalNotifations.simpleLocalNotifation(
                title: "Add Bid",
                body: data["message"].toString(),
                payload: "payload");
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
      await pusher.subscribe(channelName: "bid", onEvent: onEvent112);
// await pusher.trigger(onEvent: onEvent1);
      emit(MainScreenConfigPusheBooking1());
      // await pusher.onev
      await pusher.connect();
    } catch (e) {
      print("ERROR: $e" + e.toString());
    }
  }

  Function onEvent112(int Id_Auction) {
    return (dynamic event) {
      getCurentBid(ID_Acutions: Id_Auction);
      getBuyerList(ID_Acutions: Id_Auction);
      // قم بتنفيذ العمليات المطلوبة هنا باستخدام event و id
      print(
          'Received event in customEventHandler with id: $Id_Auction - ${event.toString()}');
    };

    // print("BookingBookingBookingBookingonEvent: $event");
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
    // emit(MainScreenConfigPusheBookingEvent1());
  }
}
