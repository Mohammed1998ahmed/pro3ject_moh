import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thi/Reservations/Booking/cubit/booking_cubit.dart';
import 'package:thi/component/Widght.dart';
import 'package:thi/component/conset/Const.dart';
import 'package:thi/sharePreferinces/shardprefericences.dart';

class BookingDetials extends StatefulWidget {
  const BookingDetials({
    Key? key,
    required this.Idclub,
    required this.IdServic,
    required this.Idtrinner,
    required this.selectedChipIndices,
    required this.amount,
    required this.data,
    required this.bookingCubit,
  }) : super(key: key);
  final int Idclub;
  final int IdServic;
  final int Idtrinner;
  final List<int> amount;
  final String data;
  final List<int> selectedChipIndices;
  final BookingCubit bookingCubit;
  @override
  State<BookingDetials> createState() => _BookingDetialsState();
}

class _BookingDetialsState extends State<BookingDetials> {
  List payment = ["credit", "Bank"];
  // widget.bookingCubit.addListInt(widget.amount);

  @override
  Widget build(BuildContext context) {
    print("mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm" +
        widget.Idtrinner.toString() +
        widget.IdServic.toString() +
        widget.Idclub.toString() +
        widget.selectedChipIndices.toString() +
        CachShpreafapp.getdata(key: "UserID").toString());
    print(widget.Idtrinner + widget.IdServic + widget.Idclub);
    double Heith = MediaQuery.of(context).size.height;
    double Width = MediaQuery.of(context).size.width;
    int pricePayment = 0;
    for (var i = 0; i < widget.amount.length; i++) {
      pricePayment += widget.amount[i];
    }
    print(pricePayment.toString() +
        "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO");
    // widget.bookingCubit.addListInt(widget.amount);
    return BlocProvider(
      create: (context) => BookingCubit(),
      child: BlocConsumer<BookingCubit, BookingState>(
        listener: (context, state) {
          // if (state is BookingBookingPaymentOk) {
          //   BookingCubit.getObject(context).postDataAddBookingModel(
          //       CachShpreafapp.getdata(key: "UserID"),
          //       widget.IdServic,
          //       widget.Idtrinner,
          //       widget.selectedChipIndices);
          //   reviewRaiting[widget.Idclub] = true;
          // }
        },
        builder: (context, state) {
          // ignore: unused_local_variable
          final cubit = BookingCubit.getObject(context);
          // cubit.addListInt(widget.amount);
          return SafeArea(
            child: Scaffold(
              body: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(imageBackground), fit: BoxFit.fill)),
                padding: EdgeInsets.all(10),
                width: Width,
                height: Heith,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: Color0,
                                )),
                          ),
                          Center(
                            child: text(
                                title: 'Booking Details',
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Color0),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: Heith * 0.015,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          // onPressed: () {},
                          height: 44,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.date_range, color: Colors.white),
                              SizedBox(
                                width: Width * 0.01,
                              ),
                              text(
                                  title: '2024-10-10',
                                  fontSize: 18,
                                  color: Colors.white),
                              SizedBox(
                                width: Width * 0.04,
                              ),
                              text(
                                  title: 'Total : 450 AED',
                                  fontSize: 18,
                                  color: Colors.red),
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
                      SizedBox(
                        height: Heith * 0.02,
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            text(
                              title: 'Payment Method',
                              fontSize: 19,
                              color: Color0,
                            ),
                            text(
                                title: '+ Add a new card', color: Colors.black),
                          ]),

