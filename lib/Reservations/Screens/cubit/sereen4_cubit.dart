import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:thi/NetWork/dioHelper.dart';

part 'sereen4_state.dart';

class Sereen4Cubit extends Cubit<Sereen4State> {
  Sereen4Cubit() : super(Sereen4Initial());
  // static Sereen4Cubit getObject(context) => BlocProvider.of(context);
//  double rating = 0.0;
//   void chaingStar(double valueStar) {
//     rating = valueStar;
//     emit(HomeStableValueStar());
//   }
  // TextEditingController controllerSend = TextEditingController();

// IsReservitionModel? isReservitionModel;
//   void postIsReservation({required int Club_Id, required int User_Id}) {
//     emit(BookingServicISRaserationLoading());
//     FormData formData = FormData.fromMap({"club": Club_Id, "user_id": User_Id});
//     DioHelper.postData("isReserved",
//             data: formData, token: CachShpreafapp.getdata(key: "tokenProfile"))
//         .then((value) {
//       isReservitionModel = IsReservitionModel.fromJson(value.data);
//       emit(BookingServicISRaserationSuccsfuly());
//     }).catchError((onError) {
//       emit(BookingServicISRaserationError());
//     });
//   }

//   GetRatingIDModel? getRatingModel;
//   void getRatingID({
//     required int club_id,
//     // required int rating_id,
//     required int user_id,
//   }) {
//     emit(HomeStableRatingIDLoading());
//     print(user_id.toString() + rating.toString());
//     FormData formData = FormData.fromMap({
//       "club_id": club_id,
//       "user_id": user_id,
//     });
//     DioHelper.postData("getRatingIDByUserClub",
//             data: formData, token: CachShpreafapp.getdata(key: "tokenProfile"))
//         .then((value) {
//       getRatingModel = GetRatingIDModel.fromJson(value.data);
//       print(getRatingModel!.id == null
//           ? "0"
//           : getRatingModel!.id.toString() +
//               "objectffffffffffffffffffdfdfdfdfdfdfdffffff");
//       print("88888888888888888888888888888888888888888888888");
//       emit(HomeStableRatingIDSeccsfuly());
//     }).catchError((onError) {
//       emit(HomeStableRatingIDError());
//     });
//   }


}
