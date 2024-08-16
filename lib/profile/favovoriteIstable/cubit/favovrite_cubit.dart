 import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:thi/NetWork/dioHelper.dart';
import 'package:thi/profile/favovoriteIstable/model/getFavoratie.dart';
import 'package:thi/sharePreferinces/shardprefericences.dart';

part 'favovrite_state.dart';

class FavovriteCubit extends Cubit<FavovriteState> {
  FavovriteCubit() : super(FavovriteInitial());
  static FavovriteCubit getObject(context) => BlocProvider.of(context);

  GetFavoratieModle? getFavoratieModle;

  void getDataFavoratie(int UserID) {
    emit(FavovriteLoading());
    DioHelper.getDataClub(
            endpoint: "getFavoriteClubs/${UserID}",
            token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      getFavoratieModle = GetFavoratieModle.fromJson(value.data);
      // print(getFavoratieModle!.favoriteClubs![0].name.toString());
      print("mohammed mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm1000000000000000000");
      emit(Favovritesueccsfuly());
    }).catchError((onError) {
      emit(FavovriteError());
    });
  }
}
