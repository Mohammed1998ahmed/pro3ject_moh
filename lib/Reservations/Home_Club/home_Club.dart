// ignore_for_file: must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thi/Reservations/Home/cubit/main_screen_cubit.dart';
import 'package:thi/Reservations/Home_Club/cubit/home1_cubit.dart';
import 'package:thi/Reservations/Details_Club/Home.dart';
import 'package:thi/Reservations/nearby_screen/nearby_screen.dart';
import 'package:thi/component/Widght.dart';
import 'package:thi/component/conset/Const.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class Home1 extends StatelessWidget {
  Home1({Key? key}) : super(key: key);
  bool istoggel = true;
  bool loadingSearch = true;
  int currentIndex = 0;
  final List<String> images = [
    'assets/images/clinic18.jpg',
    'assets/images/gp-bargersville-veterinary-hospital-storefront.png',
    'assets/images/08F30214-35C7-4649-87DC-CA789BD029E9.jpeg',
    'assets/images/49772470_1779640922140641_3989261213316939776_n.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Home1Cubit()
        ..getDataClubList()
        ..getDateGaregories()
        ..configurePusher()
        ..getHomeHelthOffers(),
      child: BlocConsumer<Home1Cubit, Home1State>(
        listener: (context, state) {
          if (state is Home1SearchClubLoading) {
            loadingSearch = true;
          }

          if (state is Home1SearchClubError) {
            istoggel = false;
          }
          if (state is Home1SearchClubSueccsufuly) {
            istoggel = true;
            loadingSearch = false;
          }
        },
        builder: (context, state) {
          final cubit = Home1Cubit.getObject(context);
          // ignore: unused_local_variable
          final cubitMainScreen = MainScreenCubit.getObject(context);
          double width = MediaQuery.of(context).size.width;
          double height = MediaQuery.of(context).size.height;
          return cubit.shimmer == true
              ? ShimmerWidght(width: width, height: height)
              : LiquidPullToRefresh(
                  onRefresh: () async {
                    cubit.getDataClubList();
                  },
                  animSpeedFactor: 3.0,
                  backgroundColor: Color0,
                  borderWidth: 3.0,
                  height: height * 0.3,
                  springAnimationDurationInMilliseconds: 2000,
                  color: Color4,
                  showChildOpacityTransition: false,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    height: double.infinity,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: height * 0.02,
                          ),
                          // text(
                          //   title: "Find and book best services",
                          //   fontSize: 22,
                          //   fontWeight: FontWeight.w700,
                          //   color: Color(0xFF23002C),
                          //   textAlign: TextAlign.center,
                          // ),
                          // SizedBox(
                          //   height: height * 0.02,
                          // ),
                          // SeachWidght(
                          //     height: height,
                          //     SeachController: cubit.SeachController,
                          //     cubit: cubit),
                          cubit.alloffersModel == null
                              ? Container()
                              : cubit.alloffersModel!.offers == null
                                  ? Container()
                                  : Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.24,
                                      width: double.infinity,
                                      child: CarouselSlider(
                                        options: CarouselOptions(
                                          reverse: true,
                                          height: height * 0.24,
                                          autoPlay: true,
                                          aspectRatio: 3,
                                          enlargeCenterPage: true,
                                          onPageChanged: (index, reason) {
                                            //////////////////////////edit edit
                                            // setState(() {
                                            //   currentIndex = index;
                                            //   print(currentIndex.toString());
                                            // });
                                          },
                                        ),
                                        items: cubit.alloffersModel!.offers!
                                            .map(
                                              (offer) => Stack(
                                                alignment: AlignmentDirectional
                                                    .bottomStart,
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0),
                                                    ),
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    child: Image.network(
                                                      ImagesPath +
                                                          offer.image
                                                              .toString(),
                                                      height: height * 0.24,
                                                      width: double.infinity,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height: height * 0.09,
                                                    alignment: Alignment.center,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 6),
                                                    child: Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                      10),
                                                          child: Row(
                                                            children: [
                                                              Expanded(
                                                                child: text(
                                                                    title:
                                                                        "${offer.name}",
                                                                    color:
                                                                        Color0,
                                                                    fontSize:
                                                                        20),
                                                              ),
                                                              Expanded(
                                                                child: text(
                                                                    title:
                                                                        "${offer.offerValue}% OFF",
                                                                    color:
                                                                        Color3,
                                                                    fontSize:
                                                                        15),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Row(
                                                          children: [
                                                            text(
                                                                title:
                                                                    "  Begin: ",
                                                                color: Color0,
                                                                fontSize: 15),
                                                            Expanded(
                                                              child: text(
                                                                  title:
                                                                      "${offer.begin}",
                                                                  color: Color3,
                                                                  fontSize: 15),
                                                            ),
                                                            text(
                                                                title:
                                                                    "  end: ",
                                                                color: Color0,
                                                                fontSize: 15),
                                                            Expanded(
                                                              child: text(
                                                                  title:
                                                                      "${offer.end}",
                                                                  color: Color3,
                                                                  fontSize: 15),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    decoration: BoxDecoration(
                                                        color: Color4
                                                            .withOpacity(0.5),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        15.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        15.0))),
                                                  )
                                                ],
                                              ),
                                            )
                                            .toList(),
                                      ),
                                    ),
                          SizedBox(
                            height: height * 0.015,
                          ),
                          CatagorStable(),
                          CatagoryWidght(
                              height: height, width: width, cubit: cubit),
                          SizedBox(
                            height: height * 0.0112,
                          ),
                          BestStables(),
                          cubit.SeachController.text.isNotEmpty
                              ? cubit.istoggel
                                  ? BestStablesSearchWidght(
                                      height: height,
                                      home1state: state,
                                      width: width,
                                      cubit: cubit)
                                  : Container(
                                      height: height * 0.2,
                                      alignment: Alignment.center,
                                      child: text(
                                          title: "Not Found",
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          textAlign: TextAlign.center),
                                    )
                              : BestStablesWidght(
                                  height: height, width: width, cubit: cubit),
                        ],
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }
}

