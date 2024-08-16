import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thi/component/Widght.dart';
import 'package:thi/component/conset/Const.dart';
import 'package:thi/profile/BookingandAppointment/BookingandApp.dart';
import 'package:thi/profile/BookingandAppointment/selectTepyBooking.dart';
import 'package:thi/profile/EditProfile/EditProfile.dart';
import 'package:thi/profile/changePassword/changePassWord.dart';
import 'package:thi/profile/cubit/profile_cubit.dart';
import 'package:thi/profile/favovoriteIstable/favovrite.dart';
import 'package:thi/profile/hospetel/hospatel.dart';

import 'profile2.dart';

class Profile2 extends StatefulWidget {
  const Profile2({Key? key}) : super(key: key);

  @override
  State<Profile2> createState() => _Profile2State();
}

class _Profile2State extends State<Profile2> {
  @override
  Widget build(BuildContext context) {
    double Width = MediaQuery.of(context).size.width;
    double Height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => ProfileCubit()..getprofile(),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = ProfileCubit.getObject(context);

          return Scaffold(
              backgroundColor: Colors.transparent,
              body: state is ProfileSuecussfulyProfile
                  ? Container(
                      // decoration: BoxDecoration(
                      //     image: DecorationImage(
                      //   image: AssetImage(imageBackground),
                      // )),
                      child: SingleChildScrollView(
                        child: Column(children: [
                          SizedBox(
                            height: Height * 0.02,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Row(
                              children: [
                                Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            Dialog(
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.8,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.6,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        ImagesPath +
                                                            cubit
                                                                .profileModel!
                                                                .user!
                                                                .profiles!
                                                                .profile!),
                                                    fit: BoxFit.cover)),
                                          ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.23,
                                      child: HexagonImage(
                                        size: 100,
                                        imageUrl: ImagesPath +
                                            cubit.profileModel!.user!.profiles!
                                                .profile
                                                .toString(),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: Width * 0.02,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: Width * 0.46,
                                      child: text(
                                          title: cubit.profileModel!.user!
                                              .profiles!.fName!,
                                          fontSize: 22,
                                          fontWeight: FontWeight.w500,
                                          overflow: TextOverflow.ellipsis,
                                          softWrap: true,
                                          maxLines: 1,
                                          color: Color0),
                                    ),
                                    SizedBox(
                                      height: Height * 0.01,
                                    ),
                                    Container(
                                      width: Width * 0.4,
                                      child: text(
                                          title:
                                              cubit.profileModel!.user!.email!,
                                          fontSize: 16,
                                          overflow: TextOverflow.ellipsis,
                                          softWrap: true,
                                          maxLines: 1,
                                          fontWeight: FontWeight.w400,
                                          color: Color7),
                                    ),
                                    SizedBox(
                                      height: Height * 0.02,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: Height * 0.03,
                          ),
                          ButtonStaic(
                            context: context,
                            radius: 5,
                            onTap: (() {
                              Navigator.push<void>(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      EditProfile(
                                    profileModel: cubit.profileModel,
                                    image: cubit
                                        .profileModel!.user!.profiles!.profile,
                                  ),
                                ),
                              );
                            }),
                            title: "Edit profile",
                          ),
                          SizedBox(
                            height: Height * 0.05,
                          ),
                          Divider(
                            color: Color.fromRGBO(113, 104, 116, 0.8),
                            thickness: 3,
                          ),
                          ButtonProfile(
                            Height: Height,
                            Width: Width,
                            context: context,
                            icon: Icons.book,
                            title: "Booking Order & Appointments",
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      SelectTypeBooking(),
                                ),
                              );
                            },
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 17.5, right: 10),
                            child:
                                Divider(color: Color.fromRGBO(50, 52, 70, 1)),
                          ),
                          ButtonProfile(
                            Height: Height,
                            Width: Width,
                            context: context,
                            title: "Favourite Istable",
                            icon: Icons.favorite_border,
                            onPressed: () {
                              Navigator.push<void>(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      FaovoaitrIstable(),
                                ),
                              );
                            },
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 17.5, right: 10),
                            child:
                                Divider(color: Color.fromRGBO(50, 52, 70, 1)),
                          ),
                          ButtonProfile(
                            Height: Height,
                            Width: Width,
                            context: context,
                            title: "Consultation HealthCare",
                            icon: Icons.local_hospital,
                            onPressed: () {
                              Navigator.push<void>(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (BuildContext context) => Hostitel(),
                                ),
                              );
                            },
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 17.5, right: 10),
                            child:
                                Divider(color: Color.fromRGBO(50, 52, 70, 1)),
                          ),

                          // ButtonProfile(
                          //   Height: Height,
                          //   Width: Width,
                          //   context: context,
                          //   title: "Payment Methods",
                          //   icon: Icons.payments_outlined,
                          //   onPressed: () {
                          //     Navigator.push<void>(
                          //       context,
                          //       MaterialPageRoute<void>(
                          //         builder: (BuildContext context) =>
                          //             BookingandApp(),
                          //       ),
                          //     );
                          //   },
                          // ),
                          // Padding(
                          //   padding:
                          //       const EdgeInsets.only(left: 17.5, right: 10),
                          //   child:
                          //       Divider(color: Color.fromRGBO(50, 52, 70, 1)),
                          // ),
                          // ButtonProfile(
                          //   Height: Height,
                          //   Width: Width,
                          //   context: context,
                          //   title: "Payment History",
                          //   icon: Icons.payment_outlined,
                          //   onPressed: () {
                          //     Navigator.push<void>(
                          //       context,
                          //       MaterialPageRoute<void>(
                          //         builder: (BuildContext context) =>
                          //             BookingandApp(),
                          //       ),
                          //     );
                          //   },
                          // ),
                          // Padding(
                          //   padding:
                          //       const EdgeInsets.only(left: 17.5, right: 10),
                          //   child:
                          //       Divider(color: Color.fromRGBO(50, 52, 70, 1)),
                          // ),
                          ButtonProfile(
                            Height: Height,
                            Width: Width,
                            context: context,
                            title: "Change Password",
                            icon: Icons.password_outlined,
                            onPressed: () {
                              Navigator.push<void>(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      ChangPasswordProfileApp(),
                                ),
                              );
                            },
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 17.5, right: 10),
                            child:
                                Divider(color: Color.fromRGBO(50, 52, 70, 1)),
                          ),
                          // ButtonProfile(
                          //   Height: Height,
                          //   Width: Width,
                          //   context: context,
                          //   title: "Invites Friends",
                          //   icon: Icons.people_alt_outlined,
                          //   onPressed: () {
                          //     Navigator.push<void>(
                          //       context,
                          //       MaterialPageRoute<void>(
                          //         builder: (BuildContext context) =>
                          //             BookingandApp(),
                          //       ),
                          //     );
                          //   },
                          // ),
                          // Padding(
                          //   padding:
                          //       const EdgeInsets.only(left: 17.5, right: 10),
                          //   child:
                          //       Divider(color: Color.fromRGBO(50, 52, 70, 1)),
                          // ),
                          ButtonProfile(
                            Height: Height,
                            Width: Width,
                            context: context,
                            title: "About Us",
                            icon: Icons.info,
                            onPressed: () {
                              Navigator.push<void>(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      BookingandApp(),
                                ),
                              );
                            },
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 17.5, right: 10),
                            child:
                                Divider(color: Color.fromRGBO(50, 52, 70, 1)),
                          ),
                          ButtonProfile(
                            Height: Height,
                            Width: Width,
                            context: context,
                            title: "Log out",
                            icon: Icons.logout,
                            onPressed: () {
                              cubit.logOut(context);
                            },
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 17.5, right: 10),
                            child:
                                Divider(color: Color.fromRGBO(50, 52, 70, 1)),
                          ),
                          SizedBox(
                            height: Height * 0.04,
                          )
                        ]),
                      ),
                    )
                  : SpinkitWave());
        },
      ),
    );
  }

  Padding ButtonProfile(
      {required double Height,
      required double Width,
      required BuildContext context,
      IconData? icon,
      required String title,
      required void Function()? onPressed}) {
    return Padding(
      padding: const EdgeInsets.only(left: 17.5, right: 10),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromRGBO(71, 181, 255, 0.596)),
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: Height * 0.06,
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            SizedBox(
              width: Width * 0.03,
            ),
            text(
                // "Booking Order & Appointments"
                title: title,
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.white),
            Spacer(),
            IconButton(
                onPressed: onPressed,
                // () {edit profile
                //   Navigator.push<void>(
                //     context,
                //     MaterialPageRoute<void>(
                //       builder: (BuildContext context) => BookingandApp(),
                //     ),
                //   );
                // },
                icon: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Color0,
                    size: 20,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

//  Padding(

//                             padding:
//                                 const EdgeInsets.symmetric(horizontal: 15.0),
//                             child: StreamBuilder<UserResponse>(
//                               stream: cubit
//                                   .userResponseStream, // استخدم الـ stream المرتبط بالبيانات
//                               builder: (BuildContext context,
//                                   AsyncSnapshot<UserResponse> snapshot) {
//                                 if (snapshot.hasData) {
//                                   UserResponse user = snapshot.data!;
//                                   return Row(
//                                     children: [
//                                       // text(title: user.data.image),
//                                       Center(
//                                         child: GestureDetector(
//                                           onTap: () {
//                                             showDialog(
//                                               context: context,
//                                               builder: (BuildContext context) =>
//                                                   Dialog(
//                                                 child: Container(
//                                                   width: MediaQuery.of(context)
//                                                           .size
//                                                           .width *
//                                                       0.8,
//                                                   height: MediaQuery.of(context)
//                                                           .size
//                                                           .height *
//                                                       0.6,
//                                                   decoration: BoxDecoration(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             15.0),
//                                                     image: DecorationImage(
//                                                       image: NetworkImage(
//                                                           user.data.image),
//                                                       fit: BoxFit.cover,
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             );
//                                           },
//                                           child: Container(
//                                             width: MediaQuery.of(context)
//                                                     .size
//                                                     .width *
//                                                 0.4,
//                                             height: MediaQuery.of(context)
//                                                     .size
//                                                     .height *
//                                                 0.22,
//                                             child: HexagonImage(
//                                               size: 100,
//                                               imageUrl: user.data.image,
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         width: Width * 0.02,
//                                       ),
//                                       Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Container(
//                                             width: Width * 0.46,
//                                             child: text(
//                                               title: user.data.name,
//                                               fontSize: 20,
//                                               fontWeight: FontWeight.w700,
//                                               overflow: TextOverflow.ellipsis,
//                                               softWrap: true,
//                                               maxLines: 1,
//                                               color: Color0,
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: Height * 0.01,
//                                           ),
//                                           Container(
//                                             width: Width * 0.4,
//                                             child: text(
//                                               title: user.data.email,
//                                               fontSize: 13,
//                                               overflow: TextOverflow.ellipsis,
//                                               softWrap: true,
//                                               maxLines: 1,
//                                               fontWeight: FontWeight.w400,
//                                               color: Color7,
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: Height * 0.02,
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   );
//                                 } else if (snapshot.hasError) {
//                                   return Text('Error: ${snapshot.error}');
//                                 } else {
//                                   return CircularProgressIndicator();
//                                 }
//                               },
//                             ),
//                           ),
