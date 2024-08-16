import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'health_care_state.dart';

class HealthCareCubit extends Cubit<HealthCareState> {
  HealthCareCubit() : super(HealthCareInitial());
}
