 import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'sort_by_state.dart';

class SortByCubit extends Cubit<SortByState> {
  SortByCubit() : super(SortByInitial());
  static SortByCubit getObject(context) => BlocProvider.of(context);

  String selectSort = "";
  void chaingStringButton(String stringButton) {
    this.selectSort = stringButton;
    emit(SortByStringButton());
  }
}
