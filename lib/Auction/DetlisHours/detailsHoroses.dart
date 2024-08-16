import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thi/Auction/AuctionShare/auctionShare.dart';
import 'package:thi/Auction/DetlisHours/cubit/detlis_hours_cubit.dart';
import 'package:thi/Auction/DetlisHours/videoFolder/videoPages.dart';
import 'package:thi/component/Widght.dart';
import 'package:thi/component/conset/Const.dart';
import 'package:thi/sharePreferinces/shardprefericences.dart';

class DetailsHoeoses extends StatelessWidget {
  // ignore: unused_field

  final List<String> images = [
    'assets/images/image 112.png',
    'assets/images/image 112.png',
    'assets/images/image 112.png',
    'assets/images/image 112.png',
  ];
  final int IDActions;

  DetailsHoeoses({super.key, required this.IDActions});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => DetlisHoursCubit()
        ..getDeaitlsActions(IDActions)
        ..GetTimeActionModelUpComing(idAuctions: IDActions),
      child: BlocConsumer<DetlisHoursCubit, DetlisHoursState>(
        listener: (context, state) {
          if (state is FilterScreenTimeUpComingPayMentSceccfuly) {
            Navigator.push<void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => AuctionShare(
                  ID_Auctions: IDActions,
                  initAmount: state.detailsActionsID.auction!.initialPrice!,
                ),
              ),
            );
            CachShpreafapp.sevedata(
                key:
                    "boolBid${CachShpreafapp.getdata(key: "UserID")}${IDActions}",
                value: true);
          }
          if (state is DetlisHoursFavoiteRemoveSceccfuly) {
            // Navigator.pushReplacement(
            //   context,
            //   MaterialPageRoute<void>(
            //     builder: (BuildContext context) => ActionCalunder(),
            //   ),
            // );
          }
        },
        builder: (context, state) {
          final cubit = DetlisHoursCubit.getObject(context);
          return Scaffold(
            body: cubit.detailsActionsID == null
                ? Center(child: SpinkitWave())
                : SingleChildScrollView(
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(imageBackground),
                            fit: BoxFit.fill),
                        // borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        verticalDirection: VerticalDirection.down,
                        children: [
                          AppBar(
                            leading: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                color: Color0,
                              ),
                            ),
                            centerTitle: true,
                            toolbarHeight: height * 0.05,
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            title: text(
                                title: 'Information',
                                color: Color0,
                                fontSize: 22,
                                fontWeight: FontWeight.w800),
                            actions: [
                              IconButton(
                                icon: CachShpreafapp.getdata(
                                        key:
                                            "boolfavoratieActions${CachShpreafapp.getdata(key: "UserID")}${IDActions}")
                                    ? Icon(
                                        Icons.star,
                                        color: Color0,
                                        size: 30,
                                      )
                                    : Icon(
                                        Icons.star_border,
                                        size: 30,
                                      ),
                                onPressed: () {
                                  // cubit.getFavorite();
                                  CachShpreafapp.getdata(
                                          key:
                                              "boolfavoratieActions${CachShpreafapp.getdata(key: "UserID")}${IDActions}")
                                      ? cubit.postRemoveFavoratie(
                                          idActions: IDActions,
                                          idUser: CachShpreafapp.getdata(
                                              key: "UserID"),
                                          context: context)
                                      : cubit.postFavoratie(
                                          idActions: IDActions,
                                          idUser: CachShpreafapp.getdata(
                                              key: "UserID"));
                                  // cubit.postFavoratie(
                                  //     idActions: IDActions,
                                  //     idUser: CachShpreafapp.getdata(
                                  //         key: "UserID"));
                                  // cubit.chaingBooleanFav();
                                },
                              ),
                            ],
                          ),
                          Container(
                            height: height * .3,
                            width: width,
                            child: CarouselSlider(
                              options: CarouselOptions(
                                reverse: true,
                                height: height * .3,
                                autoPlay: true,
                                aspectRatio: 3,
                                enlargeCenterPage: true,
                                onPageChanged: (index, reason) {
                                  // setState(() {
                                  cubit.chaingIndexImageAppBar(index);
                                  // currentIndex = index;
                                  print(cubit.currentIndex.toString());
                                  // });
                                },
                              ),
                              items: cubit
                                  .detailsActionsID!.auction!.horses!.images!
                                  .map((image) => Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15.0)),
                                        clipBehavior: Clip.antiAlias,
                                        child: Image.network(
                                          ImagesPath + image,
                                          height: height * .3,
                                          width: width,
                                          fit: BoxFit.fill,
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.04,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Container(
                                  child: text(title: "To watch a video:"),
                                ),
                                Spacer(),
                                ElevatedButton(
                                    onPressed: () {
                                      print(cubit.detailsActionsID!.auction!
                                              .horses!.video
                                              .toString() +
                                          "LLLLLLLLLLLLLLLLLLLLLLL");
                                      Navigator.push<void>(
                                        context,
                                        MaterialPageRoute<void>(
                                          builder: (BuildContext context) =>
                                              VideoApp(
                                            Urlvideo: cubit.detailsActionsID!
                                                .auction!.horses!.video
                                                .toString(),
                                          ),
                                        ),
                                      );
                                    },
                                    child: text(title: "Video"))
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Horse Name :  ',
                                          style: TextStyle(
                                            color: Color0,
                                            fontSize: 18,
                                            fontFamily: 'Caveat',
                                            fontWeight: FontWeight.w600,
                                            // height: 0,
                                          ),
                                        ),
                                        TextSpan(
                                          text: cubit.detailsActionsID!.auction!
                                              .horses!.name
                                              .toString(),
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontFamily: 'Caveat',
                                            fontWeight: FontWeight.w400,
                                            // height: 0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Gender : ',
                                              style: TextStyle(
                                                color: Color0,
                                                fontSize: 18,
                                                fontFamily: 'Caveat',
                                                fontWeight: FontWeight.w600,
                                                // height: 0,
                                              ),
                                            ),
                                            TextSpan(
                                              text: cubit.detailsActionsID!
                                                  .auction!.horses!.gender
                                                  .toString(),
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontFamily: 'Caveat',
                                                fontWeight: FontWeight.w400,
                                                // height: 0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Birth Date : ',
                                          style: TextStyle(
                                            color: Color0,
                                            fontSize: 18,
                                            fontFamily: 'Caveat',
                                            fontWeight: FontWeight.w600,
                                            // height: 0,
                                          ),
                                        ),
                                        TextSpan(
                                          text: cubit.detailsActionsID!.auction!
                                              .horses!.birth
                                              .toString(),
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontFamily: 'Caveat',
                                            fontWeight: FontWeight.w400,
                                            // height: 0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Category : ',
                                              style: TextStyle(
                                                color: Color0,
                                                fontSize: 18,
                                                fontFamily: 'Caveat',
                                                fontWeight: FontWeight.w600,
                                                // height: 0,
                                              ),
                                            ),
                                            TextSpan(
                                              text: cubit.detailsActionsID!
                                                  .auction!.horses!.category
                                                  .toString(),
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                textBaseline:
                                                    TextBaseline.alphabetic,
                                                fontFamily: 'Caveat',
                                                fontWeight: FontWeight.w400,
                                                // height: 0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Color : ',
                                          style: TextStyle(
                                            color: Color0,
                                            fontSize: 18,
                                            fontFamily: 'Caveat',
                                            fontWeight: FontWeight.w400,
                                            // height: 0,
                                          ),
                                        ),
                                        TextSpan(
                                          text: cubit.detailsActionsID!.auction!
                                              .horses!.color
                                              .toString(),
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontFamily: 'Caveat',
                                            fontWeight: FontWeight.w400,
                                            // height: 0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Location : ',
                                          style: TextStyle(
                                            color: Color0,
                                            fontSize: 18,
                                            fontFamily: 'Caveat',
                                            fontWeight: FontWeight.w600,
                                            // height: 0,
                                          ),
                                        ),
                                        TextSpan(
                                          text: cubit.detailsActionsID!.auction!
                                              .horses!.address
                                              .toString(),
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontFamily: 'Caveat',
                                            fontWeight: FontWeight.w400,
                                            // height: 0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Owner : ',
                                          style: TextStyle(
                                            color: Color0,
                                            fontSize: 18,
                                            fontFamily: 'Caveat',
                                            fontWeight: FontWeight.w600,
                                            // height: 0,
                                          ),
                                        ),
                                        TextSpan(
                                          text: cubit.detailsActionsID!.auction!
                                                  .profile!.fName
                                                  .toString() +
                                              " " +
                                              cubit.detailsActionsID!.auction!
                                                  .profile!.fName
                                                  .toString()
                                                  .toString(),
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontFamily: 'Caveat',
                                            fontWeight: FontWeight.w400,
                                            // height: 0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Address : ',
                                          style: TextStyle(
                                            color: Color0,
                                            fontSize: 18,
                                            fontFamily: 'Caveat',
                                            fontWeight: FontWeight.w600,
                                            // height: 0,
                                          ),
                                        ),
                                        TextSpan(
                                          text: cubit.detailsActionsID!.auction!
                                              .profile!.user!.email
                                              .toString(),
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontFamily: 'Caveat',
                                            fontWeight: FontWeight.w400,
                                            // height: 0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black,
                                                    width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: Color0),
                                            padding: EdgeInsets.all(10),
                                            child: Column(
                                              children: [
                                                Text(
                                                  'Start of auction : ',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontFamily: 'Caveat',
                                                    fontWeight: FontWeight.w600,
                                                    // height: 0,
                                                  ),
                                                ),
                                                Text(
                                                  cubit.detailsActionsID!
                                                      .auction!.begin
                                                      .toString(),
                                                  style: TextStyle(
                                                    color: Color(0xFFAC0000),
                                                    fontSize: 18,
                                                    fontFamily: 'Caveat',
                                                    fontWeight: FontWeight.w400,
                                                    // height: 0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black,
                                                    width: 1),
                                                color: Color0,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        15.0)),
                                            padding: EdgeInsets.all(10),
                                            child: Column(
                                              children: [
                                                Text(
                                                  'End of Auction: ',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontFamily: 'Caveat',
                                                    fontWeight: FontWeight.w600,
                                                    // height: 0,
                                                  ),
                                                ),
                                                Text(
                                                  cubit.detailsActionsID!
                                                      .auction!.end
                                                      .toString(),
                                                  style: TextStyle(
                                                    color: Color(0xFFAC0000),
                                                    fontSize: 18,
                                                    fontFamily: 'Caveat',
                                                    fontWeight: FontWeight.w400,
                                                    // height: 0,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  Center(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: width * 0.90,
                                          height: height * 0.055,
                                          //margin: EdgeInsets.fromLTRB(20, 20, 0.0, 10),
                                          //  padding: EdgeInsets.only(bottom: 10),
                                          decoration: BoxDecoration(
                                            color: Color0,
                                            border: Border.all(
                                                color: Colors.black, width: 1),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            shape: BoxShape.rectangle,
                                          ),
                                          child: Center(
                                            child: text(
                                                title:
                                                    'Price: ${cubit.detailsActionsID!.auction!.initialPrice.toString()} AED',
                                                color: Color3,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        SizedBox(
                                          height: height * 0.01,
                                        ),
                                        Container(
                                          width: width * 0.90,
                                          height: height * 0.055,
                                          // margin: EdgeInsets.fromLTRB(0.0, 20, 0.0, 10),
                                          //padding: EdgeInsets.only(bottom: 10),
                                          decoration: BoxDecoration(
                                            color: Color0,
                                            border: Border.all(
                                                color: Colors.black, width: 1),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            shape: BoxShape.rectangle,
                                          ),
                                          child:
                                              cubit.getTimeActionModel == null
                                                  ? Container()
                                                  : Center(
                                                      child: text(
                                                          title:
                                                              'Time left: ${cubit.getTimeActionModel!.daysLeft.toString()}d ${cubit.getTimeActionModel!.hoursLeft.toString()}h ${cubit.getTimeActionModel!.minutesLeft.toString()}m',
                                                          color: Color3,
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.02,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CachShpreafapp.getdata(
                                                    key:
                                                        "boolBid${CachShpreafapp.getdata(key: "UserID")}${IDActions}")
                                                as bool? ??
                                            false
                                        ? GestureDetector(
                                            onTap: () {
                                              Navigator.push<void>(
                                                context,
                                                MaterialPageRoute<void>(
                                                  builder:
                                                      (BuildContext context) =>
                                                          AuctionShare(
                                                    ID_Auctions: IDActions,
                                                    initAmount: cubit
                                                        .detailsActionsID!
                                                        .auction!
                                                        .initialPrice!,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Center(
                                              child: Container(
                                                alignment:
                                                    AlignmentDirectional.center,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.3,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.06,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.0),
                                                    color: Color4),
                                                child: text(
                                                    title: "Next",
                                                    color: Color3,
                                                    fontSize: 20),
                                              ),
                                            ))
                                        : Center(
                                            child: Container(
                                              height: height * 0.090,
                                              width: width * 0.8,
                                              decoration: BoxDecoration(
                                                color: Color0,
                                                border: Border.all(
                                                    color: Colors.black,
                                                    width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                shape: BoxShape.rectangle,
                                              ),
                                              child: ListTile(
                                                leading: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    text(
                                                        title: 'Current Bid',
                                                        color: Color3,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                    SizedBox(
                                                      height: height * 0.003,
                                                    ),
                                                    text(
                                                        title: '\$ 300',
                                                        color: Colors.green,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ],
                                                ),
                                                trailing: ElevatedButton(
                                                  onPressed: () {
                                                    cubit.makePayment(
                                                        300, IDActions);
                                                  },
                                                  child: Container(
                                                    width: width * .2,
                                                    height: height * 0.05,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      border: Border.all(
                                                          color: Colors.black),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                    child: Center(
                                                      child: text(
                                                          title: 'Start',
                                                          color: Colors.black,
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                  ),
                                  SizedBox(
                                    height: height * 0.05,
                                  ),
                                ],
                              ),
                            ),
                          ),
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