class BestStablesWidght extends StatelessWidget {
  const BestStablesWidght({
    super.key,
    required this.height,
    required this.width,
    required this.cubit,
  });

  final double height;
  final double width;
  final Home1Cubit cubit;

  @override
  Widget build(BuildContext context) {
    return cubit.listClubsmodel == null
        ? SpinkitWave()
        : Container(
            height: height * 0.35,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, i) {
                // reviewRaiting.add(false);
                // reviewRaiting.add(i)
                // reviewRaiting.addAll(i, false);
                // reviewRaiting[i] = false;
                reviewRaiting.addAll({i + 1: false});
                print(reviewRaiting.toString() +
                    "((((((((((((((((((((((9999999999999))))))))))))))))))))))");
                // cubit.getDataGetAverageRevewModel(
                //     cubit.listClubsmodel!.data![i].id!);
                return GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => Home(
                          Id: int.parse(
                              cubit.listClubsmodel!.data![i].id.toString()),
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: width * 0.55,
                    height: height,
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    decoration: BoxDecoration(
                      // color: Color.fromRGBO(71, 181, 255, 0.685),
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(40, 168, 253, 1),
                          Color.fromRGBO(71, 181, 255, 1), // اللون الأصلي
                          Color.fromRGBO(199, 255, 255, 1), // اللون المتناسق
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Container(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    print(cubit.listClubsmodel!.data![i].id
                                            .toString() +
                                        "KKKKKKKKKKKKKKKKKKKKKKKKKKKKK");
                                    Navigator.push<void>(
                                      context,
                                      MaterialPageRoute<void>(
                                        builder: (BuildContext context) => Home(
                                            Id: cubit
                                                .listClubsmodel!.data![i].id!),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.17,
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(40, 168, 253, 1),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            ImagesPath +
                                                cubit.listClubsmodel!.data![i]
                                                    .profile
                                                    .toString(),
                                          ),
                                          fit: BoxFit.fill),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: text(
                                            title: cubit
                                                .listClubsmodel!.data![i].name
                                                .toString(),
                                            color: Color3,
                                            fontWeight: FontWeight.bold,
                                            //  "Al Jiyad Stables",
                                            overflow: TextOverflow.ellipsis,
                                            softWrap: true,
                                            maxLines: 1,
                                            fontSize: 17),
                                      ),
                                    ),
                                    // TextButton.icon(
                                    //     onPressed: () {},
                                    //     icon: Icon(
                                    //       Icons.star_rate,
                                    //       color: Colors.amber,
                                    //     ),
                                    //     label: text(
                                    //       title: cubit.getAverageRevewModel!
                                    //           .averageRating
                                    //           .toString(),
                                    //       color: Colors.black,
                                    //     ))
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: text(
                                    title: cubit
                                        .listClubsmodel!.data![i].description
                                        .toString(),
                                    // "288 McClure Court, Arkansasgffrehhhheeeeee",
                                    fontSize: 14,
                                    color: Colors.white60,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                    maxLines: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Positioned(
                        //   child: InkWell(
                        //     onTap: (() {
                        //       Navigator.push<void>(
                        //         context,
                        //         MaterialPageRoute<void>(
                        //           builder: (BuildContext context) =>
                        //               BookingScreen(),
                        //         ),
                        //       );
                        //     }),
                        //     child: Container(
                        //       padding: EdgeInsets.symmetric(
                        //           vertical: 5, horizontal: 10),
                        //       decoration: BoxDecoration(
                        //           color: Colors.white,
                        //           border: Border.all(color: Colors.grey),
                        //           borderRadius: BorderRadius.only(
                        //               bottomRight: Radius.circular(10),
                        //               topLeft: Radius.circular(10))),
                        //       child: text(
                        //         title: "Book",
                        //         fontSize: 14,
                        //       ),
                        //     ),
                        //   ),
                        //   bottom: 0,
                        //   right: 0,
                        // ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: cubit.listClubsmodel!.data!.length,
            ),
          );
  }
}

class BestStablesSearchWidght extends StatelessWidget {
  const BestStablesSearchWidght({
    super.key,
    required this.height,
    required this.width,
    required this.cubit,
    required this.home1state,
  });

  final double height;
  final double width;
  final Home1Cubit cubit;
  final Home1State home1state;
  @override
  Widget build(BuildContext context) {
    return home1state is Home1SearchClubLoading
        ? Center(child: SpinkitWave())
        : Container(
            height: height * 0.35,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, i) {
                // reviewRaiting.add(false);
                // print(reviewRaiting.toString() +
                //     "((((((((((((((((((((((9999999999999))))))))))))))))))))))");
                // cubit.getDataGetAverageRevewModel(
                //     cubit.listClubsmodel!.data![i].id!);
                return GestureDetector(
                  onTap: () {
                    Navigator.push<void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => Home(
                          Id: int.parse(
                              cubit.getSearchModel!.clubs![i].id.toString()),
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: width * 0.55,
                    height: height,
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(71, 181, 255, 0.753),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(71, 181, 255, 0.753),
                              blurRadius: 5,
                              offset: Offset(3, 5))
                        ]),
                    child: Stack(
                      children: [
                        Container(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push<void>(
                                      context,
                                      MaterialPageRoute<void>(
                                        builder: (BuildContext context) => Home(
                                            Id: int.parse(cubit
                                                .getSearchModel!.clubs![i].id
                                                .toString())),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.17,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            ImagesPath +
                                                cubit.getSearchModel!.clubs![i]
                                                    .profile
                                                    .toString(),
                                          ),
                                          fit: BoxFit.fill),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: text(
                                            title: cubit
                                                .getSearchModel!.clubs![i].name
                                                .toString(),
                                            color: Color4,
                                            fontWeight: FontWeight.bold,
                                            //  "Al Jiyad Stables",
                                            overflow: TextOverflow.ellipsis,
                                            softWrap: true,
                                            maxLines: 1,
                                            fontSize: 17),
                                      ),
                                    ),
                                    // TextButton.icon(
                                    //     onPressed: () {},
                                    //     icon: Icon(
                                    //       Icons.star_rate,
                                    //       color: Colors.amber,
                                    //     ),
                                    //     label: text(
                                    //       title: cubit.getAverageRevewModel!
                                    //           .averageRating
                                    //           .toString(),
                                    //       color: Colors.black,
                                    //     ))
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: text(
                                    title: cubit
                                        .getSearchModel!.clubs![i].description
                                        .toString(),
                                    // "288 McClure Court, Arkansasgffrehhhheeeeee",
                                    fontSize: 12,
                                    color: Color4,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                    maxLines: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Positioned(
                        //   child: InkWell(
                        //     onTap: (() {
                        //       Navigator.push<void>(
                        //         context,
                        //         MaterialPageRoute<void>(
                        //           builder: (BuildContext context) =>
                        //               BookingScreen(),
                        //         ),
                        //       );
                        //     }),
                        //     child: Container(
                        //       padding: EdgeInsets.symmetric(
                        //           vertical: 5, horizontal: 10),
                        //       decoration: BoxDecoration(
                        //           color: Colors.white,
                        //           border: Border.all(color: Colors.grey),
                        //           borderRadius: BorderRadius.only(
                        //               bottomRight: Radius.circular(10),
                        //               topLeft: Radius.circular(10))),
                        //       child: text(
                        //         title: "Book",
                        //         fontSize: 14,
                        //       ),
                        //     ),
                        //   ),
                        //   bottom: 0,
                        //   right: 0,
                        // ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: cubit.getSearchModel!.clubs!.length,
            ),
          );
  }
}

class BestStables extends StatelessWidget {
  const BestStables({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.35,
          height: MediaQuery.of(context).size.height * 0.05,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            // color: Color.fromRGBO(71, 181, 255, 0.952)
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(40, 168, 253, 1),
                Color.fromRGBO(71, 181, 255, 1), // اللون الأصلي
                Color.fromRGBO(134, 255, 255, 1), // اللون المتناسق
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: text(
              title: "Best Stables",
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Color3,
            ),
          ),
        ),
        // TextButton(
        //   onPressed: () {},
        //   child: text(
        //       title: "View all",
        //       color: Color4,
        //       fontSize: 16,
        //       fontWeight: FontWeight.w600),
        // )
      ],
    );
  }
}

class CatagoryWidght extends StatelessWidget {
  const CatagoryWidght({
    super.key,
    required this.height,
    required this.width,
    required this.cubit,
  });

