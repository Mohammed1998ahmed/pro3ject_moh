import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'appointement_state.dart';

class AppointementCubit extends Cubit<AppointementState> {
  AppointementCubit() : super(AppointementInitial());
}
