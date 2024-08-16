import 'package:flutter/material.dart';
import 'package:thi/Reservations/Details_Club/cubit/home_stable_cubit.dart';
import 'package:thi/component/Widght.dart';
import 'package:thi/component/conset/Const.dart';

class Screen1 extends StatelessWidget {
  final HomeStableCubit cubit;

  const Screen1({super.key, required this.cubit});
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(71, 181, 255, 0.623), // اللون الأصلي
              Color.fromRGBO(199, 255, 255, 1), // اللون المتناسق
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            // Image.asset(
            //   imageBackground,
            //   fit: BoxFit.cover,
            //   width: MediaQuery.of(context).size.width,
            //   height: MediaQuery.of(context).size.height,
            // ),
            Scaffold(
              backgroundColor: Colors.transparent,
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: cubit.clubIDModel == null
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.35,
                              height: MediaQuery.of(context).size.height * 0.05,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromRGBO(40, 168, 253, 1),
                                    Color.fromRGBO(
                                        71, 181, 255, 1), // اللون الأصلي
                                    Color.fromRGBO(
                                        134, 255, 255, 1), // اللون المتناسق
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              ),
                              child: Center(
                                child: text(
                                    title: "About",
                                    color: Color3,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Container(
                              child: text(
                                  title: cubit.clubIDModel!.club!.description!,
                                  // "Originally surrounded by desert sands, Godolphin’s Al Quoz stables are located in the heart of the growing city of Dubai, with a dramatic skyline backdrop.Read more",
                                  color: Colors.white60,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Row(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    gradient: LinearGradient(
                                      colors: [
                                        Color.fromRGBO(40, 168, 253, 1),
                                        Color.fromRGBO(
                                            71, 181, 255, 1), // اللون الأصلي
                                        Color.fromRGBO(
                                            134, 255, 255, 1), // اللون المتناسق
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
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.38,
                                  height:
                                      MediaQuery.of(context).size.height * 0.03,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount:
                                        cubit.clubIDModel!.club!.day!.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      if (index == 0) {
                                        // إذا كان العنصر الأول في القائمة، قم بإرجاع عنصر واحد فقط دون السهم
                                        return Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.15,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.03,
                                          child: text(
                                            title: cubit
                                                .clubIDModel!.club!.day![index]
                                                .toString(),
                                            color: Colors.white60,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        );
                                      } else {
                                        // إذا كان العنصر ليس الأول في القائمة، قم بإرجاع عنصر مع السهم
                                        return Row(
                                          children: [
                                            Icon(Icons.arrow_forward, size: 16),
                                            SizedBox(width: 8),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.15,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.03,
                                              child: text(
                                                title: cubit.clubIDModel!.club!
                                                    .day![index]
                                                    .toString(),
                                                color: Colors.white60,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        );
                                      }
                                    },
                                  ),
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(right: 40),
                                  child: text(
                                      title: cubit.clubIDModel!.club!.start
                                              .toString() +
                                          " " +
                                          cubit.clubIDModel!.club!.end
                                              .toString(),
                                      color: Colors.black45,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            // SizedBox(
                            //   height: MediaQuery.of(context).size.height * 0.008,
                            // ),
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
                              height: MediaQuery.of(context).size.height * 0.13,
                              // color: Colors.grey,
                              child: Row(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.60,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.35,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.05,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            gradient: LinearGradient(
                                              colors: [
                                                Color.fromRGBO(40, 168, 253, 1),
                                                Color.fromRGBO(71, 181, 255,
                                                    1), // اللون الأصلي
                                                Color.fromRGBO(134, 255, 255,
                                                    1), // اللون المتناسق
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
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.location_city_outlined,
                                              size: 30,
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.02,
                                            ),
                                            Container(
                                              child: text(
                                                  title: cubit.clubIDModel!
                                                      .club!.address!,
                                                  // "57G5+46R - Dubai",
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 0.54),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
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
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          .080),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  text(
                                      title: "Photos",
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                  Spacer(),
                                  text(
                                      title: "View all",
                                      color: Color0,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ],
                              ),
                            ),
                            Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                width: MediaQuery.of(context).size.width,
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: cubit.clubIDModel!.images!.length,
                                  separatorBuilder:
                                      (BuildContext context, int index) =>
                                          SizedBox(
                                    width: 5,
                                  ),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.2,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          image: DecorationImage(
                                              image: NetworkImage(ImagesPath +
                                                      cubit.clubIDModel!
                                                          .images![index]
                                                          .toString()
                                                  // 'assets/images/main/image ${index + 70}.png',
                                                  ),
                                              fit: BoxFit.cover)),
                                    );
                                  },
                                )),
                            SizedBox(
                              height: 15,
                            ),
                            // Center(
                            //   child: GestureDetector(
                            //     onTap: () {
                            //         Navigator.push<void>(
                            //                         context,
                            //                         MaterialPageRoute<void>(
                            //                           builder: (BuildContext context) =>
                            //                               Service(
                            //                             Idcubit: Id,
                            //                           ),
                            //                         ),
                            //                       );
                            //       // يتم تنفيذ هذا الكود عند النقر على الزر
                            //       print('تم النقر على الزر!');
                            //     },
                            //     child: Container(
                            //       width: MediaQuery.of(context).size.width * 0.80,
                            //       height: 50.0,
                            //       decoration: BoxDecoration(
                            //         borderRadius: BorderRadius.circular(15.0),
                            //         gradient: LinearGradient(
                            //           colors: [
                            //             LinearGradientColor01, LinearGradientColor01
                            //             // const Color(0xFFFF80AB), // زهري فاتح
                            //             // const Color(0xFFFF4081), // زهري غامق
                            //           ],
                            //           begin: Alignment.topLeft,
                            //           end: Alignment.bottomRight,
                            //         ),
                            //         boxShadow: [
                            //           BoxShadow(
                            //             color: Color0.withOpacity(0.5),
                            //             spreadRadius: 2.0,
                            //             blurRadius: 10.0,
                            //             offset: Offset(-1, 6),
                            //           ),
                            //         ],
                            //       ),
                            //       child: Center(
                            //         child: text(
                            //           title: "Book now",
                            //           color: Colors.white,
                            //           fontSize: 16.0,
                            //           fontWeight: FontWeight.bold,
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
