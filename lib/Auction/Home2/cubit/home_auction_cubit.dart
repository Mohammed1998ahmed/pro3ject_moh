import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thi/component/Widght.dart';
import 'package:thi/component/conset/Const.dart';

import '../../../profile/Profile3.dart';
import '../../AuctionBooking/Booking_H.dart';
import '../../AuctionCalender/ActionCalunder.dart';
import '../../FaviorteSceen/favoriteScreen.dart';
import '../../SupportsScreen/supportsScreen.dart';

part 'home_auction_state.dart';

class HomeAuctionCubit extends Cubit<HomeAuctionState> {
  HomeAuctionCubit() : super(HomeAuctionInitial());
  static HomeAuctionCubit getObject(context) => BlocProvider.of(context);
  List<Widget> items = [
    Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Icon(
            Icons.home_outlined,
            size: 30,
            color: Color3,
          ),
          text(
              title: "Home",
              fontSize: 12,
              fontWeight: FontWeight.w800,
              color: Colors.white)
        ],
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Icon(
            Icons.star_border,
            size: 30,
            color: Color3,
          ),
          text(
              title: "Favorite",
              fontSize: 12,
              fontWeight: FontWeight.w800,
              color: Colors.white)
        ],
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Icon(
            Icons.support_agent_outlined,
            size: 30,
            color: Color3,
          ),
          text(
              title: "Support",
              fontSize: 12,
              fontWeight: FontWeight.w800,
              color: Colors.white)
        ],
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Icon(Icons.calendar_month_outlined, size: 30, color: Color3),
          text(
              title: "Calendar",
              fontSize: 12,
              fontWeight: FontWeight.w800,
              color: Colors.white)
        ],
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Icon(
            Icons.person,
            size: 30,
            color: Color3,
          ),
          text(
              title: "Profile",
              fontSize: 12,
              fontWeight: FontWeight.w800,
              color: Colors.white)
        ],
      ),
    ),
  ];

  int index = 0;
  void chaingIndex(int numberIndex) {
    this.index = numberIndex;
    print(this.index);
    emit(HomeAuctionChaingIndexButtonNav());
  }

  List<Widget> widght = [
    ActionCalunder(),
    // filterScreen(),
    FavoriteScreen(),
    SportScreen(),
    MyHomePage(),
    Profile2(),
  ];
}
