import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:thi/Health%20care/Profile/ProfileDocor.dart';
import 'package:thi/Health%20care/ScreensHealth/Screen1.dart';
import 'package:thi/Health%20care/ScreensHealth/Screen2.dart';
import 'package:thi/Health%20care/deatils/cubit/details_health_cubit.dart';
import 'package:thi/Health%20care/veternaty/verternaty.dart';
import 'package:thi/Reservations/Location/locationStabe.dart';
import 'package:thi/component/Widght.dart';
import 'package:thi/component/conset/Const.dart';
import 'package:thi/sharePreferinces/shardprefericences.dart';

// class HealthCenterDetailsScreen extends StatefulWidget {
//   const HealthCenterDetailsScreen({Key? key}) : super(key: key);

//   @override
//   State<HealthCenterDetailsScreen> createState() => _W8State();
// }

// ignore: must_be_immutable
class HealthCenterDetailsScreen extends StatelessWidget {
  // ignore: unused_field
  int _selectedButton = 0;
  final int ID_helthCare;
  // ignore: unused_field
  List<bool> _isSelected = [true, false, false];

  final List<HealthDoctor> healthCenters = [
    HealthDoctor(
      name: 'Mona',
      imageUrl: 'assets/images/m.png',
    ),
    HealthDoctor(
      name: 'Omar',
      imageUrl: 'assets/images/large-Smile-Guy-web.png',
    ),
    HealthDoctor(
      name: 'Mohammed',
      imageUrl: 'assets/images/mm.png',
    ),
    HealthDoctor(
      name: 'Nour',
      imageUrl: 'assets/images/images.png',
    ),
    // يمكنك إضافة المزيد من المراكز الصحية هنا
  ];
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

