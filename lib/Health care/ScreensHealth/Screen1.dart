import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thi/Health%20care/deatils/cubit/details_health_cubit.dart';
import 'package:thi/component/Widght.dart';
import 'package:thi/component/conset/Const.dart';

// class ScreenHealth1 extends StatefulWidget {
//   const ScreenHealth1({Key? key}) : super(key: key);

//   @override
//   State<ScreenHealth1> createState() => _Screen1State();
// }

class ScreenHealth1 extends StatelessWidget {
  final DetailsHealthCubit detailsHealthCubit;

  const ScreenHealth1({super.key, required this.detailsHealthCubit});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailsHealthCubit(),
      child: BlocConsumer<DetailsHealthCubit, DetailsHealthState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(71, 181, 255, 1),
                  Color.fromRGBO(71, 181, 255, 0.466), // اللون الأصلي
// اللون الأصلي
                  Color.fromRGBO(199, 255, 255, 1), // اللون المتناسق
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.height * 0.06,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
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
                        child: Center(
                          child: text(
                              title: "About",
                              color: Color3,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      detailsHealthCubit.healthCaresByIDModel == null
                          ? Container()
                          : text(
                              title: detailsHealthCubit
                                  .healthCaresByIDModel!.healthCare!.description
                                  .toString(),
                              color: Color.fromRGBO(0, 0, 0, 0.54),
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                      SizedBox(
                        height: 6,
                      ),
                      Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            height: MediaQuery.of(context).size.height * 0.06,
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
                                  title: "Opening Hours",
                                  color: Color3,
                                  textAlign: TextAlign.start,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
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
                              child: detailsHealthCubit.healthCaresByIDModel ==
                                      null
                                  ? Container()
                                  : ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: detailsHealthCubit
                                          .healthCaresByIDModel!
                                          .healthCare!
                                          .day!
                                          .length,
                                      itemBuilder: (context, index) {
                                        return text(
                                            title: detailsHealthCubit
                                                .healthCaresByIDModel!
                                                .healthCare!
                                                .day![index]
                                                .toString(),
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.54),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400);
                                      })),
                          Spacer(),
                          detailsHealthCubit.healthCaresByIDModel == null
                              ? Container()
                              : Padding(
                                  padding: const EdgeInsets.only(right: 40),
                                  child: text(
                                      title: detailsHealthCubit
                                              .healthCaresByIDModel!
                                              .healthCare!
                                              .start
                                              .toString() +
                                          " " +
                                          detailsHealthCubit
                                              .healthCaresByIDModel!
                                              .healthCare!
                                              .end
                                              .toString(),
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
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
                      //       height:
                      //           MediaQuery.of(context).size.height * 0.03,
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
                        height: MediaQuery.of(context).size.height * 0.12,
                        // color: Colors.grey,
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.60,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
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
                                          title: "Address",
                                          color: Color3,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  detailsHealthCubit.healthCaresByIDModel ==
                                          null
                                      ? Container()
                                      : text(
                                          title: detailsHealthCubit
                                              .healthCaresByIDModel!
                                              .healthCare!
                                              .address
                                              .toString(),
                                          color: Color.fromRGBO(0, 0, 0, 0.54),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Row(
                      //     children: [
                      //       text(
                      //           title: "Photos",
                      //           color: Colors.black,
                      //           fontSize: 16,
                      //           fontWeight: FontWeight.w400),
                      //       Spacer(),
                      //       text(
                      //           title: "View all",
                      //           color: Color0,
                      //           fontSize: 16,
                      //           fontWeight: FontWeight.w400),
                      //     ],
                      //   ),
                      // ),
                      // Container(
                      //     height: 70,
                      //     width: MediaQuery.of(context).size.width,
                      //     child: ListView.separated(
                      //       scrollDirection: Axis.horizontal,
                      //       itemCount: 5,
                      //       separatorBuilder: (BuildContext context, int index) =>
                      //           SizedBox(
                      //         width: 5,
                      //       ),
                      //       itemBuilder: (BuildContext context, int index) {
                      //         return Container(
                      //           width: 72,
                      //           height: 72,
                      //           decoration: BoxDecoration(
                      //               image: DecorationImage(
                      //                   image: AssetImage(
                      //             'assets/images/main/image ${index + 70}.png',
                      //           ))),
                      //         );
                      //       },
                      //     )),
                      // SizedBox(
                      //   height: 15,
                      // ),
                      // Center(
                      //   child: GestureDetector(
                      //     onTap: () {
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
                      //         child: Text(
                      //           "Book now",
                      //           style: TextStyle(
                      //             color: Colors.white,
                      //             fontSize: 16.0,
                      //             fontWeight: FontWeight.bold,
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      SizedBox(
                        height: 5,
                      ),
                      detailsHealthCubit.healthCaresByIDModel == null
                          ? Container()
                          : Container(
                              height: MediaQuery.of(context).size.height * 0.05,
                              // color: Colors.grey,
                              child: Row(
                                children: [
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
                                          title: "mobile",
                                          color: Color3,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          .4),
                                  text(
                                      title: detailsHealthCubit
                                          .healthCaresByIDModel!
                                          .healthCare!
                                          .user!
                                          .mobile
                                          .toString(),
                                      color: Color.fromRGBO(0, 0, 0, 0.54),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ],
                              ),
                            ),
                      SizedBox(
                        height: 5,
                      ),
                      detailsHealthCubit.healthCaresByIDModel == null
                          ? Container()
                          : Container(
                              height: MediaQuery.of(context).size.height * 0.05,
                              // color: Colors.grey,
                              child: Row(
                                children: [
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
                                          title: "Email",
                                          color: Color3,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          .3),
                                  text(
                                      title: detailsHealthCubit
                                          .healthCaresByIDModel!
                                          .healthCare!
                                          .user!
                                          .email
                                          .toString(),
                                      color: Color.fromRGBO(0, 0, 0, 0.54),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ],
                              ),
                            ),
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
}
