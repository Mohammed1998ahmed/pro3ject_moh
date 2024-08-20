///// *************** MOHAMMED AHMED SH ******************* /////

import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thi/Auction/AuctionCalender/cubit/auction_calender_cubit.dart';
import 'package:thi/NetWork/dioHelper.dart';
import 'package:thi/Reservations/Home/cubit/main_screen_cubit.dart';
import 'package:thi/SplashScreen/SplashScreen.dart';
import 'package:flutter/services.dart';
import 'package:thi/localNotifation.dart';

import 'package:thi/sharePreferinces/shardprefericences.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'BlocServic/Bloc.dart';
// import 'package:flutter_pusher/flutter_pusher.dart';

// void configurePusher() {
//   final pusher = FlutterPusher(
//     'your_app_key',
//     'your_app_cluster',
//     enableLogging: true, // تمكين تسجيل الأحداث لأغراض التصحيح
//   );

//   // الاتصال بـ Pusher
//   pusher.connect();

//   // الاشتراك في قناة
//   final channel = pusher.subscribe('my-channel');

//   // الاستماع لحدث معين
//   channel.bind('my-event', (event) {
//     print('Received event: $event');
//     // قم بمعالجة بيانات الحدث حسب الحاجة
//   });
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CachShpreafapp.init();
  // CachShpreafapp.init();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  PusherChannelsFlutter();
  Stripe.publishableKey =
      'pk_test_51OpWWDCxQy2AfPxb214C7lPGSOfgaEHjM3BGyrlntMc6RHMa2oaMcp3JuhaVXZxXYlUtlXBr1xpl10A3Kvckwath00hYwGapFK';
  AwesomeNotifications().initialize(
    'resource://drawable/rainbowcuate', // استبدل برمز الأيقونة الخاص بتطبيقك
    [
      NotificationChannel(
        channelKey: 'basic_channel',
        channelName: 'Basic Notifications',
        channelDescription: 'Basic notifications channel',
        defaultColor: Color(0xFF9D50DD),
        ledColor: Colors.white,
      ),
    ],
  );
  // ErrorWidget.builder = (FlutterErrorDetails details) {
  //   return Scaffold(
  //     body: Container(
  //         alignment: Alignment.center,
  //         child: Center(
  //             child: SpinKitSpinningLines(
  //           color: Color.fromARGB(200, 121, 21, 47),
  //           size: 100,
  //         ))),
  //   );
  // };
  await LocalNotifations.init();
  HttpOverrides.global = MyHttpOverrides();
  // ServerApi.init();
  // ServerApi.initWeather();
  // Bloc.observer = MyBlocObserver();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // configurePusher();
    return MultiBlocProvider(
      providers: [
        // if (CachShpreafapp.getdata(key: "tokenProfile") != null)
        //   BlocProvider<AuctionCalenderCubit>(
        //     create: (BuildContext context) =>
        //         AuctionCalenderCubit()..configurePusher1(),
        //   ),
        // if (CachShpreafapp.getdata(key: "tokenProfile") != null)
        BlocProvider<MainScreenCubit>(
          create: (BuildContext context) =>
              MainScreenCubit()..configurePusher(),
        ),
      ],
      child: BlocConsumer<MainScreenCubit, MainScreenState>(
        listener: (context, state) {},
        builder: (context, states) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            // home: CachShpreaf.getdata(key: "Token") != null
            //     ? CachShpreaf.getdata(key: "lang").toString() == "en"
            //         ? Directionality(
            //             textDirection: TextDirection.ltr, child: Home_Page())
            //         : Directionality(
            //             textDirection: TextDirection.rtl, child: Home_Page())
            //     : Test1(),
            home:
                // VeterinaryConsultationScreen(),
                //  CachShpreafapp.getdata(key: "tokenProfile") != null
                //     ? MainScreen()
                SplashScreen(),
            // VideoPickerScreen(),
          );
        },
      ),

      // create: (context) => LoginCubit(),
      // child: MaterialApp(
      //   title: 'Flutter Demo',
      //   debugShowCheckedModeBanner: false,
      //   theme: ThemeData(
      //     primarySwatch: Colors.blue,
      //   ),
      //   home:
      //       //  CachShpreafapp.getdata(key: "tokenProfile") != null
      //       //     ? MainScreen()
      //       SplashScreen(),
      // ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

// void main() {
//   runApp(MyApp());
// }

