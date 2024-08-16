// import 'package:smooth_star_rating/smooth_star_rating.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thi/Chat/chat.dart';
import 'package:thi/Reservations/Details_Club/model/TrinerIdByClub.dart';
// import 'package:thi/Reservations/Booking/selectingBooking.dart';
import 'package:thi/component/Widght.dart';
import 'package:thi/component/conset/Const.dart';
import 'package:thi/profile/TrinnerProfile/Review.dart';
import 'package:thi/profile/TrinnerProfile/cubit/trinner_cubit.dart';

class Profile extends StatefulWidget {
  Profile(
      {Key? key,
      required this.cubit,
      required this.indexProfile,
      required this.Id_trinner})
      : super(key: key);
  final MyClubTrenerIDModel cubit;
  final int indexProfile;
  final int Id_trinner;
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  double rating = 0.0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TrinnerCubit()..getDataGetAverageTrinnerRevewModel(widget.Id_trinner),
      child: BlocConsumer<TrinnerCubit, TrinnerState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = TrinnerCubit.getObject(context);
          return Scaffold(
            body: Stack(
              children: [
                Image.asset(
                  imageBackground,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
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
                        color: Color0,
                        size: 35,
                      ),
                    ),
                    title: Center(
                      child: text(
                          title: "Profile",
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color.fromRGBO(35, 0, 44, 1)),
                    ),
                    actions: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: Color0,
                              width: 2,
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Icon(
                                  Icons.star,
                                  size: 35,
                                  color: Color0,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              cubit.avarageReviewRating == null
                                  ? Container(child: text(title: "0"))
                                  : Container(
                                      child: text(
                                          title: cubit.avarageReviewRating!
                                              .averageRating
                                              .toString(),
                                          color: Color0),
                                    ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                            height: 130,
                            // color: Colors.red,
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Spacer(),
                                    // Padding(
                                    //   padding: const EdgeInsets.only(left: 23.0),
                                    //   child: GestureDetector(
                                    //     onTap: () {
                                    //       //Profile2
                                    //       Navigator.push<void>(
                                    //         context,
                                    //         MaterialPageRoute<void>(
                                    //           builder: (BuildContext context) =>
                                    //               Profile2(),
                                    //         ),
                                    //       );
                                    //       print("mohammed");
                                    //     },
                                    //     child: Container(
                                    //       width: 50,
                                    //       height: 25,
                                    //       alignment: Alignment.center,
                                    //       decoration: BoxDecoration(
                                    //         color: Color0,
                                    //         borderRadius: BorderRadius.circular(5),
                                    //       ),
                                    //       child: Text(
                                    //         "OPEN",
                                    //         textAlign: TextAlign.center,
                                    //         style: TextStyle(
                                    //             color: Colors.black,
                                    //             fontSize: 12,
                                    //             fontWeight: FontWeight.w400),
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),
                                    SizedBox(
                                      height: 20,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.055,
                                ),
                                Center(
                                  child: Stack(
                                    alignment: Alignment.bottomRight,
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.3,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.2,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                              clipBehavior: Clip.antiAlias,
                                              // radius: 56,
                                              // backgroundColor: Colors.transparent,
                                              child: Image.network(
                                                ImagesPath +
                                                    widget
                                                        .cubit
                                                        .trainers![
                                                            widget.indexProfile]
                                                        .image
                                                        .toString(),
                                                fit: BoxFit.cover,
                                                // width: MediaQuery.of(context).size.width,
                                                // height: MediaQuery.of(context).size.height,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      CircleAvatar(
                                        radius: 13,
                                        backgroundColor: Colors.white,
                                      ),
                                      CircleAvatar(
                                        radius: 12,
                                        backgroundColor: Color0,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.055,
                                ),
                                Column(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.03,
                                      child: text(
                                          title: widget
                                                  .cubit
                                                  .trainers![
                                                      widget.indexProfile]
                                                  .fName
                                                  .toString() +
                                              "  " +
                                              widget
                                                  .cubit
                                                  .trainers![
                                                      widget.indexProfile]
                                                  .lName
                                                  .toString(),
                                          fontSize: 20,
                                          // textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          fontWeight: FontWeight.w700,
                                          color: Color0),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    text(
                                        title: "horse trainer",
                                        fontSize: 14,
                                        // textAlign: TextAlign.center,
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromRGBO(90, 0, 114, 1)),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.01,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            // Edit Chat
                                            Navigator.push<void>(
                                              context,
                                              MaterialPageRoute<void>(
                                                builder:
                                                    (BuildContext context) =>
                                                        ChatScreen(
                                                  ID_Trinner: widget
                                                      .cubit
                                                      .trainers![
                                                          widget.indexProfile]
                                                      .id!,
                                                  FNameTrinner: widget
                                                      .cubit
                                                      .trainers![
                                                          widget.indexProfile]
                                                      .fName!,
                                                  ImageTrinner: widget
                                                      .cubit
                                                      .trainers![
                                                          widget.indexProfile]
                                                      .image!,
                                                ),
                                              ),
                                            );
                                            print("llllll");
                                          },
                                          child: Column(
                                            children: [
                                              CircleAvatar(
                                                radius: 26,
                                                backgroundColor: Color0,
                                                child: Icon(
                                                  Icons.chat_bubble,
                                                  color: Colors.white,
                                                  size: 30,
                                                ),
                                              ),
                                              text(
                                                  title: "Chat",
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 0.54),
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w400)
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.06,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                                // Spacer()
                              ],
                            )),
                        // Row(
                        //   children: [
                        //     SizedBox(
                        //       width: MediaQuery.of(context).size.width * 0.35,
                        //     ),
                        //     Column(
                        //       children: [
                        //         text(
                        //             title: "Mohammed Ahmed",
                        //             fontSize: 20,
                        //             // textAlign: TextAlign.center,
                        //             fontWeight: FontWeight.w700,
                        //             color: Color.fromRGBO(90, 0, 114, 1)),
                        //         SizedBox(
                        //           height: 2,
                        //         ),
                        //         text(
                        //             title: "horse trainer",
                        //             fontSize: 14,
                        //             // textAlign: TextAlign.center,
                        //             fontWeight: FontWeight.w400,
                        //             color: Color.fromRGBO(90, 0, 114, 1)),
                        //       ],
                        //     ),
                        //   ],
                        // ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .004,
                        ),
                        // cubit.isload
                        //           ? SpinkitWave()
                        //           :
                        ButtonStaic(
                            widthContainer:
                                MediaQuery.of(context).size.width * 0.40,
                            onTap: () {
                              // يتم تنفيذ هذا الكود عند النقر على الزر
                              // if (_formKey.currentState!.validate()) {
                              //   cubit.chingLoading(true);
                              //   cubit.postLogin(
                              //       Email: emailController.text,
                              //       PassWord: passwordController.text,
                              //       context: context);

                              //   // إذا كانت جميع الحقول صحيحة
                              //   // يمكنك تنفيذ الإجراء المطلوب هنا، مثل تسجيل الدخول
                              //   print('Login successful');
                              // }
                              Navigator.push<void>(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      ReviewTriner(
                                    trainer_id: widget.Id_trinner,
                                  ),
                                ),
                              );
                              print('تم النقر على الزر!');
                            },
                            title: "Review",
                            context: context),
                        // Container(
                        //   height: 30,
                        //   // color: Colors.amber,
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       SmoothStarRating(
                        //         color: Color.fromRGBO(228, 179, 67, 1),
                        //         rating: rating,
                        //         // isReadOnly: false,
                        //         size: 25,
                        //         filledIconData: Icons.star,
                        //         halfFilledIconData: Icons.star_half,
                        //         defaultIconData: Icons.star_border,
                        //         starCount: 5,
                        //         allowHalfRating: true,
                        //         spacing: 2.0,
                        //         onRatingChanged: (v) {
                        //           setState(() {
                        //             rating = v;
                        //           });
                        //         },
                        //       ),
                        //       text(
                        //           title: "   (125 Reviews)",
                        //           color: Color.fromRGBO(34, 32, 32, 1),
                        //           fontSize: 14,
                        //           fontWeight: FontWeight.w400)
                        //     ],
                        //   ),
                        // ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .008,
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * .003,
                        ),
                        Divider(
                          color: Color.fromRGBO(50, 52, 70, 1),
                        ),
                        // Container(
                        //   color: Colors.red,
                        //   height: 50,
                        // ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .03,
                                ),
                                Row(
                                  children: [
                                    text(
                                        title: "Opening Hours",
                                        color: Colors.black,
                                        textAlign: TextAlign.start,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ],
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.019,
                                ),
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 5,
                                      backgroundColor: Color0,
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.40,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.04,
                                      child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: widget
                                              .cubit
                                              .trainers![widget.indexProfile]
                                              .days!
                                              .length,
                                          itemBuilder: (context, indexdays) {
                                            return text(
                                                title: widget
                                                        .cubit
                                                        .trainers![
                                                            widget.indexProfile]
                                                        .days![indexdays]
                                                        .toString() +
                                                    "-",
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400);
                                          }),
                                    ),
                                    Spacer(),
                                    // SizedBox(
                                    //   width: MediaQuery.of(context).size.width * 0.02,
                                    // ),
                                    text(
                                        title: widget
                                                .cubit
                                                .trainers![widget.indexProfile]
                                                .start
                                                .toString() +
                                            "-" +
                                            widget
                                                .cubit
                                                .trainers![widget.indexProfile]
                                                .end
                                                .toString(),
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ],
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.008,
                                ),
                                // Row(
                                //   children: [
                                //     CircleAvatar(
                                //       radius: 5,
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
                                //           fontSize: 16,
                                //           fontWeight: FontWeight.w400),
                                //     ),
                                //     SizedBox(
                                //       width: 50,
                                //     ),
                                //     text(
                                //         title: "9:00 AM - 1:00PM",
                                //         color: Colors.black,
                                //         fontSize: 16,
                                //         fontWeight: FontWeight.w400),
                                //   ],
                                // ),
                                // Spacer(),
                                // SizedBox(
                                //   height: MediaQuery.of(context).size.height * 0.30,
                                // ),
                                // Row(
                                //   children: [Text("data")],
                                // ),
                                // Padding(
                                //   padding: const EdgeInsets.symmetric(vertical: 16),
                                //   child: Container(
                                //     height: MediaQuery.of(context).size.height * 0.19,
                                //     width: MediaQuery.of(context).size.width,
                                //     // color: Colors.grey,
                                //     child: Row(
                                //       children: [
                                //         Container(
                                //           width: MediaQuery.of(context).size.width *
                                //               0.60,
                                //           child: Column(
                                //             mainAxisAlignment:
                                //                 MainAxisAlignment.spaceBetween,
                                //             crossAxisAlignment:
                                //                 CrossAxisAlignment.start,
                                //             children: [
                                //               text(
                                //                   title: "Address",
                                //                   color: Colors.black,
                                //                   fontSize: 16,
                                //                   fontWeight: FontWeight.w400),
                                //               text(
                                //                   title:
                                //                       "030 Zulauf Green, O’Konville, SD, United States of America",
                                //                   color:
                                //                       Color.fromRGBO(0, 0, 0, 0.54),
                                //                   fontSize: 14,
                                //                   fontWeight: FontWeight.w400),
                                //               Row(
                                //                 children: [
                                //                   Icon(
                                //                     Icons.send,
                                //                     color: Color0,
                                //                   ),
                                //                   text(
                                //                       title:
                                //                           "  Get directions ~ 4.2 km",
                                //                       color: Color0,
                                //                       fontSize: 13,
                                //                       fontWeight: FontWeight.w400),
                                //                 ],
                                //               )
                                //             ],
                                //           ),
                                //         ),
                                //         SizedBox(
                                //             width: MediaQuery.of(context).size.width *
                                //                 .060),
                                //         Image.asset(
                                //           'assets/images/main/image 64.png',
                                //           fit: BoxFit.cover,
                                //           width: 100,
                                //           height: 100,
                                //         ),
                                //       ],
                                //     ),
                                //   ),
                                // ),
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
                                          color: Color.fromRGBO(90, 0, 114, 1),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ],
                                  ),
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.4,
                                  width: MediaQuery.of(context).size.width,
                                  child: GridView.builder(
                                    scrollDirection: Axis.vertical,
                                    itemCount: widget
                                        .cubit
                                        .trainers![widget.indexProfile]
                                        .images!
                                        .length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 5.0,
                                      crossAxisSpacing: 5.0,
                                      childAspectRatio: 1.0,
                                    ),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return GestureDetector(
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return Dialog(
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width, // تعديل حسب حجم الجهاز
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.8, // تعديل حسب حجم الجهاز
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    image: DecorationImage(
                                                      fit: BoxFit.fill,
                                                      image: NetworkImage(
                                                        ImagesPath +
                                                            widget
                                                                .cubit
                                                                .trainers![widget
                                                                    .indexProfile]
                                                                .images![index]
                                                                .toString(),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.2,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.050,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: NetworkImage(
                                                ImagesPath +
                                                    widget
                                                        .cubit
                                                        .trainers![
                                                            widget.indexProfile]
                                                        .images![index]
                                                        .toString(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                      crossAxisAlignment: CrossAxisAlignment.center,
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
