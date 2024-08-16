import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thi/Auction/AuctionCalender/cubit/auction_calender_cubit.dart';
import 'package:thi/Auction/Auctions/cubit/auctions_cubit.dart';
import 'package:thi/Auction/FilterScreen/filterScreen.dart';
import 'package:thi/component/Widght.dart';
import 'package:thi/component/conset/Const.dart';

class ActionsM extends StatefulWidget {
  const ActionsM({Key? key, required this.cubit1}) : super(key: key);
  final AuctionCalenderCubit cubit1;
  @override
  State<ActionsM> createState() => _ActionsMState();
}

class _ActionsMState extends State<ActionsM> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (context) => AuctionsCubit(),
      child: BlocConsumer<AuctionsCubit, AuctionsState>(
        listener: (context, state) {},
        builder: (context, state) {
          // ignore: unused_local_variable
          final cubit = AuctionsCubit.getObject(context);
          return SafeArea(
            child: Container(
              height: height,
              width: width,
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
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Color0,
                        size: 30,
                      )),
                  title: Center(
                    child: Container(
                      child: text(
                          title: "Auctions Calendar",
                          color: Color0,
                          fontSize: 20,
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  actions: [
                    Container(
                      width: width * 0.1,
                    )
                  ],
                ),
                body: Container(
                  child: Column(
                    children: [
                      Divider(
                        color: Color.fromRGBO(50, 52, 70, 1),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.90,
                        height: MediaQuery.of(context).size.height * 0.80,
                        child: widget.cubit1.getUpcomingActions!.dates == null
                            ? Center(child: text(title: "Not Found"))
                            : ListView.builder(
                                itemBuilder: ((context, index) {
                                  return widget.cubit1.getUpcomingActions ==
                                          null
                                      ? Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ShimerWidght(
                                            height: height * 0.2,
                                            width: width * 0.90,
                                          ),
                                        )
                                      : CardWidght(
                                          context: context,
                                          subtitle: widget
                                              .cubit1
                                              .getUpcomingActions!
                                              .dates![index]
                                              .beginTime
                                              .toString(),
                                          title:
                                              "“Start of Season Auction 2024”",
                                          assetName: 'assets/images/img_21.png',
                                          onTap: () {
                                            Navigator.push<void>(
                                              context,
                                              MaterialPageRoute<void>(
                                                builder:
                                                    (BuildContext context) =>
                                                        filterScreen(
                                                  date: widget
                                                      .cubit1
                                                      .getUpcomingActions!
                                                      .dates![index]
                                                      .beginTime
                                                      .toString(),
                                                ),
                                              ),
                                            );
                                          });
                                }),
                                itemCount: widget
                                    .cubit1.getUpcomingActions!.dates!.length,
                              ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Padding CardWidght(
      {BuildContext? context,
      void Function()? onTap,
      String? assetName,
      required String title,
      required String subtitle}) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: onTap ?? () {},
          child: Card(
            color: Color0.withOpacity(0.7),
            shadowColor: Color0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 4,
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context!).size.width,
                  height: MediaQuery.of(context).size.height * 0.25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color4,
                    image: DecorationImage(
                      image:
                          AssetImage(assetName ?? 'assets/images/img_21.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      text(
                          title: title,
                          color: Color3.withOpacity(0.8),
                          fontSize: 18,
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w900),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.06),
                      Spacer(),
                      Row(
                        children: [
                          Icon(
                            Icons.date_range_outlined,
                            color: Color3.withOpacity(0.8),
                            size: 35,
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.07),
                          text(
                              title: subtitle,
                              color: Color3.withOpacity(0.8),
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