  final double height;
  final double width;
  final Home1Cubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: cubit.gategoriesModel == null
          ? SpinkitWave()
          : Container(
              height: height * 0.2,
              width: width * 0.90,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, i) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push<void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => NearbyScreen(
                            IdCategoires:
                                cubit.gategoriesModel!.categories![i].id!,
                          ),
                        ),
                      ); // print("object");
                      // setState(() {
                      //   about = false;
                      // });
                      cubit.chaingBoolean(false);
                      print(cubit.about.toString() + "mmmmmmmmm");
                    },
                    child: Container(
                      height: height * 0.2,
                      width: width * 0.20,
                      padding: EdgeInsets.all(2),
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      decoration: BoxDecoration(
                        // color: Color.fromRGBO(71, 181, 255, 0.685),
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(40, 168, 253, 1),
                            Color.fromRGBO(71, 181, 255, 1), // اللون الأصلي
                            Color.fromRGBO(199, 255, 255, 1), // اللون المتناسق
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              height: MediaQuery.of(context).size.height * 0.1,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        ImagesPath +
                                            cubit.gategoriesModel!
                                                .categories![i].image
                                                .toString(),
                                      ),
                                      fit: BoxFit.cover)),
                            ),
                            // Image.network(
                            //   ImagesPath +
                            //       cubit.gategoriesModel!.categories![i].image
                            //           .toString(),
                            //   width: MediaQuery.of(context).size.width * 0.4,
                            //   height: MediaQuery.of(context).size.height * 0.1,
                            //   fit: BoxFit.contain,
                            // ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Container(
                              child: text(
                                title: cubit
                                    .gategoriesModel!.categories![i].name
                                    .toString(),
                                fontSize: 12,
                                maxLines: 2,
                                fontWeight: FontWeight.w600,
                                overflow: TextOverflow.ellipsis,
                                color: Color3,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: cubit.gategoriesModel!.categories!.length,
              ),
            ),
    );
  }
}

