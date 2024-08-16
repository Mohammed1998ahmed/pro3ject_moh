 import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'drwer_state.dart';

class DrwerCubit extends Cubit<DrwerState> {
  DrwerCubit() : super(DrwerInitial());
  static DrwerCubit getObject(context) => BlocProvider.of(context);
  
}
