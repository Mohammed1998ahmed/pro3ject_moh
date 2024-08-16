import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:thi/NetWork/dioHelper.dart';
import 'package:thi/profile/AuctionUserID/model/AuctinUserID.dart';
import 'package:thi/sharePreferinces/shardprefericences.dart';

part 'auction_user_state.dart';

class AuctionUserCubit extends Cubit<AuctionUserState> {
  AuctionUserCubit() : super(AuctionUserInitial());
  static AuctionUserCubit getObject(context) => BlocProvider.of(context);
  AuctionsUserIdModel? auctionsUserIdModel;
  void geActionsByUser() {
    emit(AuctionUserLoading());
    DioHelper.getDataClub(
            endpoint: "Auctions_that_A_User_Participates_in",
            token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      auctionsUserIdModel = AuctionsUserIdModel.fromJson(value.data);
      // for (var i = 0; i < auctionsUserIdModel!.auctions!.length; i++) {
      //   CachShpreafapp.getdata(
      //           key:
      //               "boolfavoratieActions${CachShpreafapp.getdata(key: "UserID")}${getTodayActions!.auctions![i].horses!.auctionId}") ??
      //       CachShpreafapp.sevedata(
      //           key:
      //               "boolfavoratieActions${CachShpreafapp.getdata(key: "UserID")}${getTodayActions!.auctions![i].horses!.auctionId}",
      //           value: false);
      // }
      emit(AuctionUserSeccessfluy());
    }).catchError((onError) {
      print(onError.toString() + "YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY");
      emit(AuctionUserError());
    });
  }
}
