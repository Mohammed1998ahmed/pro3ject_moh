import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';
import 'package:thi/Health%20care/deatils/cubit/details_health_cubit.dart';
import 'package:thi/component/Widght.dart';
import 'package:thi/component/conset/Const.dart';
import 'package:thi/sharePreferinces/shardprefericences.dart';

class ScreenHealth2 extends StatelessWidget {
  final DetailsHealthCubit cubit;
  final int health_id;

  ScreenHealth2({super.key, required this.health_id, required this.cubit});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailsHealthCubit()
        ..getDataClubGetRevewListModel(health_id)
        ..postIsReservation(
            health_id: health_id,
            Profile_Id: CachShpreafapp.getdata(key: "ProfileID"))
        ..userHasReviewInTrainerTrinner(
            health_id: health_id,
            profile_id: CachShpreafapp.getdata(key: "ProfileID"))
        ..getRatingID(
            Helth_id: health_id,
            Profile_id: CachShpreafapp.getdata(key: "ProfileID")),
      child: BlocConsumer<DetailsHealthCubit, DetailsHealthState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = DetailsHealthCubit.getObject(context);
          // print(cubit.getRevewListModel!.reviews![0].profile!.id.toString() +
          //     "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLffffLLL" +
          //     CachShpreafapp.getdata(key: "ProfileID").toString());
          double width = MediaQuery.of(context).size.width;
          double height = MediaQuery.of(context).size.height;
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
                    children: [
                      cubit.isReservitionModel == null
                          ? Center(child: SpinkitWave())
                          : cubit.isReservitionModel!.status == false
                              ? Container()
                              : Row(
                                  children: [
                                    text(
                                        title: "Write your Review",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black),
                                    Spacer(),
                                    Container(
                                      // color: Colors.red,
                                      width: width * 0.3,
                                      height: height * 0.02,
                                      alignment: Alignment.center,
                                      child: SmoothStarRating(
                                        borderColor:
                                            Color.fromRGBO(112, 112, 112, 1),
                                        color: Color.fromRGBO(228, 179, 67, 1),
                                        rating: cubit.rating,
                                        // isReadOnly: false,
                                        size: 20,
                                        filledIconData: Icons.star,
                                        halfFilledIconData: Icons.star_half,
                                        defaultIconData: Icons.star_border,
                                        starCount: 5,
                                        allowHalfRating: true,
                                        spacing: 2.0,
                                        onRatingChanged: (v1) {
                                          cubit.chaingStar(v1);
                                          // // cubit
                                          // // setState(() {
                                          //   rating1 = v1;
                                          // // });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                      cubit.isReservitionModel == null
                          ? Center(child: SpinkitWave())
                          : cubit.isReservitionModel!.status == false
                              ? Container()
                              : Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: Stack(
                                          alignment: Alignment.bottomLeft,
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
                                              width: width * 0.3,
                                              height: height * 0.19,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0)),
                                              // radius: 28,
                                              clipBehavior: Clip.antiAlias,

                                              //                                             key: "FName", value: loginModel!.data!.user!.profiles!.fName!);
                                              // CachShpreafapp.sevedata(
                                              //     key: "LName", value: loginModel!.data!.user!.profiles!.lName!);
                                              // CachShpreafapp.sevedata(
                                              //     key: "ImageProfile",
                                              // backgroundColor: Colors.transparent,""
                                              child: Image.network(
                                                ImagesPath +
                                                    CachShpreafapp.getdata(
                                                            key: "ImageProfile")
                                                        .toString(),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: text(
                                                  title: CachShpreafapp.getdata(
                                                              key: "FName")
                                                          .toString() +
                                                      " " +
                                                      CachShpreafapp.getdata(
                                                              key: "LName")
                                                          .toString(),
                                                  color: Color3,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: width * 0.6,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: Color0,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Column(
                                              children: [
                                                Container(
                                                  width: width * 0.50,
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 10.0),
                                                    child: TextFormField(
                                                      controller:
                                                          cubit.controllerSend,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                      decoration:
                                                          InputDecoration(
                                                        hintText:
                                                            ' Write a message…',
                                                        hintStyle: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Color.fromRGBO(
                                                              142, 142, 147, 1),
                                                        ),
                                                        enabledBorder:
                                                            UnderlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: Colors
                                                                  .transparent),
                                                        ),
                                                        focusedBorder:
                                                            UnderlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: Colors
                                                                  .transparent),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),

                                                // IconButton(
                                                //     onPressed: () {},
                                                //     icon: Icon(Icons.record_voice_over_outlined))
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: height * 0.01,
                                          ),
                                          cubit.userHasReviewInClub == null
                                              ? Container()
                                              : cubit.userHasReviewInClub!
                                                          .status ==
                                                      true
                                                  ? state
                                                          is HomeHelthUpdataLoading
                                                      ? Center(
                                                          child: SpinkitWave())
                                                      : GestureDetector(
                                                          onTap: () {
                                                            cubit.updataReviewSendRevewClub(
                                                                rating_id: cubit.getRatingModel!.id ==
                                                                        null
                                                                    ? 0
                                                                    : cubit
                                                                        .getRatingModel!
                                                                        .id!,
                                                                Id_Helth:
                                                                    health_id,
                                                                Profile_ID:
                                                                    CachShpreafapp
                                                                        .getdata(
                                                                            key:
                                                                                "ProfileID"),
                                                                rating: cubit
                                                                    .rating
                                                                    .toInt(),
                                                                review: cubit
                                                                    .controllerSend
                                                                    .text);
                                                            // cubit.updataReviewSendRevewTrinner(
                                                            //     trainer_id:
                                                            //         trainer_id,
                                                            //     rating_id: cubit
                                                            //         .createReview!
                                                            //         .rating!
                                                            //         .id!,
                                                            //     idUser: CachShpreafapp
                                                            //         .getdata(
                                                            //             key:
                                                            //                 "UserID"),
                                                            //     rating: cubit.rating
                                                            //         .toInt(),
                                                            //     review: cubit
                                                            //         .controllerSend
                                                            //         .text);
                                                            ////////////////////////////
                                                            // cubit.postGetSendRevewTrinner(
                                                            //     trainer_id: trainer_id,
                                                            //     idUser: CachShpreafapp
                                                            //         .getdata(
                                                            //             key: "UserID"),
                                                            //     rating: cubit.rating
                                                            //         .toInt(),
                                                            //     review: cubit
                                                            //         .controllerSend
                                                            //         .text);
                                                            //////////////
                                                            // cubit
                                                            //     .getDataGetAverageTrinnerRevewModel(
                                                            //         trainer_id);
                                                            print("Updata");
                                                          },
                                                          child: Container(
                                                            width: width * 0.5,
                                                            height:
                                                                height * 0.070,
                                                            alignment: Alignment
                                                                .center,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                                color: Color4),
                                                            child: text(
                                                                title: "Updata",
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: Color3),
                                                          ),
                                                        )
                                                  : state
                                                          is HomeHelthPostReivewLoading
                                                      ? Center(
                                                          child: SpinkitWave())
                                                      : GestureDetector(
                                                          onTap: () {
                                                            cubit.postGetSendRevewModel(
                                                                id_Helth:
                                                                    health_id,
                                                                Profile_ID:
                                                                    CachShpreafapp
                                                                        .getdata(
                                                                            key:
                                                                                "ProfileID"),
                                                                rating: cubit
                                                                    .rating
                                                                    .toInt(),
                                                                review: cubit
                                                                    .controllerSend
                                                                    .text);
                                                            cubit
                                                                .getDataGetAverageRevewModel(
                                                                    health_id);
                                                            print("post");
                                                          },
                                                          child: Container(
                                                            width: width * 0.5,
                                                            height:
                                                                height * 0.070,
                                                            alignment: Alignment
                                                                .center,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                                color: Color4),
                                                            child: text(
                                                                title: "Post",
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: Color3),
                                                          ),
                                                        )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                      Divider(
                        color: Color.fromRGBO(50, 52, 70, 1),
                        thickness: 1.0,
                      ),
                      Row(
                        children: [
                          text(
                              title: "All Reviews",
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Color3),
                          Spacer(),
                          cubit.getRevewListModel != null
                              ? text(
                                  title:
                                      cubit.getRevewListModel!.reviews == null
                                          ? "(0)"
                                          : "(" +
                                              cubit.getRevewListModel!.reviews!
                                                  .length
                                                  .toString() +
                                              ")",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: Color3)
                              : text(
                                  title: "(" + "0" + ")",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: Color4),
                        ],
                      ),
                      cubit.getRevewListModel == null
                          ? Center(child: SpinkitWave())
                          : Container(
                              width: width,
                              height: height * 0.50,
                              child: ListView.separated(
                                // shrinkWrap: false,
                                itemCount: cubit.getRevewListModel!.reviews ==
                                        null
                                    ? 0
                                    : cubit.getRevewListModel!.reviews!.length,
                                separatorBuilder: (BuildContext, int) =>
                                    Divider(
                                  color: Color.fromRGBO(138, 134, 139, 0.8),
                                ),
                                itemBuilder: (context, index) {
                                  // ignore: unused_local_variable
                                  final conversation = conversations[index];
                                  return Column(
                                    children: [
                                      ListTile(
                                        leading: Container(
                                          // color: Color0,
                                          width: width * 0.2,
                                          height: height * .15,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      ImagesPath +
                                                          cubit
                                                              .getRevewListModel!
                                                              .reviews![index]
                                                              .profile!
                                                              .profile
                                                              .toString()),
                                                  fit: BoxFit.cover)),
                                        ),
                                        title: Row(
                                          children: [
                                            text(
                                              title: cubit
                                                      .getRevewListModel!
                                                      .reviews![index]
                                                      .profile!
                                                      .fName
                                                      .toString() +
                                                  " " +
                                                  cubit
                                                      .getRevewListModel!
                                                      .reviews![index]
                                                      .profile!
                                                      .lName
                                                      .toString(),
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.87),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            Spacer(),
                                            Container(
                                              // width: width * 0.3,
                                              padding: EdgeInsets.all(2),
                                              decoration: BoxDecoration(
                                                  color: Color0,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0)),
                                              child: Container(
                                                width: width * 0.2,
                                                // height: 50,
                                                child: text(
                                                  title:
                                                      '${cubit.getRevewListModel!.reviews![index].reviewTime.toString()}',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  softWrap: true,

                                                  maxLines:
                                                      1, // عرض الوقت المحدد لكل رسالة
                                                  textAlign: TextAlign.center,

                                                  color: Color3,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        subtitle: Row(
                                          children: [
                                            SmoothStarRating(
                                              borderColor: Color.fromRGBO(
                                                  112, 112, 112, 1),
                                              color: Color.fromRGBO(
                                                  228, 179, 67, 1),
                                              rating: double.parse(cubit
                                                  .getRevewListModel!
                                                  .reviews![index]
                                                  .rating
                                                  .toString()),
                                              // isReadOnly: false,
                                              size: 20,
                                              filledIconData: Icons.star,
                                              halfFilledIconData:
                                                  Icons.star_half,
                                              defaultIconData:
                                                  Icons.star_border,
                                              starCount: 5,
                                              allowHalfRating: true,
                                              spacing: 2.0,
                                              onRatingChanged: (v) {
                                                rating = v;
                                                // setState(() {
                                                //   rating = v;
                                                // });
                                              },
                                            ),
                                            CachShpreafapp.getdata(
                                                        key: "ProfileID") ==
                                                    cubit
                                                        .getRevewListModel!
                                                        .reviews![index]
                                                        .profile!
                                                        .id!
                                                ? IconButton(
                                                    onPressed: () {
                                                      showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return AlertDialog(
                                                            title: Text(
                                                                'Delete Item'),
                                                            content: Text(
                                                                'Are you sure you want to delete the item?'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () {
                                                                  cubit
                                                                      .deleteRevewTrinner(
                                                                    Helth_id:
                                                                        health_id,
                                                                    Profile_id:
                                                                        CachShpreafapp.getdata(
                                                                            key:
                                                                                "ProfileID"),
                                                                    rating_id: cubit
                                                                        .getRevewListModel!
                                                                        .reviews![
                                                                            index]
                                                                        .id!,
                                                                  );
                                                                  // cubit.deleteRevewTrinner(
                                                                  //     trainer_id:
                                                                  //         trainer_id,
                                                                  //     idUser: CachShpreafapp.getdata(
                                                                  //         key:
                                                                  //             "UserID"),
                                                                  //     rating_id: cubit
                                                                  //         .getAllReviewUserByTrinner!
                                                                  //         .reviews![
                                                                  //             index]
                                                                  //         .id!);
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                  cubit.userHasReviewInTrainerTrinner(
                                                                      health_id:
                                                                          health_id,
                                                                      profile_id:
                                                                          CachShpreafapp.getdata(
                                                                              key: "ProfileID"));
                                                                  ////////////////
                                                                  // cubit.deleteRating ==
                                                                  //         null
                                                                  //     ? status =
                                                                  //         false
                                                                  //     : status = cubit
                                                                  //         .deleteRating!
                                                                  //         .status!;

                                                                  // if (status ==
                                                                  //     true) {
                                                                  //   Navigator.of(
                                                                  //           context)
                                                                  //       .pop();
                                                                  // }
                                                                  // ;

                                                                  // Perform delete action here
                                                                },
                                                                child: Text(
                                                                    'Delete'),
                                                              ),
                                                              TextButton(
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                                child: Text(
                                                                    'Cancel'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    },
                                                    icon: Icon(
                                                      Icons.delete,
                                                      color: Colors.red,
                                                    ),
                                                  )
                                                : Container()
                                          ],
                                        ),
                                        // onTap: () {
                                        //   // Navigator.push<void>(
                                        //   //   context,
                                        //   //   MaterialPageRoute<void>(
                                        //   //     builder: (BuildContext context) => ChatScreen(),
                                        //   //   ),
                                        //   // ); // Navigate to chat screen for selected conversation
                                        // },
                                      ),
                                      text(
                                          title: cubit.getRevewListModel!
                                              .reviews![index].review
                                              .toString(),
                                          color: Color.fromRGBO(0, 0, 0, 0.5),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ],
                                  );
                                },
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
