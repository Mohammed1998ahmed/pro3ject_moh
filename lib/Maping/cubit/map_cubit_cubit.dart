import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'map_cubit_state.dart';

class MapCubitCubit extends Cubit<MapCubitState> {
  MapCubitCubit() : super(MapCubitInitial());
}
