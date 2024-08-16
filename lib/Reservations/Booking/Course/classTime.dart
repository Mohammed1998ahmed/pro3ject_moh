import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thi/Reservations/Booking/Course/CoureBookingDatails.dart';
import 'package:thi/Reservations/Booking/Course/cubit/cours_booking_cubit.dart';
import 'package:thi/component/Widght.dart';
import 'package:thi/component/conset/Const.dart';

class ClassTime extends StatefulWidget {
  const ClassTime({
    super.key,
    this.Cours_id,
  });
  final Cours_id;

  @override
  State<ClassTime> createState() => _ClassTimeState();
}

class _ClassTimeState extends State<ClassTime> {
  TextEditingController _textEditingController = TextEditingController();
  String _errorMessage = '';

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CoursBookingCubit()
        ..getDatailsClassTime(cours_Id: widget.Cours_id)
        ..configurePusher(cours_Id: widget.Cours_id)
        ..configurePusher1(cours_Id: widget.Cours_id),
      child: BlocConsumer<CoursBookingCubit, CoursBookingState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = CoursBookingCubit.getObject(context);
          return Scaffold(
            body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        imageBackground,
                      ),
                      fit: BoxFit.fill)),
              child: cubit.detailsClassModel == null
                  ? Center(child: SpinkitWave())
                  : Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: ListView.separated(
                        itemCount: cubit.detailsClassModel!.classes!.length,
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(),
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        child: text(
                                          title: " Meetings :  ",
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Container(
                                        child: text(
                                          title: cubit.detailsClassModel!
                                              .classes![index].class1
                                              .toString(),
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Spacer(),
                                      Row(
                                        children: [
                                          text(
                                              title: "Price  :  ",
                                              color: Color4),
                                          text(
                                              title: cubit.detailsClassModel!
                                                  .classes![index].price
                                                  .toString(),
                                              color: Color4),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  decoration: BoxDecoration(
                                      color: Color0,
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            child: text(
                                              title: cubit.detailsClassModel!
                                                  .classes![index].start
                                                  .toString(),
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                          Container(
                                            child: text(
                                              title: '\u2192',
                                              textAlign: TextAlign.center,
                                              color: Colors.red,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                          Container(
                                            child: text(
                                              title: cubit.detailsClassModel!
                                                  .classes![index].end
                                                  .toString(),
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.0),
                                      color: Color0,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          child: text(
                                            title: "Current Issue",
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                        Container(
                                          child: text(
                                            title: '\u2192',
                                            textAlign: TextAlign.center,
                                            color: Colors.red,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                        Container(
                                          child: text(
                                            title: "Available number",
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  decoration: BoxDecoration(
                                      color: Color0,
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            child: text(
                                              title: cubit.detailsClassModel!
                                                  .classes![index].counter
                                                  .toString(),
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                          Container(
                                            child: text(
                                              title: '\u2192',
                                              textAlign: TextAlign.center,
                                              color: Colors.red,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                          Container(
                                            child: text(
                                              title: cubit.detailsClassModel!
                                                  .classes![index].capacity
                                                  .toString(),
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Spacer(),
                                      ElevatedButton(
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text("Reservation"),
                                                content: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    TextField(
                                                      controller:
                                                          _textEditingController,
                                                      keyboardType:
                                                          TextInputType.number,
                                                      decoration:
                                                          InputDecoration(
                                                        labelText:
                                                            "Enter a number",
                                                        errorText:
                                                            _errorMessage,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      if (_textEditingController
                                                          .text.isNotEmpty) {
                                                        String input =
                                                            _textEditingController
                                                                .text
                                                                .trim();

                                                        int countpoeple = int.parse(
                                                            _textEditingController
                                                                .text
                                                                .toString());
                                                        int capacity = cubit
                                                                .detailsClassModel!
                                                                .classes![index]
                                                                .capacity! -
                                                            cubit
                                                                .detailsClassModel!
                                                                .classes![index]
                                                                .counter!;
                                                        print(countpoeple
                                                                .toString() +
                                                            "PPPPPPPPPPPPPPPPPPPPPPPP");

                                                        print(capacity
                                                                .toString() +
                                                            "PPPPPPPPPPPPPPPPPPPPPPPP");
                                                        if (input.isNotEmpty &&
                                                            isNumeric(input) &&
                                                            countpoeple <=
                                                                capacity) {
                                                          // Valid input, perform the confirm action
                                                          _errorMessage = '';
                                                          setState(() {});

                                                          Navigator
                                                              .pushReplacement(
                                                            context,
                                                            MaterialPageRoute<
                                                                void>(
                                                              builder: (BuildContext
                                                                      context) =>
                                                                  CoursBookingDetials(
                                                                amount: cubit
                                                                    .detailsClassModel!
                                                                    .classes![
                                                                        index]
                                                                    .price!,
                                                                course_id: cubit
                                                                    .detailsClassModel!
                                                                    .classes![
                                                                        index]
                                                                    .courseId!,
                                                                Session_Name: cubit
                                                                    .detailsClassModel!
                                                                    .classes![
                                                                        index]
                                                                    .class1
                                                                    .toString(),
                                                                number_People:
                                                                    int.parse(
                                                                        _textEditingController
                                                                            .text),
                                                              ),
                                                            ),
                                                          ); // Navigator.of(context)
                                                          //     .pop();
                                                          // Add your code here for the confirm action
                                                        } else {
                                                          // Invalid input, show error message

                                                          setState(() {
                                                            _errorMessage =
                                                                "Please enter a valid number";
                                                            print("object");
                                                          });
                                                        }
                                                      }
                                                    },
                                                    child: Text("Confirm"),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      // Perform the cancel action
                                                      Navigator.of(context)
                                                          .pop();
                                                      // Add your code here for the cancel action
                                                    },
                                                    child: Text("Cancel"),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        child: Text(
                                          "Reservation",
                                          style: TextStyle(color: Color4),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
            ),
          );
        },
      ),
    );
  }

  bool isNumeric(String s) {
    // ignore: unnecessary_null_comparison
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }
}
