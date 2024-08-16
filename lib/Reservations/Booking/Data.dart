import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:thi/Reservations/Booking/cubit/booking_cubit.dart';
import 'package:thi/Reservations/DeteilsBooking/booking_details.dart';
import 'package:thi/component/Widght.dart';
import 'package:thi/component/conset/Const.dart';

class DataBooking extends StatefulWidget {
  const DataBooking({
    super.key,
    required this.Idclub,
    required this.IdServic,
    required this.Idtrinner,
  });
  final int Idclub;
  final int IdServic;
  final int Idtrinner;

  @override
  State<DataBooking> createState() => _DataBookingState();
}

class _DataBookingState extends State<DataBooking> {
  // bool p1 = true;
  // bool p2 = false;
  // bool p3 = false;
  // bool p4 = false;
  // bool p5 = false;
  // bool p6 = false;
  // bool p7 = false;
  // bool p8 = false;
  // bool p9 = false;
  // bool p10 = false;
  // bool p11 = false;

  // bool p12 = false;
  // bool p13 = false;
  // bool p14 = false;
  // bool p15 = false;
  // bool p16 = false;
  DateTime? _selectedDay;
  String? Data;

  List<int> amount = []; // قائمة تحتوي على مؤشرات العناصر المحددة

  List<int> selectedChipIndices = []; // قائمة تحتوي على مؤشرات العناصر المحددة
// مؤشر العنصر المحدد، -1 يعني أنه لا يوجد عنصر محدد
  void generateTimes() {
    DateTime initialTime = DateTime.now(); // الوقت الحالي كنقطة انطلاق
    for (int i = 0; i < 16; i++) {
      DateTime time =
          initialTime.add(Duration(minutes: 30 * i)); // إضافة نصف ساعة لكل فهرس
      times.add(time);
    }
  }

  List<DateTime> times = []; // قائمة تحتوي على الأوقات
  @override
  void initState() {
    super.initState();
    generateTimes();
  }

