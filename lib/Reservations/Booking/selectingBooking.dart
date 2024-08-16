// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:table_calendar/table_calendar.dart';
// import 'package:thi/Reservations/DeteilsBooking/booking_details.dart';
// import 'package:thi/component/Widght.dart';
// import 'package:thi/component/conset/Const.dart';

// class BookingScreen extends StatefulWidget {
//   const BookingScreen({Key? key}) : super(key: key);

//   @override
//   State<BookingScreen> createState() => _BookingScreenState();
// }

// class _BookingScreenState extends State<BookingScreen> {
//   int selectedItemId = -1; // معرف العنصر المحدد بالقيمة الافتراضية -1

//   List category = [
//     {
//       "image": "assets/images/img_10.png",
//       "text": "Ability &",
//     },
//     {"image": "assets/images/img_11.png", "text": "Flat race"},
//     {"image": "assets/images/img_12.png", "text": "Show horse"},
//     {"image": "assets/images/img_13.png", "text": "Pony"},
//     {
//       "image": "assets/images/img_14.png",
//       "text": "Race",
//     },
//   ];
//   bool p1 = true;
//   bool p2 = false;
//   bool p3 = false;
//   bool p4 = false;
//   bool p5 = false;
//   bool p6 = false;
//   bool p7 = false;
//   bool p8 = false;
//   bool p9 = false;
//   bool p10 = false;
//   bool p11 = false;

