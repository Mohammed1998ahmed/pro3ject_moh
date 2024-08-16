import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:thi/NetWork/dioHelper.dart';
import 'package:thi/profile/hospetel/model/modelhospitle.dart';
import 'package:thi/sharePreferinces/shardprefericences.dart';

part 'hospatel_state.dart';

class HospatelCubit extends Cubit<HospatelState> {
  HospatelCubit() : super(HospatelInitial());
  static HospatelCubit getObject(context) => BlocProvider.of(context);
  GetConsultationModel? getConsultationModel;
  void getConsultations({required int ID_Profile}) {
    emit(Hospatelloading());
    DioHelper.getDataClub(
            endpoint: "allConsultationByUser/${ID_Profile}",
            token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      getConsultationModel = GetConsultationModel.fromJson(value.data);
      emit(HospatelSeccessfluy());
    }).catchError((onError) {
      emit(HospatelError());
    });
  }
}
