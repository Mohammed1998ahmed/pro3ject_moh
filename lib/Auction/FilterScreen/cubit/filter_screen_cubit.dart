 import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
 import 'package:thi/Auction/FilterScreen/Model/postUpComing.dart';
import 'package:thi/NetWork/dioHelper.dart';
import 'package:thi/sharePreferinces/shardprefericences.dart';

part 'filter_screen_state.dart';

class FilterScreenCubit extends Cubit<FilterScreenState> {
  FilterScreenCubit() : super(FilterScreenInitial());
  static FilterScreenCubit getObject(context) => BlocProvider.of(context);
  bool shimmer = true;
  PostUpcomingActions? postUpcomingActions;
  void postUpComing({required String date}) {
    emit(FilterScreenUpComingLoading());
    FormData formData = FormData.fromMap({"date": date});
    DioHelper.postData("upcoming1",
            data: formData, token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      postUpcomingActions = PostUpcomingActions.fromJson(value.data);
         for (var i = 0; i < postUpcomingActions!.auctions!.length; i++) {
        CachShpreafapp.getdata(
                key: "boolfavoratieActions${CachShpreafapp.getdata(key: "UserID")}${postUpcomingActions!.auctions![i].horses!.auctionId}") ??
                  CachShpreafapp.sevedata(key: "boolfavoratieActions${CachShpreafapp.getdata(key: "UserID")}${postUpcomingActions!.auctions![i].horses!.auctionId}", value: false);

      }
      emit(FilterScreenUpComingSceccfuly());
    }).catchError((onError) {
      emit(FilterScreenUpComingError());
    });
  }

 
}
