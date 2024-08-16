import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auction_state.dart';

class AuctionCubit extends Cubit<AuctionState> {
  AuctionCubit() : super(AuctionInitial());
  
}
