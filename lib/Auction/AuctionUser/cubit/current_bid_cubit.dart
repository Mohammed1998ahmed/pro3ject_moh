import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'current_bid_state.dart';

class CurrentBidCubit extends Cubit<CurrentBidState> {
  CurrentBidCubit() : super(CurrentBidInitial());

  
}
