import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
import 'package:thi/NetWork/dioHelper.dart';
import 'package:thi/Reservations/Booking/modell/ListTimeAvilbltity.dart';
import 'package:thi/Reservations/Booking/modell/addBooking.dart';
import 'package:thi/Reservations/Booking/modell/getServiceModel.dart';
import 'package:thi/Reservations/Booking/modell/getTrinnerModel.dart';
import 'package:thi/Reservations/Home/main_screen.dart';
import 'package:thi/mPusherConig/piusherConfig.dart';
import 'package:thi/sharePreferinces/shardprefericences.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit() : super(BookingInitial());
  static BookingCubit getObject(context) => BlocProvider.of(context);

  bool isseccsfluy = false;
  void changBoolean(bool isBoolean) {
    this.isseccsfluy = isBoolean;
    if (this.isseccsfluy) {
      emit(BookingBookingPaymentOk());
    } else {
      emit(BookingBookingPaymentError());
    }
  }

  int price = 0;
  void addListInt(List<int> amount1) {
    int price1 = 0;
    for (var i = 0; i < amount1.length; i++) {
      price1 += amount1[i];
    }
    this.price = price1;
    emit(BookingBookingPrice());
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

  bool? isclick;
  List<bool> checkedItems = []; // قائمة لتخزين حالة التحديد لكل عنصر
  void chaingcheckedItems(bool? value, int index, int IdServicClub) {
    if (value != null && value) {
      // إلغاء التحديد لجميع العناصر في القائمة
      for (int i = 0; i < checkedItems.length; i++) {
        if (i != index) {
          checkedItems[i] = false;
        }
      }
      // تحديث حالة التحديد للعنصر المحدد
      checkedItems[index] = true;
      emit(BookingServicChickBox());
      isclick = true;
      getIDServic(IdServicClub); //////////////////
    } else {
      isclick = false;

      // إلغاء تحديد العنصر إذا تم إلغاء تحديد الـ checkBox
      checkedItems[index] = false;
      emit(BookingServicChickBox());
    }
  }

  int? idServic;
  void getIDServic(int IdServicClub) {
    this.idServic = IdServicClub;
    emit(BookingServicID());
  }

  GetTrinnerClubModel? getTrinnerClubModel;
  void getDataTrinner(int IdServic) {
    emit(BookingTrinnerLoading());
    DioHelper.getDataClub(
            endpoint: "allTrainersInServiceUserBooking/${IdServic}",
            token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      getTrinnerClubModel = GetTrinnerClubModel.fromJson(value.data);
      print(getTrinnerClubModel!.trainers![0].toString() +
          "KKKKKKKKKKKKKKKKKKKKKKKKKKKK");
      // print(listClubsmodel!.images.toString() +
      //     "LLLLLLLLLLLLLLLLLLLLLLKKKKKKKKKKKKKKKKKKKKKKKKK");
      // print(value.data.toString());

      emit(BookingTrinnerSuccsfuly());
    }).catchError((onError) {
      // print("object");

      emit(BookingTrinnerError());
    });
  }

  int selectedItemId = -1;
  bool? isclick1;
  void ChickBoxTrinner(bool? value, int i, int IdTrinnerClub) {
    if (value != null && value) {
      selectedItemId = i;
      // تحديث العنصر المحدد إلى العنصر الحالي

      // Navigator.push<void>(
      //   context,
      //   MaterialPageRoute<void>(
      //     builder: (BuildContext context) =>
      //         DataBooking(),
      //   ),
      // );

      isclick1 = true;
      getIDTrinner(IdTrinnerClub);
      emit(BookingTrinnerChickBox());
    } else {
      selectedItemId = -1;
      isclick1 = false;
      emit(BookingTrinnerChickBox());

      // إلغاء تحديد العنصر إذا تم إلغاء تحديد الـ checkBox
    }
  }

  int? idTrinner;
  void getIDTrinner(int IdTrinnerClub) {
    this.idTrinner = IdTrinnerClub;
    emit(BookingTrinnerID());
  }

  GetTimeClubModel? getTimeClubModel;
  void getDataListTime(int trainer_id, String date) {
    emit(BookingListTimeLoading());
    FormData formData = FormData.fromMap({
      "trainer_id": trainer_id,
      "date": date,
    });
    DioHelper.postData("getTrainerTimes",
            data: formData, token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      getTimeClubModel = GetTimeClubModel.fromJson(value.data);
      emit(BookingListTimeSuccsfuly());
    }).catchError((onError) {
      // print("object");

      emit(BookingListTimeError());
    });
  }

////////////////////////////////////////////////////////////////////////////////////////////////// edit
  AddBookingModel? addBookingModel;
  void postDataAddBookingModel(int user_id, int service_id, int trainer_id,
      List<int> trainerTime_ids, BuildContext context) {
    emit(BookingBookingLoading());
    print(user_id.toString() +
        service_id.toString() +
        trainer_id.toString() +
        trainerTime_ids.length.toString() +
        "OOOOOOOOOOOO");
    DioHelper.postData("addBooking",
            data: {
              "user_id": user_id,
              "service_id": service_id,
              "trainer_id": trainer_id,
              "status": 1,
              "trainerTime_ids": trainerTime_ids
            },
            token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      addBookingModel = AddBookingModel.fromJson(value.data);
      Navigator.pushReplacement<void, void>(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => MainScreen(),
        ),
      );
      emit(BookingBookingSuccsfuly());
    }).catchError((onError) {
      // print("object");

      emit(BookingBookingError());
    });
  }

  //////////////////////////////real time
  void configurePusher({required int trainer_id, required String date}) async {
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
              "yyyyyyyyyyyyLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL");

          /////////////////edit
          getDataListTime(trainer_id, date);
          print(
              "yyyyyyyyyyLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL");

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
      await pusher.subscribe(
          channelName: "booking",
          onEvent: onEvent11(trainer_id: trainer_id, date: date));
