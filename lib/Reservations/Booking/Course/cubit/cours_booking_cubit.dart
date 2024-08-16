import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

import 'package:thi/NetWork/dioHelper.dart';
import 'package:thi/Reservations/Booking/modell/CoursBooking.dart';
import 'package:thi/Reservations/Booking/modell/DatailsClassmodel.dart';
import 'package:thi/Reservations/Booking/modell/getCoursdata.dart';
import 'package:thi/Reservations/Home/main_screen.dart';
import 'package:thi/sharePreferinces/shardprefericences.dart';

import '../../../../mPusherConig/piusherConfig.dart';

part 'cours_booking_state.dart';

class CoursBookingCubit extends Cubit<CoursBookingState> {
  CoursBookingCubit() : super(CoursBookingInitial());
  static CoursBookingCubit getObject(context) => BlocProvider.of(context);

  GetCourceModel? getCourceModel;
  void postCoursDataAddBookingModel(
      {required int club_ID,
      required int service_id,
      required int trainer_id}) {
    emit(CoursBookingLoading());
    FormData formData = FormData.fromMap({
      "club_id": club_ID,
      "trainer_id": trainer_id,
      "service_id": service_id,
    });
    DioHelper.postData("getCoursesByUser",
            data: formData, token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      getCourceModel = GetCourceModel.fromJson(value.data);
      print("Okokoko corus 9090000000000000000000000");
      emit(CoursBookingSueccfuly());
    }).catchError((onError) {
      print(onError.toString() + "kokokokokkokokokokokokokk");

      emit(CoursBookingError());
    });
  }

  DetailsClassModel? detailsClassModel;
  void getDatailsClassTime({
    required int cours_Id,
  }) {
    emit(CoursBookingClassLoading());

    DioHelper.getDataClub(
            endpoint: "getCourseClasses/${cours_Id}",
            token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      detailsClassModel = DetailsClassModel.fromJson(value.data);
      print("Class classs  ******************** 9090000000000000000000000");
      emit(CoursBookingClassSueccfuly());
    }).catchError((onError) {
      // print("object");

      emit(CoursBookingClassError());
    });
  }

  CoursBooking? coursBooking;
  void postCoursBookingAddBookingModel(
      {required BuildContext context,
      required String clasName,
      required int course_id,
      required int number_of_people}) {
    emit(CoursBookingCoursBookingLoading());
    FormData formData = FormData.fromMap({
      "clas": clasName,
      "course_id": course_id,
      "number_of_people": number_of_people,
    });
    print(clasName + course_id.toString() + number_of_people.toString());
    DioHelper.postData("reserve",
            data: formData, token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      // coursBooking = CoursBooking.fromJson(value.data);
      print(
          "1000000000000000000000000------------------------=================== corus 9090000000000000000000000");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => MainScreen(),
        ),
      );
      emit(CoursBookingCoursBookingSueccfuly());
    }).catchError((onError) {
      print(onError.toString());

      emit(CoursBookingCoursBookingError());
    });
  }

  bool bookingOk = false;
  void bookingCours(bool isBooking) {
    this.bookingOk = isBooking;
    emit(CoursBookingCoursBooking());
  }

  String currentPayment = "";

  Map<String, dynamic>? paymentIntet;
  void makePayment(int Price,
      {required BuildContext context,
      required String clasName,
      required int course_id,
      required int number_of_people}) async {
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

      displayPaymentSheet(
          context: context,
          clasName: clasName,
          course_id: course_id,
          number_of_people: number_of_people);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  void displayPaymentSheet(
      {required BuildContext context,
      required String clasName,
      required int course_id,
      required int number_of_people}) async {
    try {
      print("11111111111111111111111111111111111111111111111");
      await Stripe.instance.presentPaymentSheet();
      print(
          "11eeeeeeeeeeeeeeeeeee11111111111111111111111dddddddddddddddddddddddd1111111111111111111111");

      postCoursBookingAddBookingModel(
          context: context,
          clasName: clasName,
          course_id: course_id,
          number_of_people: number_of_people);
      emit(CoursBookingCoursBookingPymentOk());

      print("Done");
    } catch (e) {
      emit(CoursBookingCoursBookingPymentError());

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

////////////////////real time
  void configurePusher({required int cours_Id}) async {
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
              "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL");

          /////////////////edit
          getDatailsClassTime(cours_Id: cours_Id);
          print(
              "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL");

          print("onEventerererer: ${event.data}" +
              "((((((((((BookingBookingBookingBookingonEventerererer,,,,,,,,,,,999999999999999))))))))))");
          final data = json.decode(event.data);
          print("BookingBookingBookingBookingonEventerererer: $event");

          if (data["message"] != null) {
            print("BookingBookingBookingBookingonEventerererer: ${data["message"]}" +
                "((((((((((BookingBookingBookingBookingonEventerererer))))))))))");
            // LocalNotifations.simpleLocalNotifation(
            //     title: "Add Trinner",
            //     body: data["message"].toString(),
            //     payload: "payload");
          }

          emit(MainScreenConfigPusheBookingEvent());
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
      await pusher.subscribe(channelName: "reservation", onEvent: onEvent11);
// await pusher.trigger(onEvent: onEvent1);
      emit(MainScreenConfigPusheBooking());
      // await pusher.onev
      await pusher.connect();
    } catch (e) {
      print("ERROR: $e" + e.toString());
    }
  }

  void onEvent11(dynamic event) {
    print("onEvent: $event");
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
    emit(MainScreenConfigPusheBookingEvent());
  }

  void configurePusher1({required int cours_Id}) async {
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
              "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL");
          //////////////////////////////////////////////////

          getDatailsClassTime(cours_Id: cours_Id);
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
      await pusher.subscribe(channelName: "class", onEvent: onEvent112);
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