class CatagorStable extends StatelessWidget {
  const CatagorStable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.35,
          height: MediaQuery.of(context).size.height * 0.05,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(40, 168, 253, 1),
                Color.fromRGBO(71, 181, 255, 1), // اللون الأصلي
                Color.fromRGBO(134, 255, 255, 1), // اللون المتناسق
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: text(
              title: "Top categories",
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Color3,
            ),
          ),
        ),
        // TextButton(
        //   onPressed: () {},
        //   child: text(
        //       title: "View all", fontSize: 16, fontWeight: FontWeight.w600),
        // ),
      ],
    );
  }
}

class SeachWidght extends StatelessWidget {
  const SeachWidght({
    super.key,
    required this.height,
    required this.SeachController,
    required this.cubit,
  });

  final double height;
  final TextEditingController SeachController;
  final Home1Cubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 9),
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.passthrough,
        children: [
          Container(
            height: height * 0.07,
            // width: MediaQuery.of(context).size.width *
            //     0.99,
            padding: EdgeInsets.symmetric(horizontal: 35),
            child: Search(
              SeachController: SeachController,
              cubit: cubit,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              GestureDetector(
                onTap: () {
                  // cubit.chaingLoading(false);

                  print(SeachController.text +
                      "OOOOOOOOOOOOOOOOOOOOOOOOOOOPPPPPPPPPPPPPPPPPPPIIIIIIIIII");
                  cubit.getDataSearch(SeachController.text.isEmpty
                      ? '0'
                      : SeachController.text);
                  // SeachController.clear();
                  print("search");
                },
                child: cubit.isLoad
                    ? SpinkitWave()
                    : CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 30,
                        child: Icon(
                          Icons.search_rounded,
                          color: Color0,
                          size: 35,
                        ),
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Search extends StatelessWidget {
  const Search({
    super.key,
    required this.SeachController,
    required this.cubit,
  });

  final TextEditingController SeachController;
  final Home1Cubit cubit;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: SeachController,
      onChanged: (value) {
        print(value.toString());

        // cubit.getDataSearch(search: value);
      },
      decoration: InputDecoration(
          // contentPadding: EdgeInsets.all(5),
          fillColor: Color0,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2),
            borderSide: BorderSide(color: LinearGradientColor01),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Color0)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Color0)),
          // prefixIcon: Icon(
          //   Icons.search_rounded,
          //   color: Colors.black,
          // ),
          hintText: "    Search  Stable",
          hintStyle: TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontFamily: 'Caveat',
              fontWeight: FontWeight.w600)),
    );
  }
}

