import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'mohammed_event.dart';
part 'mohammed_state.dart';

class MohammedBloc extends Bloc<MohammedEvent, MohammedState> {
  MohammedBloc() : super(MohammedInitial()) {
    on<MohammedEvent>((event, emit) {
     });
  }
}
