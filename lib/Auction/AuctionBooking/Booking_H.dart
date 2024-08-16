import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:thi/Auction/AuctionBooking/cubit/day_booking_cubit.dart';
import 'package:thi/Auction/DetlisHours/detailsHoroses.dart';
import 'package:thi/Auction/FilterAuction/Fiter.dart';
import 'package:thi/Auction/Sorting/sorting.dart';
import 'package:thi/component/Widght.dart';
import 'package:thi/component/conset/Const.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // CalendarController _calendarController = CalendarController();

  @override
  void initState() {
    super.initState();
    // _calendarController = CalendarController();
  }

  @override
  void dispose() {
    // _calendarController.dispose();
    super.dispose();
  }

  bool shimmer = true;
  String? Data;
  DateTime? _selectedDay;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => DayBookingCubit(),
      child: BlocConsumer<DayBookingCubit, DayBookingState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = DayBookingCubit.getObject(context);
          return Scaffold(
            body: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(imageBackground), fit: BoxFit.cover)),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                  centerTitle: true,
                  title: text(
                      title: 'Auctions Calendar',
                      color: Color0,
                      fontSize: 22,
                      fontWeight: FontWeight.w700),
                  leading: Container(),
                ),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      Divider(
                        color: Color0,
                      ),
                      Container(
                        decoration: BoxDecoration(boxShadow: <BoxShadow>[]),
                        margin: EdgeInsets.all(15),
                        height: 50,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shadowColor: Color0,
                                backgroundColor: Color0,
                                minimumSize: const Size(311, 44),
                                elevation: 1,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ))),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return Container(
                                    padding: EdgeInsets.symmetric(vertical: 30),
                                    child: AlertDialog(
                                      title: Text('Select a Date'),
                                      content: TableCalendar(
                                        firstDay: DateTime.utc(2010, 10, 16),
                                        lastDay: DateTime.utc(2030, 3, 14),
                                        focusedDay: DateTime.now(),
                                        calendarFormat: CalendarFormat.month,
                                        selectedDayPredicate: (day) {
                                          return isSameDay(_selectedDay, day);
                                        },
                                        headerStyle: HeaderStyle(
                                          titleCentered: true,
                                          formatButtonVisible: false,
                                        ),
                                        headerVisible: true,
                                        // headerTitleBuilder: (context, focusedDay) {
                                        //   final monthName =
                                        //       DateFormat.MMMM().format(focusedDay);
                                        //   final year =
                                        //       DateFormat.y().format(focusedDay);
                                        //   return Text(
                                        //     '$monthName $year',
                                        //     style: TextStyle(
                                        //       fontSize: 20,
                                        //       fontWeight: FontWeight.bold,
                                        //     ),
                                        //   );
                                        // },
                                        availableCalendarFormats: const {
                                          CalendarFormat.month: '',
                                        },
                                        onDaySelected:
                                            (selectedDay, focusedDay) {
                                          setState(() {
                                            _selectedDay = selectedDay;
                                            String formattedDate =
                                                DateFormat('yyyy-MM-dd')
                                                    .format(_selectedDay!);
                                            print('$formattedDate');
                                            Data = formattedDate;
                                            Navigator.pop(context);
                                            if (Data != null) {
                                              cubit.postUpComing(date: Data!);
                                            }
                                          });
                                        },
                                        onHeaderTapped: (focusedDay) {
                                          print('رفع التقويم للأعلى');
                                        },
                                      ),
                                    ),
                                  );
                                },
                              );

                              print("Deta 1010010101010010100101010");
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                text(
                                  title: Data == null
                                      ? "12 12 2024"
                                      : Data.toString(),
                                  textAlign: TextAlign.center,
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                                Spacer(),
                                IconButton(
                                  icon: Icon(
                                    Icons.date_range,
                                    color: Colors.white,
                                    size: 35,
                                  ),
                                  onPressed: () {},
                                ),
                              ],
                            )),
                      ),
                      cubit.myDataAuctionModel == null
                          ? Center(child: SpinkitWave())
                          : Container(
                              // decoration: BoxDecoration(
                              //   image: DecorationImage(
                              //       image: AssetImage(imageBackground),
                              //       fit: BoxFit.fill),
                              //   // borderRadius: BorderRadius.circular(10),
                              // ),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    // AppBar(
                                    //   leading: IconButton(
                                    //     onPressed: () {
                                    //       Navigator.pop(context);
                                    //     },
                                    //     icon: Icon(
                                    //       Icons.arrow_back,
                                    //       color: Color0,
                                    //       size: 30,
                                    //     ),
                                    //   ),
                                    //   centerTitle: true,
                                    //   toolbarHeight: 80,
                                    //   backgroundColor: Colors.transparent,
                                    //   elevation: 0,
                                    //   title: text(
                                    //       title:
                                    //           '${cubit.myDataAuctionModel!.auctions == null ? 0 : cubit.myDataAuctionModel!.auctions!.length} Houses',
                                    //       color: Color0,
                                    //       fontSize: 22,
                                    //       fontWeight: FontWeight.w900),
                                    //   actions: [
                                    //     Padding(
                                    //       padding: const EdgeInsets.symmetric(
                                    //           horizontal: 5),
                                    //       child: Row(
                                    //         children: [
                                    //           GestureDetector(
                                    //             onTap: () {
                                    //               Navigator.push<void>(
                                    //                 context,
                                    //                 MaterialPageRoute<void>(
                                    //                   builder: (BuildContext
                                    //                           context) =>
                                    //                       Filters(),
                                    //                 ),
                                    //               );
                                    //             },
                                    //             child: Container(
                                    //               width: MediaQuery.of(context)
                                    //                       .size
                                    //                       .width *
                                    //                   0.2,
                                    //               height: height * 0.08,
                                    //               decoration: BoxDecoration(
                                    //                   color: Color0,
                                    //                   borderRadius:
                                    //                       BorderRadius.circular(
                                    //                           10)),
                                    //               child: Icon(
                                    //                 Icons.filter_alt_outlined,
                                    //                 color: Colors.white,
                                    //                 size: 30,
                                    //               ),
                                    //             ),
                                    //           ),
                                    //           SizedBox(
                                    //             width: 5,
                                    //           ),
                                    //           GestureDetector(
                                    //             onTap: () {
                                    //               Navigator.push<void>(
                                    //                 context,
                                    //                 MaterialPageRoute<void>(
                                    //                   builder: (BuildContext
                                    //                           context) =>
                                    //                       SortBy(),
                                    //                 ),
                                    //               );
                                    //             },
                                    //             child: Container(
                                    //               width: MediaQuery.of(context)
                                    //                       .size
                                    //                       .width *
                                    //                   0.2,
                                    //               height: height * 0.08,
                                    //               decoration: BoxDecoration(
                                    //                   color: Color0,
                                    //                   borderRadius:
                                    //                       BorderRadius.circular(
                                    //                           10)),
                                    //               child: Icon(
                                    //                 Icons.sort,
                                    //                 color: Colors.white,
                                    //                 size: 30,
                                    //               ),
                                    //             ),
                                    //           ),
                                    //         ],
                                    //       ),
                                    //     )
                                    //   ],
                                    // ),
                                    Divider(
                                      thickness: 2.0,
                                      color: Color0,
                                    ),
                                    cubit.myDataAuctionModel!.auctions == null
                                        ? Container(
                                            width: width,
                                            height: height * 0.84,
                                            child: Center(
                                                child:
                                                    text(title: "Not Found")))
                                        : Container(
                                            width: width,
                                            height: height * 0.84,
                                            child: ListView.builder(
                                              itemCount: cubit
                                                  .myDataAuctionModel!
                                                  .auctions!
                                                  .length,
                                              itemBuilder: (context, index) {
                                                // cubit.GetTimeActionModelUpComing(
                                                //     idAuctions: cubit
                                                //         .postUpcomingActions!
                                                //         .auctions![index]
                                                //         .horses!
                                                //         .auctionId!);
                                                print(
                                                    "***************************************************************sdjkj");
                                                return cubit.myDataAuctionModel!
                                                            .auctions ==
                                                        null
                                                    ? shimmerWidght(
                                                        width, height)
                                                    : AuctionHours(
                                                        context: context,
                                                        assetName: cubit
                                                            .myDataAuctionModel!
                                                            .auctions![index]
                                                            .horses!
                                                            .images![0]
                                                            .toString(),
                                                        title1: cubit
                                                            .myDataAuctionModel!
                                                            .auctions![index]
                                                            .description
                                                            .toString(),
                                                        textColor: cubit
                                                            .myDataAuctionModel!
                                                            .auctions![index]
                                                            .horses!
                                                            .color
                                                            .toString(),
                                                        textBirthData: cubit
                                                            .myDataAuctionModel!
                                                            .auctions![index]
                                                            .horses!
                                                            .birth
                                                            .toString(),
                                                        textGender: cubit
                                                            .myDataAuctionModel!
                                                            .auctions![index]
                                                            .horses!
                                                            .gender
                                                            .toString(),
                                                        textPrice: '${cubit.myDataAuctionModel!.auctions![index].initialPrice.toString()} AED',
                                                        textName: cubit.myDataAuctionModel!.auctions![index].horses!.name.toString(),
                                                        // titleData: '1${index}d 18h 50m',
                                                        onTap: () {
                                                          Navigator.push<void>(
                                                            context,
                                                            MaterialPageRoute<
                                                                void>(
                                                              builder: (BuildContext
                                                                      context) =>
                                                                  DetailsHoeoses(
                                                                IDActions: cubit
                                                                    .myDataAuctionModel!
                                                                    .auctions![
                                                                        index]
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
                      // Container(
                      //   color: Color0.withOpacity(.3),
                      //   child: TableCalendar(
                      //     firstDay: DateTime.utc(2010, 10, 16),
                      //     lastDay: DateTime.utc(2030, 3, 14),
                      //     focusedDay: DateTime.now(),
                      //     calendarFormat: CalendarFormat.month,
                      //     selectedDayPredicate: (day) {
                      //       return isSameDay(_selectedDay, day);
                      //     },
                      //     onDaySelected: (selectedDay, focusedDay) {
                      //       setState(() {
                      //         _selectedDay = selectedDay;
                      //         String formattedDate =
                      //             DateFormat('dd MMMM yyyy').format(_selectedDay!);
                      //         print('تم الضغط على اليوم: $formattedDate');
                      //       });
                      //     },
                      //     // onHeaderTapped: (focusedDay) {
                      //     //   print('رفع التقويم للأعلى');
                      //     // },
                      //   ),
                      // ),
                      //////////////// edit
                      // Container(
                      //   width: MediaQuery.of(context).size.width * 0.90,
                      //   height: MediaQuery.of(context).size.height * 0.80,
                      //   child: ListView.builder(
                      //     itemBuilder: ((context, index) {
                      //       return shimmer == false
                      //           ? Padding(
                      //               padding: const EdgeInsets.all(8.0),
                      //               child: ShimerWidght(
                      //                 height: height * 0.2,
                      //                 width: width * 0.90,
                      //               ),
                      //             )
                      //           : Padding(
                      //               padding: const EdgeInsets.all(8.0),
                      //               child: GestureDetector(
                      //                 onTap: () {
                      //                   Navigator.push<void>(
                      //                     context,
                      //                     MaterialPageRoute<void>(
                      //                       builder: (BuildContext context) =>
                      //                           MainScreen2(),
                      //                     ),
                      //                   );
                      //                 },
                      //                 child: Card(
                      //                   color: Color0.withOpacity(0.7),
                      //                   shadowColor: Color0,
                      //                   shape: RoundedRectangleBorder(
                      //                     borderRadius:
                      //                         BorderRadius.circular(20),
                      //                   ),
                      //                   elevation: 4,
                      //                   child: Stack(
                      //                     children: [
                      //                       Container(
                      //                         width: MediaQuery.of(context)
                      //                             .size
                      //                             .width,
                      //                         height: MediaQuery.of(context)
                      //                                 .size
                      //                                 .height *
                      //                             0.25,
                      //                         decoration: BoxDecoration(
                      //                           borderRadius:
                      //                               BorderRadius.circular(20),
                      //                           color: Color4,
                      //                           image: DecorationImage(
                      //                             image: AssetImage(
                      //                                 'assets/images/img_21.png'),
                      //                             fit: BoxFit.fill,
                      //                           ),
                      //                         ),
                      //                         padding: EdgeInsets.all(16),
                      //                         child: Column(
                      //                           crossAxisAlignment:
                      //                               CrossAxisAlignment.start,
                      //                           children: [
                      //                             text(
                      //                                 title:
                      //                                     "“End of Season Auction 2024”",
                      //                                 color: Color3.withOpacity(
                      //                                     0.8),
                      //                                 fontSize: 18,
                      //                                 fontWeight:
                      //                                     FontWeight.w900),
                      //                             SizedBox(
                      //                                 height:
                      //                                     MediaQuery.of(context)
                      //                                             .size
                      //                                             .height *
                      //                                         0.06),
                      //                             Spacer(),
                      //                             Row(
                      //                               children: [
                      //                                 Icon(
                      //                                   Icons
                      //                                       .date_range_outlined,
                      //                                   color:
                      //                                       Color3.withOpacity(
                      //                                           0.8),
                      //                                   size: 35,
                      //                                 ),
                      //                                 SizedBox(
                      //                                     width: MediaQuery.of(
                      //                                                 context)
                      //                                             .size
                      //                                             .width *
                      //                                         0.07),
                      //                                 text(
                      //                                     title:
                      //                                         "29 October 2024",
                      //                                     color: Color3
                      //                                         .withOpacity(0.8),
                      //                                     fontSize: 16,
                      //                                     fontWeight:
                      //                                         FontWeight.w900),
                      //                               ],
                      //                             ),
                      //                           ],
                      //                         ),
                      //                       ),
                      //                     ],
                      //                   ),
                      //                 ),
                      //               ));
                      //     }),
                      //     itemCount: 5,
                      //   ),
                      // ),
                      SizedBox(
                        height: 100,
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

  Padding AuctionHours({
    required BuildContext context,
    void Function()? onTap,
    required String assetName,
    required String title1,
    required String textName,
    required String textColor,
    required String textGender,
    required String textBirthData,
    required String textPrice,
  }) {
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

  // void showDropdownMenu() {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text('Sort by'),
  //         content: DropdownButton<String>(
  //           value: selectedOption,
  //           onChanged: (String? newValue) {
  //             setState(() {
  //               selectedOption = newValue;
  //             });
  //           },
  //           items: options.map<DropdownMenuItem<String>>((String value) {
  //             return DropdownMenuItem<String>(
  //               value: value,
  //               child: Text(value),
  //             );
  //           }).toList(),
  //         ),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               Navigator.pop(context);
  //             },
  //             child: Text('إغلاق'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
}