class ShimmerWidght extends StatelessWidget {
  const ShimmerWidght({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                ShimerWidght(
                  width: 50,
                  height: 50,
                ),
                SizedBox(
                  width: width * 0.2,
                ),
                ShimerWidght(
                  width: 80,
                  height: 50,
                ),
                SizedBox(
                  width: width * 0.13,
                ),
                ShimerWidght(
                  width: 40,
                  height: 50,
                ),
                SizedBox(
                  width: width * 0.03,
                ),
                ShimerWidght(
                  width: 40,
                  height: 50,
                ),
              ],
            ),
            SizedBox(
              height: height * 0.02,
            ),
            ShimerWidght(
              width: width * 0.8,
              height: height * 0.06,
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Stack(
              alignment: Alignment.centerRight,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ShimerWidght(
                    width: width * 0.750,
                    height: height * 0.07,
                  ),
                ),
                ShimerWidght(
                  width: width * 0.20,
                  height: height * 0.09,
                  reduis: 50,
                ),
              ],
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Row(
              children: [
                ShimerWidght(
                  width: width * 0.30,
                  height: height * 0.04,
                ),
                Spacer(),
                ShimerWidght(
                  width: width * 0.20,
                  height: height * 0.04,
                ),
              ],
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Container(
              width: width,
              height: height * 0.2,
              child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext, int) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ShimerWidght(
                        width: width * 0.20,
                        height: height * 0.02,
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Row(
              children: [
                ShimerWidght(
                  width: width * 0.30,
                  height: height * 0.04,
                ),
                Spacer(),
                ShimerWidght(
                  width: width * 0.20,
                  height: height * 0.04,
                ),
              ],
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Container(
              width: width,
              height: height * 0.2,
              child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext, int) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ShimerWidght(
                        width: width * 0.60,
                        height: height * 0.02,
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
  // Container(
                        //   padding: EdgeInsets.symmetric(vertical: 10),
                        //   width: double.infinity,
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       Builder(
                        //           builder: (context) => IconButton(
                        //               onPressed: () {
                        //                 // Scaffold.of(context).openDrawer();

                        //                 Navigator.push<void>(
                        //                   context,
                        //                   MaterialPageRoute<void>(
                        //                     builder: (BuildContext context) =>
                        //                         DrwerPage(),
                        //                   ),
                        //                 );
                        //               },
                        //               icon: const Icon(
                        //                 Icons.dehaze_rounded,
                        //                 color: Colors.black,
                        //               ))),
                        //       Container(
                        //         padding: EdgeInsets.only(top: 15),
                        //         alignment: Alignment.center,
                        //         child: Text(
                        //           'THI',
                        //           textAlign: TextAlign.center,
                        //           style: TextStyle(
                        //             color: Color0,
                        //             fontSize: 46,
                        //             fontFamily: 'Inter',
                        //             fontWeight: FontWeight.w700,
                        //             height: 0,
                        //           ),
                        //         ),
                        //       ),
                        //       Container(
                        //         child: Row(
                        //           children: [
                        //             Stack(
                        //               alignment: Alignment.centerRight,
                        //               children: [
                        //                 Container(
                        //                   width: 40,
                        //                   child: IconButton(
                        //                       onPressed: () {
                        //                         Navigator.push<void>(
                        //                           context,
                        //                           MaterialPageRoute<void>(
                        //                             builder: (BuildContext context) =>
                        //                                 Notifaction(),
                        //                           ),
                        //                         );
                        //                       },
                        //                       icon: Icon(
                        //                         Icons.notifications_none_outlined,
                        //                         color: Color0,
                        //                         size: 33,
                        //                       )),
                        //                 ),
                        //                 Stack(
                        //                   alignment: Alignment.center,
                        //                   children: [
                        //                     CircleAvatar(
                        //                       radius: 7,
                        //                       backgroundColor: LinearGradientColor02,
                        //                     ),
                        //                     CircleAvatar(
                        //                       radius: 5,
                        //                       backgroundColor: Colors.red,
                        //                     ),
                        //                   ],
                        //                 )
                        //               ],
                        //             ),
                        //             IconButton(
                        //                 onPressed: () {
                        //                   Navigator.of(context).push(
                        //                       MaterialPageRoute(
                        //                           builder: (_) => Filters()));
                        //                 },
                        //                 icon: Icon(
                        //                   Icons.filter_alt,
                        //                   color: Color0,
                        //                   size: 32,
                        //                 ))
                        //           ],
                        //         ),
                        //       )
                        //     ],
                        //   ),
                        // ),