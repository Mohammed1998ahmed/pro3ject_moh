import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thi/Health%20care/Chat/chat.dart';

import 'package:thi/Health%20care/Profile/cubit/profile_dotors_cubit.dart';
import 'package:thi/component/Widght.dart';
import 'package:thi/component/conset/Const.dart';

// import 'package:smooth_star_rating/smooth_star_rating.dart';

// class ProfileDoctor extends StatefulWidget {
//   ProfileDoctor({Key? key}) : super(key: key);

//   @override
//   State<ProfileDoctor> createState() => _ProfileState();
// }

// ignore: must_be_immutable
class ProfileDoctor extends StatelessWidget {
  double rating = 0.0;
  final int ID_Doctor;

  ProfileDoctor({super.key, required this.ID_Doctor});
  @override
  Widget build(BuildContext context) {
    print(
        "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    return BlocProvider(
      create: (context) =>
          ProfileDotorsCubit()..getallDoctors(Id_Doctor: ID_Doctor),
      child: BlocConsumer<ProfileDotorsCubit, ProfileDotorsState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = ProfileDotorsCubit.getObject(context);
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
                    backgroundColor: Color0,
                    elevation: 0.0,
                    leading: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Color4,
                        size: 30,
                      ),
                    ),
                    title: Center(
                      child: text(
                          title: "Profile",
                          textAlign: TextAlign.center,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color4),
                    ),
                    centerTitle: true,
                    actions: [
                      SizedBox(
                        width: 50,
                      )
                    ],
                  ),
                  body: cubit.detailsByIdDoctorsModel == null
                      ? Container()
                      : SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.4,
                                  decoration: BoxDecoration(
                                      color: Color0,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(50),
                                          bottomRight: Radius.circular(50))),
                                  child: Column(
                                    children: [
                                      Center(
                                        child: Stack(
                                          alignment: Alignment.bottomRight,
                                          children: [
                                            Container(
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.3,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.15,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50)),
                                                clipBehavior: Clip.antiAlias,
                                                // radius: 56,
                                                // backgroundColor: Colors.transparent,
                                                child: Image.network(
                                                  ImagesPath +
                                                      cubit
                                                          .detailsByIdDoctorsModel!
                                                          .doctor!
                                                          .image
                                                          .toString(),
                                                  fit: BoxFit.cover,
                                                  // width: MediaQuery.of(context).size.width,
                                                  // height: MediaQuery.of(context).size.height,
                                                ),
                                              ),
                                            ),
                                            CircleAvatar(
                                              radius: 13,
                                              backgroundColor: Colors.white,
                                            ),
                                            CircleAvatar(
                                              radius: 12,
                                              backgroundColor: Colors.green,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.025,
                                      ),
                                      Column(
                                        children: [
                                          text(
                                              title:
                                                  "Dr. ${cubit.detailsByIdDoctorsModel!.doctor!.firstName.toString() + " " + cubit.detailsByIdDoctorsModel!.doctor!.lastName.toString()}",
                                              fontSize: 18,
                                              // textAlign: TextAlign.center,
                                              fontWeight: FontWeight.w700,
                                              color: Color3),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          text(
                                              title: cubit
                                                  .detailsByIdDoctorsModel!
                                                  .doctor!
                                                  .description
                                                  .toString(),
                                              fontSize: 14,
                                              // textAlign: TextAlign.center,
                                              fontWeight: FontWeight.w400,
                                              color: Color.fromRGBO(
                                                  252, 249, 252, 1)),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  /////////////////// Edit Chat
                                                  // Navigator.push<void>(
                                                  //   context,
                                                  //   MaterialPageRoute<void>(
                                                  //     builder: (BuildContext context) =>
                                                  //         ChatScreen(),
                                                  //   ),
                                                  // );
                                                  print("llllll");
                                                },
                                                child: Column(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        // ChatScreen
                                                        Navigator.push<void>(
                                                          context,
                                                          MaterialPageRoute<
                                                              void>(
                                                            builder: (BuildContext
                                                                    context) =>
                                                                ChatScreen(
                                                              ID_Doctor:
                                                                  ID_Doctor,
                                                              ImageDoctor: cubit
                                                                  .detailsByIdDoctorsModel!
                                                                  .doctor!
                                                                  .image!,
                                                              FNameDoctor: cubit
                                                                  .detailsByIdDoctorsModel!
                                                                  .doctor!
                                                                  .firstName!,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      child: CircleAvatar(
                                                        radius: 26,
                                                        backgroundColor: Color4,
                                                        child: Icon(
                                                          Icons.chat_bubble,
                                                          color: Colors.white,
                                                          size: 30,
                                                        ),
                                                      ),
                                                    ),
                                                    text(
                                                        title: "Chat",
                                                        color: Color3,
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w600)
                                                  ],
                                                ),
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
                                height:
                                    MediaQuery.of(context).size.height * .004,
                              ),
                              Container(
                                height: 30,
                                // color: Colors.amber,
                                child: text(
                                    title: cubit.detailsByIdDoctorsModel!
                                        .doctor!.user!.email
                                        .toString(),
                                    color: Color0),
                                // child: Row(
                                //   mainAxisAlignment: MainAxisAlignment.center,
                                //   children: [
                                //     SmoothStarRating(
                                //       color: Color.fromRGBO(228, 179, 67, 1),
                                //       rating: rating,
                                //       // isReadOnly: false,
                                //       size: 25,
                                //       filledIconData: Icons.star,
                                //       halfFilledIconData: Icons.star_half,
                                //       defaultIconData: Icons.star_border,
                                //       starCount: 5,
                                //       allowHalfRating: true,
                                //       spacing: 2.0,
                                //       onRatingChanged: (v) {
                                //         // setState(() {
                                //         //   rating = v;
                                //         // });
                                //       },
                                //     ),
                                //     text(
                                //         title: "   (Assessment)",
                                //         color: Color4,
                                //         fontSize: 14,
                                //         fontWeight: FontWeight.w600)
                                //   ],
                                // ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .008,
                              ),

                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .003,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                child: text(
                                                    title: "Birth: ",
                                                    color: Color0)),
                                            Expanded(
                                              child: text(
                                                  title: cubit
                                                      .detailsByIdDoctorsModel!
                                                      .doctor!
                                                      .birth
                                                      .toString(),
                                                  color: Color4),
                                            ),
                                            Expanded(
                                                child: text(
                                                    title: "Gender: ",
                                                    color: Color0)),
                                            Expanded(
                                              child: text(
                                                  title: cubit
                                                      .detailsByIdDoctorsModel!
                                                      .doctor!
                                                      .gender
                                                      .toString(),
                                                  color: Color4),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                child: text(
                                                    title: "Experience: ",
                                                    color: Color0)),
                                            Expanded(
                                              child: text(
                                                  title: cubit
                                                          .detailsByIdDoctorsModel!
                                                          .doctor!
                                                          .experience
                                                          .toString() +
                                                      " Years",
                                                  color: Color4),
                                            ),
                                            Expanded(
                                                child: text(
                                                    title: "Specialties: ",
                                                    color: Color0)),
                                            Expanded(
                                              child: text(
                                                  title: cubit
                                                      .detailsByIdDoctorsModel!
                                                      .doctor!
                                                      .specialties
                                                      .toString(),
                                                  color: Color4),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                child: text(
                                                    title: "mobile: ",
                                                    color: Color0)),
                                            Expanded(
                                              child: text(
                                                  title: cubit
                                                      .detailsByIdDoctorsModel!
                                                      .doctor!
                                                      .user!
                                                      .mobile
                                                      .toString(),
                                                  color: Color4),
                                            ),
                                          ],
                                        ),
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
