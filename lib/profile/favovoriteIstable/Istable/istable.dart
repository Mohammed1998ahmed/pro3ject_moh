import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:thi/Reservations/Location/locationStabe.dart';

import 'package:thi/component/Widght.dart';
import 'package:thi/component/conset/Const.dart';
import 'package:thi/profile/favovoriteIstable/cubit/favovrite_cubit.dart';

class Istable extends StatelessWidget {
  const Istable({super.key, required this.favovriteCubit, required this.index});

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

  final FavovriteCubit favovriteCubit;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.46,
          decoration: BoxDecoration(
            color: Color.fromRGBO(71, 181, 255, 0.493),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(71, 181, 255, 0.144),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(2, -6),
              ),
            ],
          ),
          // color: Colors.yellow,
          child: Stack(children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40)),
                image: DecorationImage(
                    image: NetworkImage(ImagesPath +
                        favovriteCubit
                            .getFavoratieModle!.favoriteClubs![index].profile!),
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
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        text(
                            title: favovriteCubit
                                .getFavoratieModle!.favoriteClubs![index].name!,
                            // "Godolphin Stables",
                            color: Color3,
                            fontSize: 22,
                            fontWeight: FontWeight.w900),
                        text(
                            title: favovriteCubit.getFavoratieModle!
                                .favoriteClubs![index].website!,
                            color: Color3,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ]),
                ),
              ),
              body: Column(children: [
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ButtonBookandDirectionandShare(
                        context: context,
                        onTap: () {
                          // Navigator.push<void>(
                          //   context,
                          //   MaterialPageRoute<void>(
                          //     builder: (BuildContext context) =>
                          //         Service(),
                          //   ),
                          // );
                        },
                        title: "book",
                        icon: Icons.book),
                    ButtonBookandDirectionandShare(
                        context: context,
                        onTap: () {
                          Navigator.push<void>(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) => LocationStable(
                                latitude: 24.4539,
                                longitude: 54.3773,
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
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.54,

          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(71, 181, 255, 1), // اللون الأصلي
                Color.fromRGBO(199, 255, 255, 1), // اللون المتناسق
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          // color: Color0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.051,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.height * 0.05,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(71, 181, 255, 1), // اللون الأصلي
                        Color.fromRGBO(199, 255, 255, 1), // اللون المتناسق
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Center(
                    child: text(
                        title: "About",
                        color: Color3,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Container(
                  child: text(
                      title: favovriteCubit.getFavoratieModle!
                          .favoriteClubs![index].description!,
                      // "Originally surrounded by desert sands, Godolphin’s Al Quoz stables are located in the heart of the growing city of Dubai, with a dramatic skyline backdrop.Read more",
                      color: Color.fromRGBO(0, 0, 0, 0.54),
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.05,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(71, 181, 255, 1), // اللون الأصلي
                            Color.fromRGBO(199, 255, 255, 1), // اللون المتناسق
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Center(
                        child: text(
                            title: "Opening Hours",
                            color: Color3,
                            textAlign: TextAlign.start,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.019,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 4,
                      backgroundColor: Color0,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.38,
                      height: MediaQuery.of(context).size.height * 0.03,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: favovriteCubit.getFavoratieModle!
                            .favoriteClubs![index].day!.length,
                        itemBuilder: (BuildContext context, int index1) {
                          print(favovriteCubit.getFavoratieModle!
                                  .favoriteClubs![index].day!.length
                                  .toString() +
                              "LLLLLLLLLLLLLLLLLL");
                          return Container(
                            // color: Color0,
                            width: MediaQuery.of(context).size.width * 0.38,
                            height: MediaQuery.of(context).size.height * 0.03,
                            child: text(
                                title: favovriteCubit.getFavoratieModle!
                                    .favoriteClubs![index].day![index1]
                                    .toString(),
                                color: Color.fromRGBO(0, 0, 0, 0.54),
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          );
                          // تطبيق المرشح هنا
                          // if (yourList[index].shouldShow) {
                          //   return ListTile(
                          //     title: Text(yourList[index].title),
                          //     subtitle: Text(yourList[index].subtitle),
                          //   );
                          // } else {
                          //   // إذا لم يكن العنصر يجب أن يظهر، قم بإرجاع واجهة مستخدم فارغة
                          //   return Container();
                          // }
                        },
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 40),
                      child: Container(
                        child: text(
                            title: favovriteCubit.getFavoratieModle!
                                    .favoriteClubs![index].start
                                    .toString() +
                                " _ " +
                                favovriteCubit.getFavoratieModle!
                                    .favoriteClubs![index].end
                                    .toString(),
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    // Container(
                    //   width: MediaQuery.of(context).size.width * 0.38,
                    //   height: MediaQuery.of(context).size.height * 0.03,
                    //   child: text(
                    //       title: "Monday - Friday",
                    //       color: Color.fromRGBO(0, 0, 0, 0.54),
                    //       fontSize: 14,
                    //       fontWeight: FontWeight.w400),
                    // ),
                    // SizedBox(
                    //   width: 50,
                    // ),
                    // text(
                    //     title: "8:30 AM - 9:00PM",
                    //     color: Colors.black,
                    //     fontSize: 14,
                    //     fontWeight: FontWeight.w400),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.008,
                ),
                // Row(
                //   children: [
                //     CircleAvatar(
                //       radius: 4,
                //       backgroundColor: Color0,
                //     ),
                //     SizedBox(
                //       width: 4,
                //     ),
                //     Container(
                //       width: MediaQuery.of(context).size.width * 0.38,
                //       height: MediaQuery.of(context).size.height * 0.03,
                //       child: text(
                //           title: "Saturday - Sunday",
                //           color: Color.fromRGBO(0, 0, 0, 0.54),
                //           fontSize: 14,
                //           fontWeight: FontWeight.w400),
                //     ),
                //     SizedBox(
                //       width: 50,
                //     ),
                //     text(
                //         title: "9:00 AM - 1:00PM",
                //         color: Colors.black,
                //         fontSize: 14,
                //         fontWeight: FontWeight.w400),
                //   ],
                // ),
                // Row(
                //   children: [Text("data")],
                // ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  // color: Colors.grey,
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.60,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              height: MediaQuery.of(context).size.height * 0.05,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromRGBO(
                                        71, 181, 255, 1), // اللون الأصلي
                                    Color.fromRGBO(
                                        199, 255, 255, 1), // اللون المتناسق
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              ),
                              child: Center(
                                child: text(
                                    title: "Address",
                                    color: Color3,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            text(
                                title: favovriteCubit.getFavoratieModle!
                                    .favoriteClubs![index].address!,
                                // "57G5+46R - Dubai",
                                color: Color.fromRGBO(0, 0, 0, 0.54),
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                            SizedBox(
                              height: 20,
                            ),
                            // Row(
                            //   children: [
                            //     Icon(
                            //       Icons.send,
                            //       color: Color0,
                            //     ),
                            //     text(
                            //         title: "  Get directions ~ 4.2 km",
                            //         color: Color0,
                            //         fontSize: 13,
                            //         fontWeight: FontWeight.w400),
                            //   ],
                            // )
                          ],
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * .080),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
        //////////////////////////
        // Container(
        //   width: MediaQuery.of(context).size.width,
        //   height: MediaQuery.of(context).size.height * 0.30,
        //   // color: Color.fromRGBO(90, 60, 98, 0.15),
        //   color: Color.fromRGBO(255, 199, 99, 0.203),

        //   child: Padding(
        //     padding: const EdgeInsets.all(10.0),
        //     child:
        //         Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        //       // SizedBox(
        //       //   height: 10,
        //       // ),

        //       SizedBox(
        //         height: 15,
        //       ),
        //       text(
        //           title: "Stable specialists",
        //           color: Color0,
        //           fontSize: 18,
        //           fontWeight: FontWeight.w700),
        //       SizedBox(
        //         height: MediaQuery.of(context).size.height * 0.005,
        //       ),
        //       // Container(
        //       //   width: MediaQuery.of(context).size.width,
        //       //   height: MediaQuery.of(context).size.height * 0.1719999,
        //       //   child: ListView.separated(
        //       //     scrollDirection: Axis.horizontal,
        //       //     itemCount: 5,
        //       //     separatorBuilder: (BuildContext context, int index) =>
        //       //         SizedBox(
        //       //       width: MediaQuery.of(context).size.width * 0.03,
        //       //     ),
        //       //     itemBuilder: (BuildContext context, int index) {
        //       //       return ListCirclePerson(
        //       //           context: context,
        //       //           indexImage: index,
        //       //           title: "Mike West ${index}",
        //       //           ImageNetWork: favovriteCubit.getFavoratieModle!
        //       //               .favoriteClubs![index].profile,
        //       //           onTap: () {
        //       //             // Navigator.push<void>(
        //       //             //   context,
        //       //             //   MaterialPageRoute<void>(
        //       //             //     builder: (BuildContext context) =>
        //       //             //         Profile(),
        //       //             //   ),
        //       //             // );
        //       //           });
        //       //     },
        //       //   ),
        //       // ),

        //       GestureDetector(
        //         onTap: () {},
        //         child: Column(
        //           children: [
        //             Center(
        //               child: Stack(
        //                 alignment: Alignment.bottomLeft,
        //                 children: [
        //                   // CircleAvatar(
        //                   //   radius: 33,
        //                   //   backgroundColor: Color0,
        //                   // ),
        //                   // CircleAvatar(
        //                   //   radius: 31,
        //                   //   backgroundColor: Colors.white,
        //                   // ),
        //                   Container(
        //                     width: MediaQuery.of(context).size.width * 0.3,
        //                     height: MediaQuery.of(context).size.height * 0.17,

        //                     decoration: BoxDecoration(
        //                         borderRadius: BorderRadius.circular(15.0)),
        //                     // radius: 28,
        //                     clipBehavior: Clip.antiAlias,
        //                     // backgroundColor: Colors.transparent,
        //                     child: Image.network(
        //                       favovriteCubit.getFavoratieModle!
        //                           .favoriteClubs![index].profile!,
        //                       fit: BoxFit.cover,
        //                       // width: MediaQuery.of(context).size.width,
        //                       // height: MediaQuery.of(context).size.height,
        //                     ),
        //                   ),
        //                   Padding(
        //                     padding: const EdgeInsets.all(8.0),
        //                     child: text(
        //                         title: favovriteCubit.getFavoratieModle!
        //                             .favoriteClubs![index].description
        //                             .toString(),
        //                         color: Color3,
        //                         fontSize: 14,
        //                         // textAlign: TextAlign.center,
        //                         fontWeight: FontWeight.w400),
        //                   ),
        //                 ],
        //               ),
        //             ),

        //             ////////////////////////////
        //           ],
        //         ),
        //       ),
        //       // SizedBox(
        //       //   height: 40,
        //       // ),
        //     ]),
        //   ),
        // ),
        /////////////////

        // Container(
        //   height: MediaQuery.of(context).size.height,
        //   // color: Colors.pink,
        //   child: DefaultTabController(
        //       length: 4,
        //       child: Container(
        //           width: MediaQuery.of(context).size.width,
        //           height: MediaQuery.of(context).size.height * 0.2,
        //           // color: Colors.pink,
        //           child: Column(children: [
        //             Container(
        //               color: Color.fromRGBO(90, 60, 98, 0.15),
        //               child: TabBar(
        //                 labelColor: Color0,
        //                 indicatorColor: Color0,
        //                 unselectedLabelColor:
        //                     Color.fromRGBO(5, 0, 0, 0.5),
        //                 tabs: [
        //                   Tab(text: 'About'),
        //                   Tab(text: 'Services'),
        //                   Tab(text: 'Gallery'),
        //                   Tab(text: 'Review'),
        //                 ],
        //               ),
        //             ),
        //             Expanded(
        //               child: TabBarView(
        //                 children: [
        //                   // Screen1(
        //                   //   cubit: cubit,
        //                   // ),
        //                   // Screen2(
        //                   //   cubit: cubit,
        //                   // ),
        //                   // Screen3(
        //                   //   cubit: cubit,
        //                   // ),
        //                   // Screen4(
        //                   //   cubit: cubit,
        //                   // )
        //                 ],
        //               ),
        //             ),
        //           ]))),
        // ),
      ]),
    ));
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
              fontSize: 15,
              fontWeight: FontWeight.w500)
        ],
      ),
    );
  }
}