class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // configurePusher(); // تهيئة الاتصال بعد تحميل التطبيق

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Pusher Example'),
        ),
        body: Center(
          child: Text('Listening for Pusher events...'),
        ),
      ),
    );
  }
}


// dynamic onError(String message, int? code, dynamic e) {
//   print("onError: $message code: $code exception: $e");
// }

// dynamic onConnectionStateChange(dynamic currentState, dynamic previousState) {
//   print("Connectio n: $currentState");
// }

// dynamic onMemberRemoved(String channelName, PusherMember member) {
//   print("onMemberRemoved: $channelName member: $member");
// }

// dynamic onMemberAdded(String channelName, PusherMember member) {
//   print("onMemberAdded: $channelName member: $member");
// }

// dynamic onSubscriptionSucceeded(String channelName, dynamic data) {
//   print("onSubscriptionSucceeded: $channelName data: $data");
// }

// dynamic onSubscriptionError(String message, dynamic e) {
//   print("onSubscriptionError: $message Exception: $e");
// }

// dynamic onEvent(PusherEvent event) {
//   print("onEvent: $event");
//   // event.eventName = "mohammed";
//   // Provider.of<NotificationProvider>(context, listen: false)
//   //     .setNotificationCount(1);
// }

// dynamic onDecryptionFailure(String event, String reason) {
//   print("onDecryptionFailure: $event reason: $reason");
// }
// // app_id = "1793069" key = "e5d6ede1b86a447371cc" secret = "46834166895d119dc392" cluster = "eu"

// dynamic onAuthorizer1(
//     String channelName, String socketId, dynamic options) async {
//   // socketId = "180192.65836375";

//   // channelName = "private-private.chat2-1";
//   print('////onAuthorizer' + socketId + channelName);

// ////////////////////////
//   try {
//     FormData formData = FormData.fromMap({
//       "socketId": socketId,
//       "channelName": channelName,
//     });
//     // String token = await CachShpreafapp.getdata(key: "tokenProfile");
//     final response = await DioHelper.dio!.post(
//       "pusher/authenticate",
//       data: formData,
//       // queryParameters: {'Authorization': token},
//       // options: Options(
//       //   headers: {
//       //     'Accept': 'application/json',
//       //     'Authorization': 'Bearer ${token}',
//       //     "Content-Type": "application/x-www-form-urlencoded"
//       //   },
//       // ),
//     );
//     // print("LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLffffffffffLL" +
//     //     response.statusCode.toString() +
//     //     response.data.toString());
//     var json = jsonDecode(response.data);
//     print(json.toString() +
//         "(((((((((((((((((((((((((99999999999)))))))))))))))))))))))))");
//     return json;
//   } catch (e) {
//     print(e.toString());
//     print(
//         "LLLLLLLfgfgfgfggggggggggggggggggggLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL");
//     rethrow;
//   }
// /////////////////////////

//   // try {
//   //   String token = await CachShpreafapp.getdata(key: "tokenProfile");
//   //   print('////onAuthorizer' + token);
//   //   //  FormData formData = FormData.fromMap({
//   //   //   "email": Email,
//   //   //   "password": PassWord,
//   //   // });
//   //   var authUrl = "http://192.168.109.241:8000/api/pusher/authenticate";
//   //   var result = await http.post(
//   //     Uri.parse(authUrl),

//   //     // headers: {
//   //     //   'Accept': 'application/json',
//   //     //   'Content-Type': 'application/json',
//   //     //   'Authorization':
//   //     //       'Bearer 13|KYxSQoDS1Q7wVNk8U6TV1rg7RBJBtEhf2slENblm6cbe38ac',
//   //     // },
//   //     // body: 'socketId$socketId&channel_name$channelName',

//   //     body: {
//   //       "socketId": "180192.65836375",
//   //       "channelName": "private-private.chat2-1",
//   //       // "auth": "13|KYxSQoDS1Q7wVNk8U6TV1rg7RBJBtEhf2slENblm6cbe38ac",
//   //       // "shared_secret": "46834166895d119dc392",
//   //     }
//   //   );
//   //   print('////onAuthorizer555555555555555555');

//   //   var json = jsonDecode(result.body);
//   //   print('////88888888888888888888888888888888888');

//   //   return result;
//   // } on Exception catch (e) {
//   //   print(e.toString());
//   //   print('////onAuthorizer*********');
//   //   // TODO
//   // }
// }