  @override
  Widget build(BuildContext context) {
    double Height = MediaQuery.of(context).size.height;
    double Width = MediaQuery.of(context).size.width;
    // ignore: unused_element
    String getTime(int index) {
      DateTime time = times[index];
      String formattedTime = DateFormat('hh:mm a')
          .format(time); // تنسيق الوقت بصيغة ساعة ودقيقة وAM/PM
      return formattedTime;
    }

    return BlocProvider(
      create: (context) => BookingCubit()
        ..configurePusher(
            trainer_id: widget.Idtrinner,
            date: Data == null ? "2024-12-12" : Data!)
        ..configurePusher1(
            trainer_id: widget.Idtrinner,
            date: Data == null ? "2024-12-12" : Data!),
      child: BlocConsumer<BookingCubit, BookingState>(
        listener: (context, state) {
          // if (state is BookingBookingSuccsfuly) {
          //   BookingCubit.getObject(context)
          //       .getDataListTime(widget.Idtrinner, "2024-5-5");
          // }
        },
        builder: (context, state) {
          final cubit = BookingCubit.getObject(context);
          return Scaffold(
            body: Container(
              height: Height,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(imageBackground), fit: BoxFit.fill),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AppBar(
                      leading: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_back,
                          color: Color0,
                        ),
                      ),
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      title: text(
                        title: 'Book Appointment',
                        color: Color0,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                      toolbarHeight: 30,
                    ),
                    SizedBox(
                      height: Height * 0.02,
                    ),
                    Center(
                      child: Container(
                        width: Width * 0.7,
                        height: Height * 0.3,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/images/Service 24_7-amico.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text(
                        'Select your date',
                        style: TextStyle(
                          color: Color0,
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(15),
                      height: MediaQuery.of(context).size.height * 0.066,
                      // decoration: BoxDecoration(
                      //   gradient: LinearGradient(
                      //     colors: [
                      //       Color.fromRGBO(71, 181, 255, 1), // اللون الأصلي
                      //       Color.fromRGBO(199, 255, 255, 1), // اللون المتناسق
                      //     ],
                      //     begin: Alignment.topLeft,
                      //     end: Alignment.bottomRight,
                      //   ),
                      // ),
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
                                      onDaySelected: (selectedDay, focusedDay) {
                                        setState(() {
                                          _selectedDay = selectedDay;
                                          String formattedDate =
                                              DateFormat('yyyy-MM-dd')
                                                  .format(_selectedDay!);
                                          print('$formattedDate');
                                          Data = formattedDate;
                                          Navigator.pop(context);
                                          if (Data != null) {
                                            cubit.getDataListTime(
                                                widget.Idtrinner, Data!);
                                            cubit.configurePusher(
                                                trainer_id: widget.Idtrinner,
                                                date: Data!);
                                            cubit.configurePusher1(
                                                trainer_id: widget.Idtrinner,
                                                date: Data!);
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
                    SizedBox(
                      height: Height * 0.03,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: text(
                        title: 'Available slot',
                        color: Color0,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: Height * 0.01,
                    ),
                    cubit.getTimeClubModel == null ||
                            cubit.getTimeClubModel!.availableTimes == null
                        ? Center(child: SpinkitWave())
                        : Container(
                            height: Height * 0.3,
                            child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 5,
                                crossAxisSpacing: 1,
                                childAspectRatio: 3,
                              ),
                              itemCount: cubit
                                  .getTimeClubModel!.availableTimes!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return ChoiceChip(
                                  labelStyle: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        20), // تعيين شكل الزاوية لقوس دائري
                                  ),
                                  label: Column(
                                    children: [
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: [
                                            Container(
                                              child: text(
                                                title: cubit
                                                    .getTimeClubModel!
                                                    .availableTimes![index]
                                                    .startTime
                                                    .toString(),
                                                color: Colors.black,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            Container(
                                              child: text(
                                                title: '\u2192',
                                                textAlign: TextAlign.center,
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Container(
                                              child: text(
                                                title: cubit
                                                    .getTimeClubModel!
                                                    .availableTimes![index]
                                                    .endTime
                                                    .toString(),
                                                color: Colors.black,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: [
                                            Container(
                                              child: text(
                                                title: "Price : ",
                                                color: Colors.black,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            Container(
                                              child: text(
                                                title: cubit
                                                    .getTimeClubModel!
                                                    .availableTimes![index]
                                                    .price
                                                    .toString(),
                                                color: Colors.black,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  selected: selectedChipIndices.contains(cubit
                                      .getTimeClubModel!
                                      .availableTimes![index]
                                      .id),
                                  onSelected: (v) {
                                    setState(() {
                                      if (selectedChipIndices.contains(cubit
                                          .getTimeClubModel!
                                          .availableTimes![index]
                                          .id)) {
                                        amount.remove(cubit.getTimeClubModel!
                                            .availableTimes![index].price);
                                        selectedChipIndices.remove(cubit
                                            .getTimeClubModel!
                                            .availableTimes![index]
                                            .id); // إزالة العنصر من القائمة إذا تم النقر عليه مرة أخرى
                                      } else {
                                        selectedChipIndices.add(cubit
                                            .getTimeClubModel!
                                            .availableTimes![index]
                                            .id!);
                                        amount.add(cubit
                                            .getTimeClubModel!
                                            .availableTimes![index]
                                            .price!); // إضافة العنصر إلى القائمة إذا تم النقر عليه لأول مرة
                                      }
                                      print(selectedChipIndices.toString());
                                      print(amount.toString());
                                    });
                                  },
                                  selectedColor: Color0,
                                );
                              },
                            ),
                          ),
                    Center(
                      child: Container(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(311, 44),
                                backgroundColor: Color0,
                                elevation: 1,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ))),
                            onPressed: () {
                              print(amount.toString());

                              print(selectedChipIndices.toString());
                              if (selectedChipIndices.length > 0) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        BookingDetials(
                                      amount: amount,
                                      data: Data.toString(),
                                      IdServic: widget.IdServic,
                                      Idtrinner: widget.Idtrinner,
                                      selectedChipIndices: selectedChipIndices,
                                      Idclub: widget.Idclub,
                                      bookingCubit: cubit,
                                    ),
                                  ),
                                );
                              }

                              print(selectedChipIndices.toString());
                            },
                            child: text(
                              title: 'Continue',
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            )),
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
