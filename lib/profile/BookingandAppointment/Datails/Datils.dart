import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thi/component/Widght.dart';
import 'package:thi/component/conset/Const.dart';
import 'package:thi/profile/BookingandAppointment/cubit/booking_cubit.dart';
import 'package:thi/profile/BookingandAppointment/selectTepyBooking.dart';

class DatilsBooking extends StatelessWidget {
  const DatilsBooking({super.key, required this.idBooking});
  final int idBooking;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) =>
          BookingCubit()..getDataDatailsBooking(idBooking: idBooking),
      child: BlocConsumer<BookingCubit, BookingState>(
        listener: (context, state) {
          if (state is BookingDeleteOneTimePOP) {
            Navigator.pushReplacement<void, void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => SelectTypeBooking(),
              ),
            );
          }
          // if (state is BookingDeleteSueccfuly) {
          //   print(
          //       "IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII");
          //   Navigator.pushReplacement(
          //     context,
          //     MaterialPageRoute<void>(
          //       builder: (BuildContext context) => SelectTypeBooking(),
          //     ),
          //   );
          // }
        },
        builder: (context, state) {
          final cubit = BookingCubit.getObject(context);
          return Container(
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
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                iconTheme: IconThemeData(color: Color3),
                title: text(title: "Datils Booking", color: Color3),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: text(title: "Confirmation"),
                            content: text(
                                title:
                                    "Are you sure you want to cancel the booking?"),
                            actions: [
                              TextButton(
                                child: text(title: "Yes", color: Colors.brown),
                                onPressed: () {
                                  cubit.getDataDeleteBooking(
                                      idBooking: idBooking, context: context);
                                  // Perform the cancellation of booking here
                                  print(
                                      "OOOOOOOOOOOOfffffffffffffffffffffffffffffffffffffffffffffffffffOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO");
                                  // if (cubit.deleteBooking != null &&
                                  //     cubit.deleteBooking!.status == true) {
                                  //   print(
                                  //       "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO");
                                  //   Navigator.pushReplacement(
                                  //     context,
                                  //     MaterialPageRoute<void>(
                                  //       builder: (BuildContext context) =>
                                  //           BookingandApp(),
                                  //     ),
                                  //   );
                                  //   // Navigator.pushReplacement<void, void>(
                                  //   //   context,
                                  //   //   MaterialPageRoute<void>(
                                  //   //     builder: (BuildContext context) =>
                                  //   //         BookingandApp(),
                                  //   //   ),
                                  //   // );
                                  // }
                                  // Navigator.of(context)
                                  //     .pop(); // Close the dialog after pressing "Yes"
                                },
                              ),
                              TextButton(
                                child: text(title: "No", color: Colors.green),
                                onPressed: () {
                                  Navigator.of(context)
                                      .pop(); // Close the dialog after pressing "No"
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: text(title: "Cancellation of Booking"),
                  )
                ],
              ),
              body: cubit.datailsBooking == null
                  ? Center(child: SpinkitWave())
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(30)),
                                image: DecorationImage(
                                    image: NetworkImage(ImagesPath +
                                        cubit.datailsBooking!.bookings!
                                            .clubImage!
                                            .toString()),
                                    fit: BoxFit.cover)),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.40,
                                      child: text(
                                          title: cubit.datailsBooking!.bookings!
                                              .clubName!,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                    ),
                                    SizedBox(
                                      width: width * 0.02,
                                    ),

                                    ////////////////////////////////////////////////////////// edit Star
                                    // TextButton.icon(
                                    //   onPressed: () {},
                                    //   icon: Icon(
                                    //     Icons.star_rate,
                                    //     color: Colors.amber,
                                    //     size: 15,
                                    //   ),
                                    //   label: text(
                                    //       title: '4.0',
                                    //       fontSize: 15,
                                    //       color: Colors.black),
                                    // )
                                  ],
                                ),
                                Container(
                                  width: width * 0.50,
                                  // color: Colors.red,
                                  child: text(
                                      title: cubit.datailsBooking!.bookings!
                                          .clubDescription!,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey),
                                ),
                                // TextButton.icon(
                                //     onPressed: () {},
                                //     icon: Icon(
                                //       Icons.location_on,
                                //       color: Colors.black,
                                //       size: 15,
                                //     ),
                                //     label: text(
                                //         title: '1.2 Km',
                                //         fontSize: 15,
                                //         color: Colors.black)),
                                SizedBox(
                                  height: height * .01,
                                ),
                                // text(
                                //     title:
                                //         'Services: Water,juice and Break 10 munit',
                                //     overflow: TextOverflow.ellipsis,
                                //     maxLines: 1,
                                //     softWrap: true,
                                //     fontSize: 14,
                                //     fontWeight: FontWeight.w400,
                                //     color: Colors.grey),
                                SizedBox(
                                  height: height * 0.015,
                                ),
                                text(
                                    title:
                                        'Total Price: ${cubit.datailsBooking!.bookings!.amount}',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87),
                                SizedBox(
                                  height: height * 0.015,
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: Color4,
                          ),
                          Column(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              text(
                                  title: "Coach",
                                  color: Color0,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                              ListTile(
                                leading: Container(
                                  width: 70,
                                  // height: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color0.withOpacity(0.5),
                                        spreadRadius: 2.0,
                                        blurRadius: 10.0,
                                        offset: Offset(-1, 6),
                                      ),
                                    ],
                                    image: DecorationImage(
                                        // scale: 30,
                                        image: NetworkImage(
                                          ImagesPath +
                                              cubit.datailsBooking!.bookings!
                                                  .trainerImage!,
                                        ),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                title: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: text(
                                    title: cubit
                                        .datailsBooking!.bookings!.trainerFName
                                        .toString(),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(3, 2, 3, 1),
                                  ),
                                ),
                                onTap: () {
                                  // تنفيذ الإجراء عند النقر على السطر
                                  print('تم النقر على السطر');
                                },
                              ),
                            ],
                          ),
                          Divider(
                            color: Color4,
                          ),
                          Column(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              text(
                                  title: "Servic",
                                  color: Color0,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                              ListTile(
                                leading: Container(
                                  width: 70,
                                  // height: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color0.withOpacity(0.5),
                                        spreadRadius: 2.0,
                                        blurRadius: 10.0,
                                        offset: Offset(-1, 6),
                                      ),
                                    ],
                                    image: DecorationImage(
                                        // scale: 30,
                                        image: NetworkImage(
                                          ImagesPath +
                                              cubit.datailsBooking!.bookings!
                                                  .serviceImage!,
                                        ),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                title: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: text(
                                    title: cubit
                                        .datailsBooking!.bookings!.serviceName
                                        .toString(),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(3, 2, 3, 1),
                                  ),
                                ),
                                onTap: () {
                                  // تنفيذ الإجراء عند النقر على السطر
                                  print('تم النقر على السطر');
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height * 0.03,
                          ),
                          Divider(
                            color: Color4,
                          ),
                          SizedBox(
                            height: height * 0.03,
                          ),
                          text(
                              title: "Booking history",
                              color: Color0,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          Container(
                            width: width,
                            height: height * 0.6,
                            child: ListView.separated(
                                shrinkWrap: false,
                                // physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext, int) {
                                  ////////////////////edit
                                  // print(cubit.datailsBooking!.bookings!
                                  //         .trainerTimesInfo!.length
                                  //         .toString() +
                                  //     "oioioiioioiooooooooooooooooooooooooooooooooooooooooo");
                                  // cubit.isCachkLength(cubit.datailsBooking!
                                  //     .bookings!.trainerTimesInfo!.length);
                                  ///////////////////////////////////////edit
                                  // if (cubit.datailsBooking!.bookings!
                                  //         .trainerTimesInfo!.length <=
                                  //     0) {
                                  //   cubit.getDataDeleteBooking(
                                  //       idBooking: idBooking, context: context);
                                  //   Navigator.pop(context);
                                  //   // Navigator.pushReplacement<void, void>(
                                  //   //   context,
                                  //   //   MaterialPageRoute<void>(
                                  //   //     builder: (context) => BookingandApp(),
                                  //   //   ),
                                  //   // );
                                  // }

                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: width,
                                      height: height * 0.1239,
                                      child: Column(
                                        children: [
                                          Align(
                                            alignment: Alignment.center,
                                            child: Container(
                                              // onPressed: () {},
                                              height: height * 0.06,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  color: Color0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(Icons.date_range,
                                                      color: Colors.white),
                                                  SizedBox(
                                                    width: width * 0.01,
                                                  ),
                                                  text(
                                                      title: cubit
                                                          .datailsBooking!
                                                          .bookings!
                                                          .trainerTimesInfo![
                                                              int]
                                                          .bookingDate
                                                          .toString(),
                                                      fontSize: 18,
                                                      color: Colors.white),

                                                  Spacer(),
                                                  // SizedBox(
                                                  //   width: width * 0.02,
                                                  // ),
                                                  text(
                                                      title: cubit
                                                          .datailsBooking!
                                                          .bookings!
                                                          .trainerTimesInfo![
                                                              int]
                                                          .startTime
                                                          .toString(),
                                                      fontSize: 18,
                                                      color: Colors.white),
                                                  text(
                                                    title: '\u2192',
                                                    textAlign: TextAlign.center,
                                                    color: Colors.white,
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.w800,
                                                  ),
                                                  text(
                                                      title: cubit
                                                          .datailsBooking!
                                                          .bookings!
                                                          .trainerTimesInfo![
                                                              int]
                                                          .endTime
                                                          .toString(),
                                                      fontSize: 18,
                                                      color: Colors.white),
                                                ],
                                              ),
                                              // style: ElevatedButton.styleFrom(

                                              //     // backgroundColor: secondaryColor,
                                              //     shape: RoundedRectangleBorder(
                                              //         borderRadius: BorderRadius.circular(25)),
                                              //     padding:
                                              //         EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Spacer(),
                                              ElevatedButton(
                                                  onPressed: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return AlertDialog(
                                                          title: text(
                                                              title:
                                                                  "Confirmation"),
                                                          content: text(
                                                              title:
                                                                  "Are you sure you want to cancel the booking?"),
                                                          actions: [
                                                            TextButton(
                                                              child: text(
                                                                  title: "Yes",
                                                                  color: Colors
                                                                      .brown),
                                                              onPressed: () {
                                                                cubit.postDataDeleteOneTime(
                                                                    idBooking:
                                                                        idBooking,
                                                                    trainerTime_id: cubit
                                                                        .datailsBooking!
                                                                        .bookings!
                                                                        .trainerTimesInfo![
                                                                            int]
                                                                        .trainerTimeID!,
                                                                    context:
                                                                        context);
                                                                // Perform the cancellation of booking here
                                                                // Navigator.of(
                                                                //         context)
                                                                //     .pop(); // Close the dialog after pressing "Yes"
                                                              },
                                                            ),
                                                            TextButton(
                                                              child: text(
                                                                  title: "No",
                                                                  color: Colors
                                                                      .green),
                                                              onPressed: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop(); // Close the dialog after pressing "No"
                                                              },
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: text(title: "Cancel"))
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder: (BuildContext, int) {
                                  return Divider();
                                },
                                itemCount: cubit.datailsBooking!.bookings!
                                    .trainerTimesInfo!.length),
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
}
