import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:thi/NetWork/dioHelper.dart';
import 'package:thi/Reservations/nearby_screen/model/ClubIDCategoires.dart';
import 'package:thi/sharePreferinces/shardprefericences.dart';

part 'neabry_screen_state.dart';

class NeabryScreenCubit extends Cubit<NeabryScreenState> {
  NeabryScreenCubit() : super(NeabryScreenInitial());

  static NeabryScreenCubit getObject(context) => BlocProvider.of(context);

  List category = [
    {
      "image": "assets/images/img_10.png",
      "text": "Ability &",
    },
    {"image": "assets/images/img_11.png", "text": "Flat race"},
    {"image": "assets/images/img_12.png", "text": "Show horse"},
    {"image": "assets/images/img_13.png", "text": "Pony"},
    {
      "image": "assets/images/img_14.png",
      "text": "Race",
    },
  ];
  ClubIDCategoriesModel? clubIDCategoriesModel;
  void getDateGaregories(int IDCategoires) {
    emit(NeabryScreenLoading());
    DioHelper.getDataClub(
            endpoint: "getClubsInCategory/${IDCategoires}",
            token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      clubIDCategoriesModel = ClubIDCategoriesModel.fromJson(value.data);
      print(clubIDCategoriesModel!.clubs![0].name.toString() +
          "IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII");

      emit(NeabryScreenSeccsfuly());
    }).catchError((onError) {
      emit(NeabryScreenError());
    });
  }
}
