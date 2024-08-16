import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thi/Auction/AddAuctions/addActions.dart';
import 'package:thi/Auction/Auctions/Actionsm.dart';
import 'package:thi/Auction/TodayActions/todayActions.dart';
import 'package:thi/component/Widght.dart';
import 'package:thi/component/conset/Const.dart';
import 'package:thi/menu/Drwer/DrwerPage.dart';

import 'cubit/auction_calender_cubit.dart';

class ActionCalunder extends StatefulWidget {
  const ActionCalunder({Key? key}) : super(key: key);

  @override
  State<ActionCalunder> createState() => _ActionCalunderState();
}

class _ActionCalunderState extends State<ActionCalunder> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => AuctionCalenderCubit()
        ..geTodyActions()
        ..geUpcomingActions()
        ..configurePusher1(),
      child: BlocConsumer<AuctionCalenderCubit, AuctionCalenderState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = AuctionCalenderCubit.getObject(context);
          return Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(imageBackground), fit: BoxFit.cover)),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                leading: IconButton(
                    onPressed: () {
                      //
                      Navigator.push<void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => DrwerPage(),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.menu,
                      color: Color0,
                    )),
                title: Container(
                  alignment: Alignment.center,
                  child: text(
                      title: "Auctions",
                      color: Color0,
                      fontSize: 22,
                      fontWeight: FontWeight.w800),
                ),
                actions: [
                  Container(
                    width: 50,
                  ),
                ],
              ),
              body: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: [
                    Divider(
                      color: Color.fromRGBO(50, 52, 70, 1),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: height * 0.04,
                        ),
                        cubit.getTodayActions == null
                            ? Center(child: SpinkitWave())
                            : ChoiceChipWidght(
                                width: width,
                                height: height,
                                cubit: cubit,
                                selected: cubit.p1,
                                onSelected: (p0) {
                                  cubit.chaingP1(p0);
                                },
                                title:
                                    'Today’s (${cubit.getTodayActions!.status == false ? 0 : cubit.getTodayActions!.auctions!.length.toString()})'),
                        SizedBox(
                          height: height * 0.04,
                        ),
                        cubit.getUpcomingActions == null
                            ? Center(child: SpinkitWave())
                            : ChoiceChipWidght(
                                width: width,
                                height: height,
                                cubit: cubit,
                                selected: cubit.p2,
                                onSelected: (p0) {
                                  cubit.chaingP2(p0);
                                },
                                title:
                                    'Upcoming (${cubit.getUpcomingActions!.status == false ? 0 : cubit.getUpcomingActions!.dates!.length.toString()})'),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    textWidght(width, height),
                    SizedBox(
                      height: height * 0.3,
                    ),
                    cubit.isbutton
                        ? SpinkitWave()
                        : ButtonStaic(
                            context: context,
                            onTap: () {
                              // cubit.chaingBoolean(true);
                              if (cubit.p1 == true && cubit.p2 == false) {
                                Navigator.push<void>(
                                  context,
                                  MaterialPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        TodayActionsScreen(
                                      cubit: cubit,
                                    ),
                                  ),
                                );
                              }
                              if (cubit.p2 == true && cubit.p1 == false) {
                                Navigator.push<void>(
                                  context,
                                  MaterialPageRoute<void>(
                                    builder: (BuildContext context) => ActionsM(
                                      cubit1: cubit,
                                    ),
                                  ),
                                );
                              }
                            },
                            title: "Upcoming Auctions",
                          )
                  ]),
                ),
              ),
              floatingActionButton: FloatingActionButton(
                backgroundColor: Color0,
                onPressed: () {
                  // AddAuctions
                  Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => AddAuctions(),
                    ),
                  ); // تعليمات عند النقر على الزر العائم
                },
                child: Icon(
                  Icons.add,
                  color: Color3,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Container textWidght(double width, double height) {
    return Container(
      width: width * 0.80,
      height: height * 0.05,
      // color: Colors.red,
      child: text(
          title: 'As a result, there are no auctions today',
          color: Color.fromRGBO(0, 0, 0, 0.87),
          fontSize: 16,
          textAlign: TextAlign.center,
          fontWeight: FontWeight.w600),
    );
  }

  ChoiceChip ChoiceChipWidght(
      {required double width,
      required double height,
      required AuctionCalenderCubit cubit,
      required String title,
      required bool selected,
      void Function(bool)? onSelected}) {
    return ChoiceChip(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.elliptical(0, 0),
          topLeft: Radius.elliptical(0, 0),
          topRight: Radius.elliptical(20, 20),
          bottomLeft: Radius.elliptical(20, 20),
        ),
      ),
      label: Container(
        width: width * 0.70,
        height: height * 0.05,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: text(
                title: title,
                color: Color0,
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
      selected: selected,
      onSelected: onSelected,
      selectedShadowColor: Color0,
      checkmarkColor: Color0,
      selectedColor: Color.fromARGB(152, 0, 0, 0),
      shadowColor: Color0.withOpacity(0.4),
    );
  }
}
