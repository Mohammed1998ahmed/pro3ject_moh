import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
import 'package:thi/Health%20care/Chat/cubit/chat_state.dart';
import 'package:thi/Health%20care/Chat/model/GetDataMessageModel.dart';
import 'package:thi/Health%20care/Chat/model/PusherSentMessage.dart';

import 'package:thi/Health%20care/Chat/model/SentChatModel.dart';
import 'package:thi/Health%20care/Chat/model/listChatDoctor.dart';
import 'package:thi/mPusherConig/piusherConfig.dart';

import '../../../NetWork/dioHelper.dart';
import '../../../sharePreferinces/shardprefericences.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  static ChatCubit getObject(context) => BlocProvider.of(context);

  bool shimmer = false;
  void chaingShimmer(bool screenShimmer) {
    this.shimmer = screenShimmer;
    emit(ChatShimmer());
  }

  ChatModelSent? chatModelSent;
  void postMessage({
    required int user_id,
    required int doctor_id,
    required String content,
    File? imageFile,
  }) async {
    FormData formData;
    if (imageFile != null) {
      List<int> fileBytes = await imageFile.readAsBytes();
      formData = FormData.fromMap({
        "user_id": user_id,
        "doctor_id": doctor_id,
        "cont": content,
        'image': MultipartFile.fromBytes(fileBytes, filename: 'image.jpg'),
        "role": "USER",
        "user": 1,
        "doctor": 0
      });
    } else {
      formData = FormData.fromMap({
        "user_id": user_id,
        "doctor_id": doctor_id,
        "cont": content,
        "role": "USER",
        "user": 1,
        "doctor": 0
      });
    }
    print(formData.toString() +
        "!11111111111111111111111OOOOOOOOOOOOOOOOOOOOOOOOOOO");
    emit(ChatLoading());
    DioHelper.postData("sendDoctor-Message",
            data: formData, token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      chatModelSent = ChatModelSent.fromJson(value.data);
      emit(ChatSceccfully());
    }).catchError((onError) {
      emit(ChatError());
    });
  }

  ScrollController scrollController = ScrollController();

  ChatModelGetData? chatModelGetData;
  void getDataMessage({required int User_Id, required int ID_Doctor}) {
    FormData formData = FormData.fromMap({
      "user_id": User_Id,
      "doctor_id": ID_Doctor,
    });
    emit(ChatGetLoading());
    DioHelper.postData("getDoctor-ChatMessagesU",
            data: formData, token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      chatModelGetData = ChatModelGetData.fromJson(value.data);
      // scrollController.jumpTo(scrollController.position.maxScrollExtent);
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      emit(ChatGetSceccfully());
    }).catchError((onError) {
      emit(ChatGetError());
    });
  }

  List<PusherSendMessage> pusherMessage = [];
  void configurePusher({required int ID_Doctor}) async {
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
          getDataMessage(
              User_Id: CachShpreafapp.getdata(key: "UserID"),
              ID_Doctor: ID_Doctor);
          emit(ChatGetSceccfullyPUsher());
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
        onAuthorizer: onAuthorizer1,
      );
      await pusher.subscribe(
          channelName:
              "private-chat-Doctor-${CachShpreafapp.getdata(key: "UserID")}-${ID_Doctor}",
          onEvent: onEvent1);
// await pusher.trigger(onEvent: onEvent1);

      // await pusher.onev
      await pusher.connect();
    } catch (e) {
      print("ERROR: $e" + e.toString());
    }
  }

  dynamic onAuthorizer1(
      String channelName, String socketId, dynamic options) async {
    // socketId = "180192.65836375";

    // channelName = "private-private.chat2-1";
    print('////onAuthorizer' + socketId + channelName);

////////////////////////
    try {
      FormData formData = FormData.fromMap({
        "socketId": socketId,
        "channel_name": channelName,
      });
      // String token = await CachShpreafapp.getdata(key: "tokenProfile");
      final response = await DioHelper.dio!.post(
        "pusher/authenticate",
        data: formData,
      );

      var json = jsonDecode(response.data);
      // print(json.toString() +
      //     "(((((((((((((((((((((((((99999999999)))))))))))))))))))))))))");
      return json;
    } catch (e) {
      print(e.toString());
      print(
          "LLLLLLLfgfgfgfggggggggggggggggggggLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL");
      rethrow;
    }
  }

  ListChatsTrinnerModel? listChatsTrinnerModel;
  void getLIstChatTrinner() {
    emit(ChatGetListDoctorLoading());
    DioHelper.getDataClub(
            endpoint:
                "chatsListDoctor/${CachShpreafapp.getdata(key: "UserID")}",
            token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      listChatsTrinnerModel = ListChatsTrinnerModel.fromJson(value.data);
      emit(ChatGetListDoctorSceccfully());
    }).catchError((onError) {
      emit(ChatGetListDoctorError());
    });
  }
}