// await pusher.trigger(onEvent: onEvent1);
      emit(MainScreenConfigPusheBooking());
      // await pusher.onev
      await pusher.connect();
    } catch (e) {
      print("ERROR: $e" + e.toString());
    }
  }

  Function onEvent11({required int trainer_id, required String date}) {
    return (dynamic event) {
      // قم بتنفيذ العمليات المطلوبة هنا باستخدام event و id
      getDataListTime(trainer_id, date);

      print(
          'Received event in customEventHandler with id: $trainer_id - ${event.toString()}');
    };
    // print("onEvent: $event");
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
    // emit(MainScreenConfigPusheBookingEvent());
  }

  void configurePusher1({required int trainer_id, required String date}) async {
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

          getDataListTime(trainer_id, date);
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
      await pusher.subscribe(channelName: "trainerTime", onEvent: onEvent112);
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

  ////////payment
  ///
  String currentPayment = "";

  Map<String, dynamic>? paymentIntet;
  void makePayment(int Price,
      {required int Idclub,
      required int IdServic,
      required int Idtrinner,
      required List<int> selectedChipIndices,
      required BuildContext context}) async {
    try {
      paymentIntet = await creatPaymentIntent(Price);
      print(
          "UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU");
      var gpay = const PaymentSheetGooglePay(
          merchantCountryCode: "US", currencyCode: "US", testEnv: true);
      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntet!["client_secret"],
        style: ThemeMode.dark,
        merchantDisplayName: "mohammed",
        googlePay: gpay,
      ));
      print("LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL");
      displayPaymentSheet(
          IdServic: IdServic,
          Idclub: Idclub,
          Idtrinner: Idtrinner,
          context: context,
          selectedChipIndices: selectedChipIndices);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  void displayPaymentSheet(
      {required int Idclub,
      required int IdServic,
      required int Idtrinner,
      required List<int> selectedChipIndices,
      required BuildContext context}) async {
    try {
      await Stripe.instance.presentPaymentSheet();
      changBoolean(true);
      postDataAddBookingModel(CachShpreafapp.getdata(key: "UserID"), IdServic,
          Idtrinner, selectedChipIndices, context);
      // Navigator.pushReplacement<void, void>(
      //   context,
      //   MaterialPageRoute<void>(
      //     builder: (BuildContext context) => MainScreen(),
      //   ),
      // );
      print("Done");
    } catch (e) {
      // Navigator.pop(context);
      changBoolean(false);

      print("faild");
    }
  }

  creatPaymentIntent(int Price) async {
    try {
      // print(widget.bookingCubit.price.toString() +
      //     "((((((((((((((((((((((((((((()))))))))))))))))))))))))))))");
      Map<String, dynamic> body = {
        "amount": Price.toString(),
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
      return json.decode(response.body);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  //  String currentPayment = "";

  // Map<String, dynamic>? paymentIntet;
  // void makePayment(int Price, int Id_Actions) async {
  //   try {
  //     int amount = Price.toInt();
  //     paymentIntet = await creatPaymentIntent(amount);
  //     var gpay = const PaymentSheetGooglePay(
  //         merchantCountryCode: "US", currencyCode: "US", testEnv: true);
  //     await Stripe.instance.initPaymentSheet(
  //         paymentSheetParameters: SetupPaymentSheetParameters(
  //       paymentIntentClientSecret: paymentIntet!["client_secret"],
  //       style: ThemeMode.dark,
  //       merchantDisplayName: "mohammed",
  //       googlePay: gpay,
  //     ));

  //     displayPaymentSheet(amount, Id_Actions);
  //   } catch (e) {
  //     throw Exception(e.toString());
  //   }
  // }

  // void displayPaymentSheet(int price, int Actions_Id) async {
  //   try {
  //     print("11111111111111111111111111111111111111111111111");
  //     await Stripe.instance.presentPaymentSheet();
  //     print(
  //         "11eeeeeeeeeeeeeeeeeee11111111111111111111111dddddddddddddddddddddddd1111111111111111111111");
  //     postAddInsurance(insurance: price, Auction_id: Actions_Id);
  //     emit(FilterScreenTimeUpComingPayMentSceccfuly(
  //         detailsActionsID: detailsActionsID!));

  //     print("Done");
  //   } catch (e) {
  //     emit(FilterScreenTimeUpComingPayMentError());

  //     print("faild");
  //   }
  // }

  // creatPaymentIntent(int Price) async {
  //   try {
  //     print("*******************************************" + Price.toString());
  //     Map<String, dynamic> body = {
  //       "amount": "${Price}", //Price.toString(),
  //       //  amount.toString(),
  //       "currency": "USD"
  //     };
  //     http.Response response = await http.post(
  //         Uri.parse("https://api.stripe.com/v1/payment_intents"),
  //         body: body,
  //         headers: {
  //           "Authorization":
  //               "Bearer sk_test_51OpWWDCxQy2AfPxbwTOLYLIlzBFtG8CPvJTJBXmTWPmuiF0nR3pK3xDULZA8JkxUzRaSw78JNKflJPVqg8a5MHh600liN8NUqG",
  //           "Content-Type": "application/x-www-form-urlencoded"
  //         });
  //     print("***************************************");
  //     return json.decode(response.body);
  //   } catch (e) {
  //     throw Exception(e.toString());
  //   }
  // }
}
