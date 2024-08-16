import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:thi/Reservations/Booking/servic.dart';
import 'package:thi/Reservations/Location/locationStabe.dart';
import 'package:thi/Reservations/Screens/Screen1.dart';
import 'package:thi/Reservations/Screens/Screen2.dart';
import 'package:thi/Reservations/Screens/Screen3.dart';
import 'package:thi/Reservations/Screens/Screen4.dart';
import 'package:thi/Reservations/Details_Club/cubit/home_stable_cubit.dart';
import 'package:thi/component/Widght.dart';
import 'package:thi/component/conset/Const.dart';
import 'package:thi/profile/TrinnerProfile/profile.dart';
import 'package:thi/sharePreferinces/shardprefericences.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  final int Id;

  Home({super.key, required this.Id});
  Future<void> shareText({String? nameStable}) async {
    try {
      await FlutterShare.share(
          title: 'Share',
          text: nameStable ?? "Tlkjkljjjljlj HI",
          chooserTitle: "mohammed ahmed "
          // subject: "subject",
          );
    } catch (e) {
      print('Error sharing: $e');
    }
  }

  bool favorate = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeStableCubit()
        ..getDataClubProfile(Id)
        ..getDataClubProfileTrainer(Id)
        ..getDataClubGetRevewListModel(Id)
        ..getDataGetAverageRevewModel(Id)
        ..configurePusher(id_Club: Id)
        ..configurePusher1(Club_id: Id),
      child: BlocConsumer<HomeStableCubit, HomeStableState>(
        listener: (context, state) {
          if (state is HomeStableValueProfileFavoratieSeccsfuly) {
            favorate = true;
          }
          if (state is HomeStableValueProfileRemoveFavoratieSeccsfuly) {
            favorate = false;
          }
          if (state is Home1EverageClubSueccsufuly) {
            print(
                "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%*******************");
          }
        },
        builder: (context, state) {
          final cubit = HomeStableCubit.getObject(context);
          print(CachShpreafapp.getdata(key: "UserID").toString() +
              "PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP");
          // print(cubit.clubIDModel!.club!.id.toString() +
          //     "ddddddddddddPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP");

          // cubit.getDataClubProfile();
          return Scaffold(
              body: cubit.clubIDModel == null &&
                      cubit.myClubTrenerIDModel == null
                  ? Center(
                      child: SpinkitWave(),
                    )
                  : SingleChildScrollView(
                      child: Column(children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.46,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(71, 181, 255, 0.568),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(255, 199, 99, 0.203),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(2, -6),
                              ),
                            ],
                          ),
                          // color: Colors.yellow,
                          child: Stack(children: [
                            cubit.clubIDModel == null
                                ? Container()
                                : Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.4,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(40),
                                          bottomRight: Radius.circular(40)),
                                      image: DecorationImage(
                                          image: NetworkImage(ImagesPath +
                                              cubit.clubIDModel!.club!.profile
                                                  .toString()),
                                          fit: BoxFit.cover),
                                    ),
                                    // child: Image.asset(
                                    //   'assets/images/main/image 83.png',
                                    //   fit: BoxFit.cover,
                                    //   width: MediaQuery.of(context).size.width,
                                    //   height: MediaQuery.of(context).size.height,
                                    // ),
                                  ),
                            Scaffold(
                              backgroundColor:
                                  const Color.fromARGB(0, 126, 26, 26),
                              appBar: AppBar(
                                backgroundColor:
                                    const Color.fromARGB(0, 82, 6, 6),
                                elevation: 0.0,
                                leading: IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(
                                      Icons.arrow_back,
                                      color: Colors.white,
                                    )),
                                title: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        .12,
                                    width: MediaQuery.of(context).size.width,
                                    // color: Colors.yellow,
                                    child: cubit.clubIDModel == null
                                        ? Center(
                                            child: CircularProgressIndicator(),
                                          )
                                        : Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                                text(
                                                    title: cubit
                                                        .clubIDModel!.club!.name
                                                        .toString(),
                                                    // "Godolphin Stables",
                                                    color: Color3,
                                                    fontSize: 22,
                                                    fontWeight:
                                                        FontWeight.w900),
                                                text(
                                                    title: cubit.clubIDModel!
                                                        .club!.website
                                                        .toString(),
                                                    // "Horse riding in Abu Dhabi",
                                                    color: Color3,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ]),
                                  ),
                                ),
                                actions: [
                                  TextButton.icon(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.star_rate,
                                        color: Colors.amber,
                                      ),
                                      label: text(
                                        title:
                                            cubit.getAverageRevewModel == null
                                                ? "0"
                                                : cubit.getAverageRevewModel!
                                                    .averageRating
                                                    .toString(),
                                        color: Colors.white,
                                      )),
                                  IconButton(
                                      onPressed: () {
                                        final clubId =
                                            cubit.clubIDModel?.club?.id;
                                        final userId = CachShpreafapp.getdata(
                                            key: "UserID");

                                        if (clubId != null && userId != null) {
                                          final isFavorite = CachShpreafapp.getdata(
                                              key:
                                                  "boolfavoratie${CachShpreafapp.getdata(key: "UserID")}$clubId");

                                          if (isFavorite == true) {
                                            cubit.postRemoveFavoratie(
                                                Id, userId);
                                          } else {
                                            cubit.postFavoratie(Id, userId);
                                          }
                                        }
                                        // //cubit.chaingFavorite();
                                        // CachShpreafapp.getdata(
                                        //         key:
                                        //             "boolfavoratie${CachShpreafapp.getdata(key: "UserID")}${cubit.clubIDModel!.club!.id}")
                                        //     ? cubit.postRemoveFavoratie(
                                        //         Id,
                                        //         CachShpreafapp.getdata(
                                        //             key: "UserID"))
                                        //     : cubit.postFavoratie(
                                        //         Id,
                                        //         CachShpreafapp.getdata(
                                        //             key: "UserID"));
                                      },
                                      icon: CachShpreafapp.getdata(
                                                      key:
                                                          "boolfavoratie${CachShpreafapp.getdata(key: "UserID")}${cubit.clubIDModel?.club?.id}")
                                                  as bool? ??
                                              false
                                          ? Icon(
                                              Icons.favorite,
                                              color: Colors.red,
                                              size: 35,
                                            )
                                          : Icon(
                                              Icons.favorite_border_outlined,
                                              color: Color3,
                                              size: 35,
                                            ))
                                ],
                              ),
                              body: Column(children: [
                                Spacer(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ButtonBookandDirectionandShare(
                                        context: context,
                                        onTap: () {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute<void>(
                                              builder: (BuildContext context) =>
                                                  Service(
                                                Idcubit: Id,
                                              ),
                                            ),
                                          );
                                        },
                                        title: "book",
                                        icon: Icons.book),
                                    ButtonBookandDirectionandShare(
                                        context: context,
                                        onTap: () {
                                          Navigator.push<void>(
                                            context,
                                            MaterialPageRoute<void>(
                                              builder: (BuildContext context) =>
                                                  LocationStable(
                                                latitude: double.parse(cubit
                                                    .clubIDModel!.club!.lat!),
                                                // 24.4539,
                                                longitude: double.parse(cubit
                                                    .clubIDModel!.club!.long!),
                                                // 54.3773,
                                              ),
                                            ),
                                          );
                                        },
                                        title: "Direction",
                                        icon: Icons.location_on_outlined),
                                    ButtonBookandDirectionandShare(
                                        context: context,
                                        onTap: () {
                                          shareText(nameStable: "Direction");
                                        },
                                        title: "share",
                                        icon: Icons.share),
                                  ],
                                )
                              ]),
                            )
                          ]),
                        ),
                        //////////////////////////
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.30,
                          // color: Color.fromRGBO(90, 60, 98, 0.15),
                          color: Color.fromRGBO(71, 181, 255, 0.39),

                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // SizedBox(
                                  //   height: 10,
                                  // ),

                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    height: MediaQuery.of(context).size.height *
                                        0.06,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      gradient: LinearGradient(
                                        colors: [
                                          Color.fromRGBO(40, 168, 253, 1),
                                          Color.fromRGBO(
                                              71, 181, 255, 1), // اللون الأصلي
                                          Color.fromRGBO(134, 255, 255,
                                              1), // اللون المتناسق
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                    ),
                                    child: Center(
                                      child: text(
                                          title: "Stable specialists",
                                          color: Color3,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.1719999,
                                    child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      itemCount:
                                          cubit.myClubTrenerIDModel != null
                                              ? cubit.myClubTrenerIDModel!
                                                  .trainers!.length
                                              : 0,
                                      separatorBuilder:
                                          (BuildContext context, int index) =>
                                              SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.03,
                                      ),
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return ListCirclePerson(
                                            context: context,
                                            ImageNetWork: ImagesPath +
                                                cubit.myClubTrenerIDModel!
                                                    .trainers![index].image
                                                    .toString(),
                                            indexImage: index,
                                            title: cubit.myClubTrenerIDModel!
                                                .trainers![index].fName
                                                .toString(),
                                            onTap: () {
                                              Navigator.push<void>(
                                                context,
                                                MaterialPageRoute<void>(
                                                  builder:
                                                      (BuildContext context) =>
                                                          Profile(
                                                    Id_trinner: cubit
                                                        .myClubTrenerIDModel!
                                                        .trainers![index]
                                                        .id!,
                                                    cubit: cubit
                                                        .myClubTrenerIDModel!,
                                                    indexProfile: index,
                                                  ),
                                                ),
                                              );
                                            });
                                      },
                                    ),
                                  ),
                                  // SizedBox(
                                  //   height: 40,
                                  // ),
                                ]),
                          ),
                        ),
                        /////////////////

                        Container(
                          height: MediaQuery.of(context).size.height * .6,
                          // color: Colors.pink,
                          child: DefaultTabController(
                              length: 4,
                              child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  // color: Colors.pink,
                                  child: Column(children: [
                                    Container(
                                      color: Color.fromRGBO(71, 181, 255, 1),
                                      child: TabBar(
                                        labelColor: Color3,
                                        indicatorColor: Color3,
                                        unselectedLabelColor: Color3,
                                        // Color.fromRGBO(5, 0, 0, 0.5),
                                        tabs: [
                                          Tab(text: 'About'),
                                          Tab(text: 'Services'),
                                          Tab(text: 'Gallery'),
                                          Tab(text: 'Review'),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: TabBarView(
                                        children: [
                                          Screen1(
                                            cubit: cubit,
                                          ),
                                          Screen2(
                                            cubit: cubit,
                                          ),
                                          Screen3(
                                            cubit: cubit,
                                          ),
                                          Screen4(
                                            IdClub: Id,
                                            cubit: cubit,
                                          )
                                        ],
                                      ),
                                    ),
                                  ]))),
                        ),
                      ]),
                    ));
        },
      ),
    );
  }

  GestureDetector ButtonBookandDirectionandShare(
      {required BuildContext context,
      void Function()? onTap,
      IconData? icon,
      required String title}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: Colors.white54,
            child: CircleAvatar(
              radius: 26,
              backgroundColor: Color0,
              child: Icon(
                icon ?? Icons.book,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
          text(
              title: title,
              color: Color.fromRGBO(0, 0, 0, 0.54),
              fontSize: 13,
              fontWeight: FontWeight.w400)
        ],
      ),
    );
  }
}
