import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:thi/Health%20care/Chat/listChat.dart';
import 'package:thi/Health%20care/Home/home.dart';
import 'package:thi/component/Widght.dart';
import 'package:thi/component/conset/Const.dart';

part 'main_helth_state.dart';

class MainHelthCubit extends Cubit<MainHelthState> {
  MainHelthCubit() : super(MainHelthInitial());
  static MainHelthCubit getObjet(context) => BlocProvider.of(context);

  List<Widget> ListWidght = [
    HomeHealth(),
    ChatListScreen()
    // Home1(),
    // Local1(),
    // ChatListScreen(),
    // Profile2(),
    // ServieseScreen()
  ];

  int index = 0;
  chaingindex(int chainginadexs) {
    this.index = chainginadexs;
    emit(MainScreenChaingIndex());
  }

  List<Widget> iconNav() {
    return [
      Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            // SizedBox(
            //   height: 6,
            // ),

            Icon(
              Icons.home_outlined,
              size: 30,
              color: Color3,
            ),

            text(
                title: "Home",
                fontSize: 8,
                fontWeight: FontWeight.w600,
                color: Colors.white)
          ],
        ),
      ),
      // Padding(
      //   padding: const EdgeInsets.all(10),
      //   child: Column(
      //     children: [
      //       // SizedBox(
      //       //   height: 6,
      //       // ),

      //       Icon(
      //         Icons.location_on_outlined,
      //         size: 30,
      //         color: Color3,
      //       ),

      //       text(
      //           title: "Near by",
      //           fontSize: 8,
      //           fontWeight: FontWeight.w600,
      //           color: Colors.white)
      //     ],
      //   ),
      // ),
      Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Icon(
              Icons.chat_bubble_outline_outlined,
              color: Color3,
              size: 30,
            ),
            text(
                title: "chat",
                fontSize: 8,
                fontWeight: FontWeight.w600,
                color: Colors.white)
          ],
        ),
      ),
      // Padding(
      //   padding: const EdgeInsets.all(10),
      //   child: Column(
      //     children: [
      //       Icon(
      //         Icons.person,
      //         size: 30,
      //         color: Color3,
      //       ),
      //       text(
      //           title: "Profile",
      //           fontSize: 8,
      //           fontWeight: FontWeight.w600,
      //           color: Colors.white)
      //     ],
      //   ),
      // ),
    ];
  }
}
