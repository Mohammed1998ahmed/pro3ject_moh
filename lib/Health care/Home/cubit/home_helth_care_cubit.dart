 import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:thi/Health%20care/Home/model/allOfferModel.dart';
import 'package:thi/Health%20care/Home/model/htleathmodel.dart';
import 'package:thi/NetWork/dioHelper.dart';
import 'package:thi/sharePreferinces/shardprefericences.dart';

part 'home_helth_care_state.dart';

class HomeHelthCareCubit extends Cubit<HomeHelthCareState> {
  HomeHelthCareCubit() : super(HomeHelthCareInitial());
  static HomeHelthCareCubit getObject(context) => BlocProvider.of(context);
  HealthCaresModel? healthCaresModel;
  void getHomeHelthCare() {
    emit(HomeHelthCareLoading());
    DioHelper.getDataClub(
            endpoint: "getAllHealthCaresUser",
            token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      healthCaresModel = HealthCaresModel.fromJson(value.data);
      emit(HomeHelthCareSeccessfluy());
    }).catchError((onError) {
      emit(HomeHelthCareError());
    });
  }

  AlloffersModel? alloffersModel;
  void getHomeHelthOffers() {
    emit(HomeHelthCareOffersLoading());
    DioHelper.getDataClub(
            endpoint: "getOffersToday",
            token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      alloffersModel = AlloffersModel.fromJson(value.data);
      print(alloffersModel!.offers![0].toString() +
          "7777777777777777777777777777777777777");
      emit(HomeHelthCareOffersSeccessfluy());
    }).catchError((onError) {
      emit(HomeHelthCareOffersError());
    });
  }
}