                      ///////////////////////////////////////////////////////////
                      Container(
                        height: Heith * 0.3,
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  print(pricePayment.toString() +
                                      "PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP");
                                  cubit.makePayment(
                                    pricePayment,
                                    IdServic: widget.IdServic,
                                    Idclub: widget.Idclub,
                                    Idtrinner: widget.Idtrinner,
                                    context: context,
                                    selectedChipIndices:
                                        widget.selectedChipIndices,
                                  );
                                  print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
                                  // countinueApp();

                                  // Navigator.push<void>(
                                  //   context,
                                  //   MaterialPageRoute<void>(
                                  //     builder: (BuildContext context) => OkBooking(),
                                  //   ),
                                  // );
                                },
                                child: Container(
                                  width: Width * 0.5,
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color:
                                            cubit.currentPayment == payment[0]
                                                ? Color0.withOpacity(0.5)
                                                : Colors.black,
                                        width: 1),
                                  ),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        'assets/images/Plain credit card-amico.png',
                                        height: Heith * 0.1,
                                        width: Width * 0.3,
                                        fit: BoxFit.cover,
                                      ),
                                      SizedBox(
                                        height: Heith * 0.02,
                                      ),
                                      Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            text(
                                              title: 'Credit/Debit Card',
                                              color: Colors.black,
                                              fontSize: 18,
                                            ),
                                            text(
                                              title: 'Ending in 1560',
                                              color: Colors.grey,
                                              fontSize: 15,
                                            )
                                          ],
                                        ),
                                      ),

                                      // Radio(
                                      //     value: payment[0],
                                      //     activeColor: secondaryColor,
                                      //     groupValue: currentPayment,
                                      //     onChanged: (value) {
                                      //       setState(() {
                                      //         currentPayment = value;
                                      //       });
                                      //     })
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: Width * 0.03,
                              ),
                              // Container(
                              //   padding: EdgeInsets.all(15),
                              //   // margin: EdgeInsets.symmetric(vertical: 10),
                              //   decoration: BoxDecoration(
                              //     borderRadius: BorderRadius.circular(8),
                              //     border: Border.all(
                              //         color: currentPayment == payment[1]
                              //             ? Color0
                              //             : Colors.black,
                              //         width: 1),
                              //   ),
                              //   child: Column(
                              //     children: [
                              //       Image.asset(
                              //         'assets/images/Coins-amico.png',
                              //         width: Width * 0.3,
                              //         height: Heith * 0.13,
                              //         fit: BoxFit.cover,
                              //       ),
                              //       SizedBox(
                              //         width: 20,
                              //       ),
                              //       Container(
                              //         child: Column(
                              //           crossAxisAlignment: CrossAxisAlignment.start,
                              //           children: [
                              //             Text(
                              //               'Cash in stable',
                              //               style: TextStyle(
                              //                 color: Colors.black,
                              //                 fontSize: 20,
                              //               ),
                              //             ),
                              //             Text(
                              //               'Ending in 9473',
                              //               style: TextStyle(
                              //                 color: Colors.grey,
                              //                 fontSize: 15,
                              //               ),
                              //             )
                              //           ],
                              //         ),
                              //       ),
                              //       SizedBox(
                              //         width: 100,
                              //       ),
                              //       // Radio(
                              //       //     value: payment[1],
                              //       //     groupValue: currentPayment,
                              //       //     activeColor: secondaryColor,
                              //       //     onChanged: (value) {
                              //       //       setState(() {
                              //       //         currentPayment = value;
                              //       //       });
                              //       //     })
                              //     ],
                              //   ),
                              // )
                            ]),
                      ),
                      SizedBox(
                        height: Heith * 0.03,
                      ),
                      // Align(
                      //   alignment: Alignment.center,
                      //   child: GestureDetector(
                      //     onTap: () {
                      //       countinueApp();
                      //     },
                      //     child: Container(
                      //       height: Heith * 0.06,
                      //       width: 311,
                      //       // onPressed: () {
                      //       //   countinueApp();
                      //       // },
                      //       decoration: BoxDecoration(
                      //           color: Color0,
                      //           borderRadius: BorderRadius.circular(15)),
                      //       child: Padding(
                      //         padding: const EdgeInsets.only(top: 10),
                      //         child: Text('Continue with Credit Card',
                      //             textAlign: TextAlign.center,
                      //             style: TextStyle(
                      //                 color: Colors.white,
                      //                 fontSize: 16,
                      //                 fontWeight: FontWeight.w400)),
                      //       ),
                      //       // style: ElevatedButton.styleFrom(
                      //       //     // backgroundColor: secondaryColor,
                      //       //     shape: RoundedRectangleBorder(
                      //       //         borderRadius: BorderRadius.circular(25)),
                      //       //     padding:
                      //       //         EdgeInsets.symmetric(horizontal: 40, vertical: 10)),
                      //     ),
                      //   ),
                      // )
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

  countinueApp() {
    var d = AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      contentPadding: EdgeInsets.all(20),
      content: Container(
        height: MediaQuery.of(context).size.height * 0.60,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: Color0.withOpacity(0.5),
              child: Icon(
                Icons.done_rounded,
                size: 50,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            text(
              title: "Your appointment booking \n is successfully",
              fontSize: 20,
              color: Color0,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            text(
              title:
                  "You can view the appointment booking info \n in the \"Appointment\" Section",
              fontSize: 15,
              color: Colors.grey,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                //////////////////////////////
                // makePayment();
              },
              child: Container(
                width: 280,
                height: 44,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0), color: Color0),
                // onPressed: () {},
                child: text(
                    title: 'Countinue Booking',
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
                // style: ElevatedButton.styleFrom(
                //     backgroundColor: secondaryColor,
                //     shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(25)),
                //     padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            text(
              title: "Go to appointment",
              fontSize: 15,
              color: Colors.black54,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );

    showDialog(context: context, builder: (_) => d);
  }
}
