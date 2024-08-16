import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:thi/Auction/Home2/cubit/home_auction_cubit.dart';
import 'package:thi/Theme/app_them.dart';
import 'package:thi/component/conset/Const.dart';

class MainScreen2 extends StatefulWidget {
  const MainScreen2({Key? key}) : super(key: key);

  @override
  State<MainScreen2> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen2> {
  // Profile2
  List category = [
    {
      "image": "assets/images/img_10.png",
      "text": "Ability &",
    },
    {"image": "assets/images/img_11.png", "text": "Flat race"},
    {"image": "assets/images/img_12.png", "text": "Show horse"},
    {"image": "assets/images/img_13.png", "text": "Pony"},
    {
      "image": "assets/images/img_14.png",
      "text": "Race",
    },
  ];

  bool shimmer = true;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeAuctionCubit(),
      child: BlocConsumer<HomeAuctionCubit, HomeAuctionState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = HomeAuctionCubit.getObject(context);
          return Scaffold(
            body: Stack(children: [
              Image.asset(
                imageBackground,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover,
              ),
              Scaffold(
                backgroundColor: Colors.transparent,
                body: cubit.widght[cubit.index],
                drawer: Drawer(),
                bottomNavigationBar: CurvedNavigationBar(
                  index: cubit.index,
                  height: 60.0,
                  items: cubit.items,
                  color: Color.fromRGBO(71, 181, 255, 0.678), // Colors.black,
                  buttonBackgroundColor: Color0,
                  backgroundColor: Color.fromRGBO(71, 181, 255, 0.281),
                  animationCurve: Curves.easeInOut,
                  animationDuration: Duration(milliseconds: 600),
                  onTap: (index) {
                    setState(() {
                      cubit.chaingIndex(index);

                      print("LLLLLLLLLLLLLLLLLLLLLL");
                      print(index);
                    });
                  },
                  // letIndexChange: (index) => false,
                ),
              )
            ]),
          );
        },
      ),
    );
  }
}