//   bool p12 = false;
//   bool p13 = false;
//   bool p14 = false;
//   bool p15 = false;
//   bool p16 = false;
//   DateTime? _selectedDay;
//   String? Data;
//   // CalendarController _calendarController = CalendarController();
//   @override
//   Widget build(BuildContext context) {
//     double Height = MediaQuery.of(context).size.height;
//     double Width = MediaQuery.of(context).size.width;
//     return SafeArea(
//       child: Scaffold(
//         body: Container(
//           decoration: BoxDecoration(
//             image: DecorationImage(
//                 image: AssetImage(imageBackground), fit: BoxFit.fill),
//             // borderRadius: BorderRadius.circular(10),
//           ),
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 AppBar(
//                   leading: IconButton(
//                     onPressed: () {},
//                     icon: Icon(
//                       Icons.arrow_back,
//                       color: Color0,
//                     ),
//                   ),
//                   backgroundColor: Colors.transparent,
//                   elevation: 0,
//                   title: text(
//                     title: 'Book Appointment',
//                     color: Color0,
//                     fontSize: 20,
//                     fontWeight: FontWeight.w700,
//                   ),
//                   toolbarHeight: 30,
//                 ),
//                 SizedBox(
//                   height: Height * 0.02,
//                 ),
//                 Center(
//                   child: Container(
//                     width: Width * 0.7,
//                     height: Height * 0.3,
//                     decoration: BoxDecoration(
//                       image: DecorationImage(
//                         image:
//                             AssetImage('assets/images/Service 24_7-amico.png'),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: Height * 0.02,
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(left: 10),
//                   child: text(
//                     title: 'Select your date',
//                     color: Color0,
//                     fontSize: 16,
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//                 Container(
//                   decoration: BoxDecoration(boxShadow: <BoxShadow>[]),
//                   margin: EdgeInsets.all(15),
//                   height: 50,
//                   child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                           shadowColor: Color0,
//                           backgroundColor: LinearGradientColor01,
//                           minimumSize: const Size(311, 44),
//                           elevation: 1,
//                           shape: const RoundedRectangleBorder(
//                               borderRadius: BorderRadius.all(
//                             Radius.circular(10),
//                           ))),
//                       onPressed: () {
//                         showDialog(
//                           context: context,
//                           builder: (context) {
//                             return Container(
//                               padding: EdgeInsets.symmetric(vertical: 30),
//                               child: AlertDialog(
//                                 title: text(title: 'Select a Date'),
//                                 content: TableCalendar(
//                                   firstDay: DateTime.utc(2010, 10, 16),
//                                   lastDay: DateTime.utc(2030, 3, 14),
//                                   focusedDay: DateTime.now(),
//                                   calendarFormat: CalendarFormat.month,
//                                   selectedDayPredicate: (day) {
//                                     return isSameDay(_selectedDay, day);
//                                   },
//                                   headerStyle: HeaderStyle(
//                                     titleCentered: true,
//                                     formatButtonVisible: false,
//                                   ),
//                                   headerVisible: true,
//                                   // headerTitleBuilder: (context, focusedDay) {
//                                   //   final monthName =
//                                   //       DateFormat.MMMM().format(focusedDay);
//                                   //   final year =
//                                   //       DateFormat.y().format(focusedDay);
//                                   //   return Text(
//                                   //     '$monthName $year',
//                                   //     style: TextStyle(
//                                   //       fontSize: 20,
//                                   //       fontWeight: FontWeight.bold,
//                                   //     ),
//                                   //   );
//                                   // },
//                                   availableCalendarFormats: const {
//                                     CalendarFormat.month: '',
//                                   },
//                                   onDaySelected: (selectedDay, focusedDay) {
//                                     setState(() {
//                                       _selectedDay = selectedDay;
//                                       String formattedDate =
//                                           DateFormat('dd MMMM yyyy')
//                                               .format(_selectedDay!);
//                                       print(
//                                           'تم الضغط على اليوم: $formattedDate');
//                                       Data = formattedDate;
//                                       Navigator.pop(context);
//                                     });
//                                   },
//                                   onHeaderTapped: (focusedDay) {
//                                     print('رفع التقويم للأعلى');
//                                   },
//                                 ),
//                               ),
//                             );
//                           },
//                         );
//                         print("Deta 1010010101010010100101010");
//                       },
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           text(
//                             title: Data == null
//                                 ? "12 March 2024"
//                                 : Data.toString(),
//                             textAlign: TextAlign.center,
//                             color: Colors.white,
//                             fontSize: 15,
//                             fontWeight: FontWeight.w400,
//                           ),
//                           Spacer(),
//                           IconButton(
//                             icon: Icon(
//                               Icons.date_range,
//                               color: Colors.white,
//                               size: 35,
//                             ),
//                             onPressed: () {},
//                           ),
//                         ],
//                       )),
//                 ),
//                 SizedBox(
//                   height: Height * 0.03,
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(left: 10),
//                   child: text(
//                     title: 'Available slot',
//                     color: Color0,
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(
//                   height: Height * 0.01,
//                 ),
//                 Container(
//                   height: Height * 0.3,
//                   child: GridView.count(
//                     primary: false,
//                     shrinkWrap: false,
//                     crossAxisCount: 3,
//                     mainAxisSpacing: 5,
//                     crossAxisSpacing: 5,
//                     childAspectRatio: 3,
//                     children: [
//                       ChoiceChip(
//                         shape: RoundedRectangleBorder(
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(10))),
//                         label: text(
//                           title: '9:30 AM',
//                           color: Colors.black,
//                           fontSize: 13,
//                           fontWeight: FontWeight.w400,
//                         ),
//                         selected: p1,
//                         onSelected: (v) {
//                           setState(() {
//                             p1 = v;
//                           });
//                         },
//                         selectedColor: Color0,
//                       ),
//                       ChoiceChip(
//                         shape: RoundedRectangleBorder(
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(10))),
//                         label: text(
//                           title: '10:00AM',
//                           color: Colors.black,
//                           fontSize: 13,
//                           fontWeight: FontWeight.w400,
//                         ),
//                         selected: p2,
//                         onSelected: (v) {
//                           setState(() {
//                             p2 = v;
//                             // p1 = false;
//                           });
//                         },
//                         selectedColor: Color0,
//                       ),
//                       ChoiceChip(
//                         shape: RoundedRectangleBorder(
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(10))),
//                         label: text(
//                           title: '10:30 AM',
//                           color: Colors.black,
//                           fontSize: 13,
//                           fontWeight: FontWeight.w400,
//                         ),
//                         selected: p3,
//                         onSelected: (v) {
//                           setState(() {
//                             p3 = v;
//                           });
//                         },
//                         selectedColor: Color0,
//                       ),
//                       ChoiceChip(
//                         shape: const RoundedRectangleBorder(
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(10))),
//                         label: text(
//                           title: '11:00 AM',
//                           color: Colors.black,
//                           fontSize: 13,
//                           fontWeight: FontWeight.w400,
//                         ),
//                         selected: p4,
//                         onSelected: (v) {
//                           setState(() {
//                             p4 = v;
//                           });
//                         },
//                         selectedColor: Color0,
//                       ),
//                       ChoiceChip(
//                         shape: const RoundedRectangleBorder(
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(10))),
//                         label: text(
//                           title: '11:30 AM',
//                           color: Colors.black,
//                           fontSize: 13,
//                           fontWeight: FontWeight.w400,
//                         ),
//                         selected: p5,
//                         onSelected: (v) {
//                           setState(() {
//                             p5 = v;
//                           });
//                         },
//                         selectedColor: Color0,
//                       ),
//                       ChoiceChip(
//                         shape: const RoundedRectangleBorder(
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(10))),
//                         label: text(
//                           title: '12:00 AM',
//                           color: Colors.black,
//                           fontSize: 13,
//                           fontWeight: FontWeight.w400,
//                         ),
//                         selected: p6,
//                         onSelected: (v) {
//                           setState(() {
//                             p6 = v;
//                           });
//                         },
//                         selectedColor: Color0,
//                       ),
//                       ChoiceChip(
//                         shape: const RoundedRectangleBorder(
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(10))),
//                         label: text(
//                           title: '12:30 AM',
//                           color: Colors.black,
//                           fontSize: 13,
//                           fontWeight: FontWeight.w400,
//                         ),
//                         selected: p7,
//                         onSelected: (v) {
//                           setState(() {
//                             p7 = v;
//                           });
//                         },
//                         selectedColor: Color0,
//                       ),
//                       ChoiceChip(
//                         shape: const RoundedRectangleBorder(
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(10))),
//                         label: text(
//                           title: '12:30 AM',
//                           color: Colors.black,
//                           fontSize: 13,
//                           fontWeight: FontWeight.w400,
//                         ),
//                         selected: p8,
//                         onSelected: (v) {
//                           setState(() {
//                             p8 = v;
//                           });
//                         },
//                         selectedColor: Color0,
//                       ),
//                       ChoiceChip(
//                         shape: const RoundedRectangleBorder(
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(10))),
//                         label: text(
//                           title: '1:00 AM',
//                           color: Colors.black,
//                           fontSize: 13,
//                           fontWeight: FontWeight.w400,
//                         ),
//                         selected: p9,
//                         onSelected: (v) {
//                           setState(() {
//                             p9 = v;
//                           });
//                         },
//                         selectedColor: Color0,
//                       ),
//                       ChoiceChip(
//                         shape: const RoundedRectangleBorder(
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(10))),
//                         label: text(
//                           title: '2:00 AM',
//                           color: Colors.black,
//                           fontSize: 13,
//                           fontWeight: FontWeight.w400,
//                         ),
//                         selected: p10,
//                         onSelected: (v) {
//                           setState(() {
//                             p10 = v;
//                           });
//                         },
//                         selectedColor: Color0,
//                       ),
//                       ChoiceChip(
//                         shape: const RoundedRectangleBorder(
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(10))),
//                         label: text(
//                           title: '2:30 AM',
//                           color: Colors.black,
//                           fontSize: 13,
//                           fontWeight: FontWeight.w400,
//                         ),
//                         selected: p11,
//                         onSelected: (v) {
//                           setState(() {
//                             p11 = v;
//                           });
//                         },
//                         selectedColor: Color0,
//                       ),
//                       ChoiceChip(
//                         shape: const RoundedRectangleBorder(
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(10))),
//                         label: text(
//                           title: '3:00 AM',
//                           color: Colors.black,
//                           fontSize: 13,
//                           fontWeight: FontWeight.w400,
//                         ),
//                         selected: p12,
//                         onSelected: (v) {
//                           setState(() {
//                             p12 = v;
//                           });
//                         },
//                         selectedColor: Color0,
//                       ),
//                       ChoiceChip(
//                         shape: const RoundedRectangleBorder(
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(10))),
//                         label: text(
//                           title: '3:30 AM',
//                           color: Colors.black,
//                           fontSize: 13,
//                           fontWeight: FontWeight.w400,
//                         ),
//                         selected: p13,
//                         onSelected: (v) {
//                           setState(() {
//                             p13 = v;
//                           });
//                         },
//                         selectedColor: Color0,
//                       ),
//                       ChoiceChip(
//                         shape: const RoundedRectangleBorder(
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(10))),
//                         label: text(
//                           title: '4:00 AM',
//                           color: Colors.black,
//                           fontSize: 13,
//                           fontWeight: FontWeight.w400,
//                         ),
//                         selected: p14,
//                         onSelected: (v) {
//                           setState(() {
//                             p14 = v;
//                           });
//                         },
//                         selectedColor: Color0,
//                       ),
//                       ChoiceChip(
//                         shape: const RoundedRectangleBorder(
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(10))),
//                         label: text(
//                           title: '9:30 AM',
//                           color: Colors.black,
//                           fontSize: 13,
//                           fontWeight: FontWeight.w400,
//                         ),
//                         selected: p15,
//                         onSelected: (v) {
//                           setState(() {
//                             p15 = v;
//                           });
//                         },
//                         selectedColor: Color0,
//                       ),
//                       ChoiceChip(
//                         shape: RoundedRectangleBorder(
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(10))),
//                         label: text(
//                           title: '4:30 AM',
//                           color: Colors.black,
//                           fontSize: 13,
//                           fontWeight: FontWeight.w400,
//                         ),
//                         selected: p16,
//                         onSelected: (v) {
//                           setState(() {
//                             p16 = v;
//                           });
//                         },
//                         selectedColor: Color0,
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: Height * 0.02,
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(left: 10, top: 10),
//                   child: text(
//                     title: 'Select specialist',
//                     color: Color0,
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Container(
//                   height: Height * 0.280,
//                   child: ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     itemBuilder: (_, i) {
//                       bool isChecked = (selectedItemId ==
//                           i); // تحديد حالة التحديد بناءً على العنصر المحدد

//                       return Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             border: Border.all(color: Color0, width: 3),
//                           ),
//                           child: Column(
//                             children: [
//                               Container(
//                                 height: Height * 0.093,
//                                 width: Width * 0.193,
//                                 padding: const EdgeInsets.all(3),
//                                 margin: const EdgeInsets.symmetric(
//                                     horizontal: 6, vertical: 15),
//                                 decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   shape: BoxShape.circle,
//                                   border: Border.all(color: Color0),
//                                 ),
//                                 child: CircleAvatar(
//                                   backgroundImage:
//                                       AssetImage('assets/images/img_16.png'),
//                                 ),
//                               ),
//                               text(
//                                 title: category[i]['text'],
//                                 fontSize: 13,
//                               ),
//                               Checkbox(
//                                 value: isChecked,
//                                 onChanged: (bool? value) {
//                                   setState(() {
//                                     if (value != null && value) {
//                                       selectedItemId =
//                                           i; // تحديث العنصر المحدد إلى العنصر الحالي
//                                     } else {
//                                       selectedItemId =
//                                           -1; // إلغاء تحديد العنصر إذا تم إلغاء تحديد الـ checkBox
//                                     }
//                                   });
//                                 },
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                     itemCount: category.length,
//                   ),
//                 ),
//                 SizedBox(
//                   height: Height * 0.02,
//                 ),
//                 Center(
//                   child: Container(
//                     child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                             minimumSize: const Size(311, 44),
//                             backgroundColor: Color0,
//                             elevation: 1,
//                             shape: const RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.all(
//                               Radius.circular(10),
//                             ))),
//                         onPressed: () {
//                           Navigator.push<void>(
//                             context,
//                             MaterialPageRoute<void>(
//                               builder: (BuildContext context) =>
//                                   BookingDetials(),
//                             ),
//                           );
//                         },
//                         child: text(
//                           title: 'Continue',
//                           color: Colors.white,
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         )),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 40,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
