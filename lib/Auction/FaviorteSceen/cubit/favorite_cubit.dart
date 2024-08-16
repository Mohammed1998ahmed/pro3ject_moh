import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
import 'package:thi/Auction/FaviorteSceen/model/getFavoritemodel.dart';
import 'package:thi/NetWork/dioHelper.dart';
import 'package:thi/mPusherConig/piusherConfig.dart';
import 'package:thi/sharePreferinces/shardprefericences.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());
  static FavoriteCubit getObject(context) => BlocProvider.of(context);
  GetFavoriteModel? getFavoriteModel;
  void getFavorite() {
    emit(FavoriteLoading());

    DioHelper.getDataClub(
            endpoint:
                "getFavoriteAuctions/${CachShpreafapp.getdata(key: "UserID")}",
            token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      getFavoriteModel = GetFavoriteModel.fromJson(value.data);
      emit(FavoriteSceccsufly());
    }).catchError((onError) {
      emit(FavoriteError());
    });
  }

  void configurePusher1() async {
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

          // getCurentBid(ID_Acutions: ID_Acutions);
          // getBuyerList(ID_Acutions: ID_Acutions);
          print(
              "LLLLLLddddddddddddddddddddLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL");
          getFavorite();
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
      await pusher.subscribe(
          channelName: "favoriteAuction", onEvent: onEvent112);
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
