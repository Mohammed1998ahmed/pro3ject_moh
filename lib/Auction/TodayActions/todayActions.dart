import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thi/Auction/AuctionCalender/cubit/auction_calender_cubit.dart';
import 'package:thi/Auction/DetlisHours/detailsHoroses.dart';
import 'package:thi/Auction/Sorting/sorting.dart';
import 'package:thi/component/Widght.dart';
import 'package:thi/component/conset/Const.dart';
import 'package:thi/sharePreferinces/shardprefericences.dart';

import '../FilterAuction/Fiter.dart';

class TodayActionsScreen extends StatefulWidget {
  const TodayActionsScreen({Key? key, required this.cubit}) : super(key: key);
  final AuctionCalenderCubit cubit;

  @override
  State<TodayActionsScreen> createState() => _filterScreenState();
}

class _filterScreenState extends State<TodayActionsScreen> {
  bool p1 = false;
  bool p2 = false;
  bool p3 = false;
  String? selectedOption;
  bool shimer = true;
  List<String> options = [
    'Price',
    'Data',
  ];
  @override
  void initState() {
    super.initState();
    selectedOption = options[0]; // تعيين الخيار الأول كافتراضي
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => AuctionCalenderCubit()..geTodyActions(),
      child: BlocConsumer<AuctionCalenderCubit, AuctionCalenderState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = AuctionCalenderCubit.getObject(context);
          return Scaffold(
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(imageBackground), fit: BoxFit.fill),
                // borderRadius: BorderRadius.circular(10),
              ),
              child: cubit.getTodayActions == null
                  ? Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Center(child: SpinkitWave()),
                    )
                  : cubit.getTodayActions!.auctions == null
                      ? Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child: Column(
                            children: [
                              AppBar(
                                  leading: IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(
                                      Icons.arrow_back,
                                      color: Color0,
                                      size: 30,
                                    ),
                                  ),
                                  centerTitle: true,
                                  toolbarHeight: 80,
                                  backgroundColor: Colors.transparent,
                                  elevation: 0,
                                  title: text(
                                      title: "Auctions Calendar",
                                      color: Color0)),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.4,
                              ),
                              Center(
                                child: text(title: "Not Found"),
                              )
                            ],
                          ),
                        )
                      : SingleChildScrollView(
                          child: Column(
                            children: [
                              AppBar(
                                leading: IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(
                                    Icons.arrow_back,
                                    color: Color0,
                                    size: 30,
                                  ),
                                ),
                                centerTitle: true,
                                toolbarHeight: 80,
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                                title: cubit.getTodayActions == null
                                    ? Container()
                                    : cubit.getTodayActions!.auctions == null
                                        ? text(
                                            title: "Auctions Calendar",
                                            color: Color0)
                                        : text(
                                            title:
                                                '${cubit.getTodayActions == null ? 0 : cubit.getTodayActions!.auctions!.length.toString()} Houses',
                                            color: Color0,
                                            fontSize: 22,
                                            fontWeight: FontWeight.w900),
                                actions: [
                                  cubit.getTodayActions!.auctions == null
                                      ? Container()
                                      : Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          child: Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.push<void>(
                                                    context,
                                                    MaterialPageRoute<void>(
                                                      builder: (BuildContext
                                                              context) =>
                                                          Filters(),
                                                    ),
                                                  );
                                                },
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.2,
                                                  height: height * 0.08,
                                                  decoration: BoxDecoration(
                                                      color: Color0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: Icon(
                                                    Icons.filter_alt_outlined,
                                                    color: Colors.white,
                                                    size: 30,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.push<void>(
                                                    context,
                                                    MaterialPageRoute<void>(
                                                      builder: (BuildContext
                                                              context) =>
                                                          SortBy(),
                                                    ),
                                                  );
                                                },
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.2,
                                                  height: height * 0.08,
                                                  decoration: BoxDecoration(
                                                      color: Color0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: Icon(
                                                    Icons.sort,
                                                    color: Colors.white,
                                                    size: 30,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                ],
                              ),
                              Divider(
                                thickness: 2.0,
                                color: Color0,
                              ),
                              Container(
                                width: width,
                                height: height * 0.84,
                                child: ListView.builder(
                                  itemCount:
                                      cubit.getTodayActions!.auctions!.length,
                                  itemBuilder: (context, index) {
                                    return cubit.getTodayActions == null
                                        ? shimmerWidght(width, height)
                                        : AuctionHours(
                                            context: context,
                                            ID_Auction: cubit
                                                .getTodayActions!
                                                .auctions![index]
                                                .horses!
                                                .auctionId!,
                                            assetName: cubit
                                                .getTodayActions!
                                                .auctions![index]
                                                .horses!
                                                .images![0]
                                                .toString(),
                                            title1: cubit.getTodayActions!.auctions![index].description
                                                .toString(),
                                            textColor: cubit.getTodayActions!
                                                .auctions![index].horses!.color
                                                .toString(),
                                            textBirthData: cubit
                                                .getTodayActions!
                                                .auctions![index]
                                                .horses!
                                                .birth
                                                .toString(),
                                            textGender: cubit.getTodayActions!
                                                .auctions![index].horses!.gender
                                                .toString(),
                                            textPrice:
                                                '${cubit.getTodayActions!.auctions![index].initialPrice.toString()} AED',
                                            textName: cubit.getTodayActions!
                                                .auctions![index].horses!.name
                                                .toString(),
                                            // titleData: '1${index}d 18h 50m',
                                            onTap: () {
                                              Navigator.push<void>(
                                                context,
                                                MaterialPageRoute<void>(
                                                  builder:
                                                      (BuildContext context) =>
                                                          DetailsHoeoses(
                                                    IDActions: cubit
                                                        .getTodayActions!
                                                        .auctions![index]
                                                        .horses!
                                                        .auctionId!,
                                                  ),
                                                ),
                                              );
                                            });
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
            ),
          );
        },
      ),
    );
  }

  Padding AuctionHours(
      {required BuildContext context,
      void Function()? onTap,
      required String assetName,
      required String title1,
      required String textName,
      required String textColor,
      required String textGender,
      required String textBirthData,
      required String textPrice,
      required int ID_Auction}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.44,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Color0.withOpacity(0.3),
            borderRadius: BorderRadius.circular(15),
          ),
          margin: const EdgeInsets.only(bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.21,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(ImagesPath + assetName),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    text(
                        title: title1,
                        color: Color0,
                        fontSize: 18,
                        fontWeight: FontWeight.w900),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Name : ',
                            style: TextStyle(
                              color: Color0,
                              fontSize: 14,
                              fontFamily: 'Caveat',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                          TextSpan(
                            text: textName,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Caveat',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Color : ',
                            style: TextStyle(
                              color: Color0,
                              fontSize: 14,
                              fontFamily: 'Caveat',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                          TextSpan(
                            text: textColor,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Caveat',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Gender : ',
                            style: TextStyle(
                              color: Color0,
                              fontSize: 14,
                              fontFamily: 'Caveat',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                          TextSpan(
                            text: textGender,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Caveat',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Birth Date : ',
                            style: TextStyle(
                              color: Color0,
                              fontSize: 14,
                              fontFamily: 'Caveat',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                          TextSpan(
                            text: textBirthData,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Caveat',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Row(
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Price : ',
                                style: TextStyle(
                                  color: Color0,
                                  fontSize: 14,
                                  fontFamily: 'Caveat',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              TextSpan(
                                text: textPrice,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily: 'Caveat',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        CachShpreafapp.getdata(
                                        key:
                                            "boolBid${CachShpreafapp.getdata(key: "UserID")}${ID_Auction}")
                                    as bool? ??
                                false
                            ? Container(
                                width: MediaQuery.of(context).size.width * 0.3,
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                color: Color0,
                                alignment: AlignmentDirectional.center,
                                child: text(title: "Shared", color: Color3),
                              )
                            : Container()
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container shimmerWidght(double width, double height) {
    return Container(
      width: width,
      height: height,
      child: ListView.builder(
        itemBuilder: (BuildContext, int) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimerWidght(
                  width: width * 0.90,
                  height: height * 0.2,
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                ShimerWidght(
                  width: width * 0.50,
                  height: height * 0.028,
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                ShimerWidght(
                  width: width * 0.40,
                  height: height * 0.028,
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                ShimerWidght(
                  width: width * 0.30,
                  height: height * 0.028,
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                ShimerWidght(
                  width: width * 0.450,
                  height: height * 0.028,
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      ShimerWidght(
                        width: width * 0.250,
                        height: height * 0.028,
                      ),
                      Spacer(),
                      ShimerWidght(
                        width: width * 0.250,
                        height: height * 0.03,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: 6,
      ),
    );
  }

  void showDropdownMenu() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Sort by'),
          content: DropdownButton<String>(
            value: selectedOption,
            onChanged: (String? newValue) {
              setState(() {
                selectedOption = newValue;
              });
            },
            items: options.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('إغلاق'),
            ),
          ],
        );
      },
    );
  }
}
