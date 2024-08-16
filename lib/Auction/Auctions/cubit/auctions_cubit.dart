 import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'auctions_state.dart';

class AuctionsCubit extends Cubit<AuctionsState> {
  AuctionsCubit() : super(AuctionsInitial());
  static AuctionsCubit getObject(context) => BlocProvider.of(context);
    bool shimmer = true;

}
