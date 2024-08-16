 import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:thi/Auction/AuctionBooking/model/daysmodel.dart';
import 'package:thi/NetWork/dioHelper.dart';
import 'package:thi/sharePreferinces/shardprefericences.dart';

part 'day_booking_state.dart';

class DayBookingCubit extends Cubit<DayBookingState> {
  DayBookingCubit() : super(DayBookingInitial());
  static DayBookingCubit getObject(context) => BlocProvider.of(context);
  MyDataAuctionModel? myDataAuctionModel;
  void postUpComing({required String date}) {
    emit(DayBookingLoading());
    FormData formData = FormData.fromMap({"date": date});
    DioHelper.postData("upcoming1",
            data: formData, token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      myDataAuctionModel = MyDataAuctionModel.fromJson(value.data);
      for (var i = 0; i < myDataAuctionModel!.auctions!.length; i++) {
        CachShpreafapp.getdata(
                key:
                    "boolfavoratieActions${CachShpreafapp.getdata(key: "UserID")}${myDataAuctionModel!.auctions![i].horses!.auctionId}") ??
            CachShpreafapp.sevedata(
                key:
                    "boolfavoratieActions${CachShpreafapp.getdata(key: "UserID")}${myDataAuctionModel!.auctions![i].horses!.auctionId}",
                value: false);
      }
      emit(DayBookingSeccsefuly());
    }).catchError((onError) {
      emit(DayBookingError());
    });
  }
}