  HealthCenterDetailsScreen({super.key, required this.ID_helthCare});
  @override
  Widget build(BuildContext context) {
    print(ID_helthCare.toString() + "666666666666666666666666666");
    return BlocProvider(
      create: (context) => DetailsHealthCubit()
        ..getHomeHelthCare(Id_Details: ID_helthCare)
        ..getallDoctors(Id_Details: ID_helthCare)
        ..getRatingID(
            Helth_id: ID_helthCare,
            Profile_id: CachShpreafapp.getdata(key: "ProfileID"))
        ..getDataGetAverageRevewModel(ID_helthCare)
        ..configurePusher1(Helth_id: ID_helthCare),
      child: BlocConsumer<DetailsHealthCubit, DetailsHealthState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = DetailsHealthCubit.getObject(context);
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.46,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(71, 181, 255, 1), // اللون الأصلي

                        Color.fromRGBO(71, 181, 255, 1), // اللون الأصلي
                        Color.fromRGBO(199, 255, 255, 1), // اللون المتناسق
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      // BoxShadow(
                      //   color: Color.fromRGBO(71, 181, 255, 0.192),
                      //   spreadRadius: 5,
                      //   blurRadius: 7,
                      //   offset: Offset(2, -6),
                      // ),
                    ],
                  ),
                  // color: Colors.yellow,
                  child: cubit.healthCaresByIDModel == null
                      ? Container()
                      : Stack(children: [
                          cubit.healthCaresByIDModel!.healthCare == null
                              ? Container()
                              : Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.4,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(40),
                                        bottomRight: Radius.circular(40)),
                                    image: DecorationImage(
                                        image: NetworkImage(ImagesPath +
                                            cubit.healthCaresByIDModel!
                                                .healthCare!.profileImage
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
                                    color: Colors.white,
                                  )),
                              title: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * .12,
                                  width: MediaQuery.of(context).size.width,
                                  // color: Colors.yellow,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.0),
                                      color: Colors.black.withOpacity(0.3)),
                                  clipBehavior: Clip.hardEdge,

                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        cubit.healthCaresByIDModel!
                                                    .healthCare ==
                                                null
                                            ? Container()
                                            : Container(
                                                child: text(
                                                    title: cubit
                                                        .healthCaresByIDModel!
                                                        .healthCare!
                                                        .name
                                                        .toString(),
                                                    // "Godolphin Stables",
                                                    color: Color3,
                                                    fontSize: 22,
                                                    fontWeight:
                                                        FontWeight.w900),
                                              ),
                                        cubit.healthCaresByIDModel!
                                                    .healthCare ==
                                                null
                                            ? Container()
                                            : text(
                                                title: cubit
                                                    .healthCaresByIDModel!
                                                    .healthCare!
                                                    .website
                                                    .toString(),
                                                // "Horse riding in Abu Dhabi",
                                                color: Color3,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
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
                                      title: cubit.getAverageRevewModel == null
                                          ? "0"
                                          : cubit.getAverageRevewModel!
                                              .averageRating
                                              .toString(),
                                      color: Colors.white,
                                    )),
                                // IconButton(
                                //     onPressed: () {
                                //       // cubit.chaingFavorite();
                                //       CachShpreafapp.getdata(
                                //               key:
                                //                   "boolfavoratie${CachShpreafapp.getdata(key: "UserID")}${cubit.clubIDModel!.club!.id}")
                                //           ? cubit.postRemoveFavoratie(
                                //               Id,
                                //               CachShpreafapp.getdata(
                                //                   key: "UserID"))
                                //           : cubit.postFavoratie(
                                //               Id,
                                //               CachShpreafapp.getdata(
                                //                   key: "UserID"));
                                //     },
                                //     icon: CachShpreafapp.getdata(
                                //             key:
                                //                 "boolfavoratie${CachShpreafapp.getdata(key: "UserID")}${cubit.clubIDModel!.club!.id}")
                                //         ? Icon(
                                //             Icons.favorite,
                                //             color: Colors.red,
                                //             size: 35,
                                //           )
                                //         : Icon(
                                //             Icons.favorite_border_outlined,
                                //             color: Color3,
                                //             size: 35,
                                //           ))
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
                                        Navigator.push<void>(
                                          context,
                                          MaterialPageRoute<void>(
                                            builder: (BuildContext context) =>
                                                VeterinaryConsultationScreen(
                                              id_HelthCare: cubit
                                                  .healthCaresByIDModel!
                                                  .healthCare!
                                                  .id!,
                                              // Idcubit: Id,
                                            ),
                                          ),
                                        );
                                      },
                                      title: "verternaty",
                                      icon: Icons.vertical_shades),
                                  ButtonBookandDirectionandShare(
                                      context: context,
                                      onTap: () {
                                        Navigator.push<void>(
                                          context,
                                          MaterialPageRoute<void>(
                                            builder: (BuildContext context) =>
                                                LocationStable(
                                              latitude: double.parse(cubit
                                                  .healthCaresByIDModel!
                                                  .healthCare!
                                                  .lat!),
                                              // 24.4539,
                                              longitude: double.parse(cubit
                                                  .healthCaresByIDModel!
                                                  .healthCare!
                                                  .long!),
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
                  height: MediaQuery.of(context).size.height * 0.80,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.32,
                          // color: Color.fromRGBO(90, 60, 98, 0.15),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromRGBO(71, 181, 255, 1), // اللون الأصلي
                                Color.fromRGBO(
                                    199, 255, 255, 1), // اللون المتناسق
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),

                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),

                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.007,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    height: MediaQuery.of(context).size.height *
                                        0.06,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      gradient: LinearGradient(
                                        colors: [
                                          Color.fromRGBO(
                                              71, 181, 255, 1), // اللون الأصلي
                                          Color.fromRGBO(199, 255, 255,
                                              1), // اللون المتناسق
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                    ),
                                    child: Center(
                                      child: text(
                                          title: "Veterinarians",
                                          color: Color3,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.005,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.1919999,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    clipBehavior: Clip.antiAlias,
                                    child: cubit.allDoctorsModel == null
                                        ? Container()
                                        : ListView.separated(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: cubit.allDoctorsModel!
                                                .doctors!.length,
                                            separatorBuilder:
                                                (BuildContext context,
                                                        int index) =>
                                                    SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.03,
                                            ),
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    Navigator.push<void>(
                                                      context,
                                                      MaterialPageRoute<void>(
                                                        builder: (BuildContext
                                                                context) =>
                                                            ProfileDoctor(
                                                          ID_Doctor: cubit
                                                              .allDoctorsModel!
                                                              .doctors![index]
                                                              .id!,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: Column(
                                                    children: [
                                                      Center(
                                                        child: Stack(
                                                          alignment: Alignment
                                                              .bottomLeft,
                                                          children: [
                                                            // CircleAvatar(
                                                            //   radius: 33,
                                                            //   backgroundColor: Color0,
                                                            // ),
                                                            // CircleAvatar(
                                                            //   radius: 31,
                                                            //   backgroundColor: Colors.white,
                                                            // ),
                                                            Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.3,
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.17,

                                                              decoration: BoxDecoration(
                                                                  color: Color0,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10.0)),
                                                              // radius: 28,
                                                              clipBehavior: Clip
                                                                  .antiAlias,
                                                              // backgroundColor: Colors.transparent,

                                                              //////////////////////////////////
                                                              child:
                                                                  Image.network(
                                                                ImagesPath +
                                                                    cubit
                                                                        .allDoctorsModel!
                                                                        .doctors![
                                                                            index]
                                                                        .image
                                                                        .toString(),
                                                                fit: BoxFit
                                                                    .cover,
                                                                // width: MediaQuery.of(context).size.width,
                                                                // height: MediaQuery.of(context).size.height,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Container(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            5),
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.0),
                                                                    color: Color0
                                                                        .withOpacity(
                                                                            0.7)),
                                                                child: text(
                                                                    title: cubit
                                                                        .allDoctorsModel!
                                                                        .doctors![
                                                                            index]
                                                                        .firstName
                                                                        .toString(),
                                                                    color:
                                                                        Color4,
                                                                    fontSize:
                                                                        12,
                                                                    // textAlign: TextAlign.center,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),

                                                      ////////////////////////////
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                  ),
                                  // SizedBox(
                                  //   height: 40,
                                  // ),
                                ]),
                          ),
                        ),
                        /////////////////////
                        Container(
                          height: 700,
                          // color: Colors.pink,
                          child: DefaultTabController(
                              length: 2,
                              child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height *
                                      0.312,
                                  // color: Colors.pink,
                                  child: Column(children: [
                                    Container(
                                      color: Color.fromRGBO(
                                          71, 181, 255, 1), // اللون الأصلي

                                      child: TabBar(
                                        labelColor: Color3,
                                        indicatorColor: Color3,
                                        unselectedLabelColor:
                                            Color.fromRGBO(5, 0, 0, 0.5),
                                        tabs: [
                                          Tab(text: 'About'),
                                          Tab(text: 'Review'),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: TabBarView(
                                        children: [
                                          ScreenHealth1(
                                            detailsHealthCubit: cubit,
                                          ),
                                          /////////////////////////// edit
                                          ScreenHealth2(
                                            health_id: ID_helthCare,
                                            cubit: cubit,
                                          )
                                        ],
                                      ),
                                    ),
                                  ]))),
                        ),
                      ],
                    ),
                  ),
                ),
                /////////////////
                SizedBox(
                  height: 60,
                  child: Container(color: Colors.transparent),
                )
              ]),
            ),
          );
        },
      ),
    );
  }
}

class HealthDoctor {
  late final String name;

  late final String imageUrl;

  HealthDoctor({
    required this.name,
    required this.imageUrl,
  });
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
            fontSize: 16,
            fontWeight: FontWeight.w400)
      ],
    ),
  );
}
