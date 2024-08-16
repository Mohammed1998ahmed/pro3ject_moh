// import 'package:flutter/material.dart';

// import 'package:thi/Reservations/Screens/Screen1.dart';
// import 'package:thi/Reservations/Screens/Screen2.dart';
// import 'package:thi/Reservations/Screens/Screen3.dart';
// import 'package:thi/Reservations/Screens/Screen4.dart';
// import 'package:thi/component/Widght.dart';
// import 'package:thi/component/conset/Const.dart';
// import 'package:thi/profile/profile.dart';

// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);

//   @override
//   State<Home> createState() => _W8State();
// }

// class _W8State extends State<Home> {
//   // ignore: unused_field
//   int _selectedButton = 0;
//   // ignore: unused_field
//   List<bool> _isSelected = [true, false, false];
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: SingleChildScrollView(
//           child: Column(children: [
//             Container(
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.height * 0.44,
//               decoration: BoxDecoration(
//                 color: Color.fromRGBO(255, 199, 99, 0.203),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Color.fromRGBO(255, 199, 99, 0.203),
//                     spreadRadius: 5,
//                     blurRadius: 7,
//                     offset: Offset(2, -6),
//                   ),
//                 ],
//               ),
//               // color: Colors.yellow,
//               child: Stack(children: [
//                 Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.only(
//                         bottomLeft: Radius.circular(40),
//                         bottomRight: Radius.circular(40)),
//                     image: DecorationImage(
//                         image: AssetImage('assets/images/main/image 83.png'),
//                         fit: BoxFit.cover),
//                   ),
//                   // child: Image.asset(
//                   //   'assets/images/main/image 83.png',
//                   //   fit: BoxFit.cover,
//                   //   width: MediaQuery.of(context).size.width,
//                   //   height: MediaQuery.of(context).size.height,
//                   // ),
//                 ),
//                 Scaffold(
//                   backgroundColor: Colors.transparent,
//                   appBar: AppBar(
//                     backgroundColor: Colors.transparent,
//                     elevation: 0.0,
//                     leading: IconButton(
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                         icon: Icon(
//                           Icons.arrow_back,
//                           color: Colors.white,
//                         )),
//                     title: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 15),
//                       child: Container(
//                         height: MediaQuery.of(context).size.height * .12,
//                         width: MediaQuery.of(context).size.width,
//                         // color: Colors.yellow,
//                         child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               text(
//                                   title: "Godolphin Stables",
//                                   color: Color3,
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.w700),
//                               text(
//                                   title: "Horse riding in Abu Dhabi",
//                                   color: Color3,
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.w400),
//                               // SizedBox(
//                               //   height:
//                               //       MediaQuery.of(context).size.height * 0.002,
//                               // ),
//                               // Container(
//                               //   width: MediaQuery.of(context).size.width,
//                               //   height: 33,
//                               //   child: Row(
//                               //     mainAxisAlignment: MainAxisAlignment.center,
//                               //     children: [
//                               //       Container(
//                               //         // width: MediaQuery.of(context).size.width,
//                               //         height: 16,
//                               //         child: Row(
//                               //           children: [
//                               //             SmoothStarRating(
//                               //               borderColor: Colors.white,
//                               //               color:
//                               //                   Color.fromRGBO(228, 179, 67, 1),
//                               //               rating: rating,
//                               //               // isReadOnly: false,
//                               //               size: 20,
//                               //               filledIconData: Icons.star,
//                               //               halfFilledIconData: Icons.star_half,
//                               //               defaultIconData: Icons.star_border,
//                               //               starCount: 5,
//                               //               allowHalfRating: true,
//                               //               spacing: 2.0,
//                               //               onRatingChanged: (v) {
//                               //                 setState(() {
//                               //                   rating = v;
//                               //                 });
//                               //               },
//                               //             ),
//                               //             text(
//                               //                 title: "   (125 Reviews)",
//                               //                 color: Colors.white,
//                               //                 fontSize: 12,
//                               //                 fontWeight: FontWeight.w400),
//                               //           ],
//                               //         ),
//                               //       ),
//                               //       // Spacer(),
//                               //     ],
//                               //   ),
//                               // ),
//                             ]),
//                       ),
//                     ),
//                     actions: [
//                       IconButton(
//                         onPressed: () {},
//                         icon: Image.asset(
//                           'assets/images/main/noun_bookmark_660526.png',
//                           // fit: BoxFit.cover,
//                           width: MediaQuery.of(context).size.width * 0.2,
//                           height: MediaQuery.of(context).size.height,
//                         ),
//                       ),
//                     ],
//                   ),
//                   body: Column(children: [
//                     Spacer(),
//                     Container(
//                         height: MediaQuery.of(context).size.height * 0.12,
//                         padding: EdgeInsets.all(10),
//                         // color: Colors.white,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Container(
//                               width: MediaQuery.of(context).size.width * 0.18,
//                               decoration: BoxDecoration(
//                                   color: Color.fromRGBO(255, 198, 99, 0.607),
//                                   borderRadius: BorderRadius.circular(50)),
//                               child: HomeGesdector(
//                                   icon: Icons.av_timer_sharp,
//                                   title: "Website",
//                                   onTap: () {
//                                     print("Website");
//                                   }),
//                             ),

//                             // SizedBox(
//                             //   width: 20,
//                             // ),
//                             // // Container(
//                             // //   width: MediaQuery.of(context).size.width * 0.18,
//                             // //   decoration: BoxDecoration(
//                             // //       color: Color.fromRGBO(255, 198, 99, 0.607),
//                             // //       borderRadius: BorderRadius.circular(50)),
//                             // //   child: HomeGesdector(
//                             // //       icon: Icons.phone,
//                             // //       title: "Call",
//                             // //       onTap: () {}),
//                             // // ),

//                             // SizedBox(
//                             //   width: 20,
//                             // ),
//                             Container(
//                               width: MediaQuery.of(context).size.width * 0.18,
//                               decoration: BoxDecoration(
//                                   color: Color.fromRGBO(255, 198, 99, 0.607),
//                                   borderRadius: BorderRadius.circular(50)),
//                               child: HomeGesdector(
//                                   icon: Icons.map_outlined,
//                                   title: "Direction",
//                                   onTap: () {
//                                     print("Direction");
//                                   }),
//                             ),

//                             // SizedBox(
//                             //   width: 20,
//                             // ),
//                             Container(
//                               width: MediaQuery.of(context).size.width * 0.18,
//                               decoration: BoxDecoration(
//                                   color: Color.fromRGBO(255, 198, 99, 0.607),
//                                   borderRadius: BorderRadius.circular(50)),
//                               child: HomeGesdector(
//                                   icon: Icons.share,
//                                   title: "Share",
//                                   onTap: () {
//                                     print("Share");

//                                     // share();
//                                   }),
//                             ),

//                             // SizedBox(
//                             //   width: 20,
//                             // )
//                           ],
//                         ))
//                   ]),
//                 )
//               ]),
//             ),
//             //////////////////////////
//             Container(
//               height: MediaQuery.of(context).size.height * 0.80,
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     Container(
//                       width: MediaQuery.of(context).size.width,
//                       height: MediaQuery.of(context).size.height * 0.30,
//                       // color: Color.fromRGBO(90, 60, 98, 0.15),
//                       color: Color.fromRGBO(255, 199, 99, 0.203),

//                       child: Padding(
//                         padding: const EdgeInsets.all(10.0),
//                         child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               SizedBox(
//                                 height: 10,
//                               ),

//                               SizedBox(
//                                 height: 15,
//                               ),
//                               text(
//                                   title: "Stable specialists",
//                                   color: Color0,
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.w700),
//                               SizedBox(
//                                 height:
//                                     MediaQuery.of(context).size.height * 0.005,
//                               ),
//                               Container(
//                                 width: MediaQuery.of(context).size.width,
//                                 height: MediaQuery.of(context).size.height *
//                                     0.1719999,
//                                 child: ListView.separated(
//                                   scrollDirection: Axis.horizontal,
//                                   itemCount: 5,
//                                   separatorBuilder:
//                                       (BuildContext context, int index) =>
//                                           SizedBox(
//                                     width: MediaQuery.of(context).size.width *
//                                         0.03,
//                                   ),
//                                   itemBuilder:
//                                       (BuildContext context, int index) {
//                                     return ListCirclePerson(
//                                         context: context,
//                                         indexImage: index,
//                                         title: "Mike West ${index}",
//                                         onTap: () {
//                                           Navigator.push<void>(
//                                             context,
//                                             MaterialPageRoute<void>(
//                                               builder: (BuildContext context) =>
//                                                   Profile(),
//                                             ),
//                                           );
//                                         });
//                                   },
//                                 ),
//                               ),
//                               // SizedBox(
//                               //   height: 40,
//                               // ),
//                             ]),
//                       ),
//                     ),
//                     /////////////////////
//                     // Container(
//                     //   height: 700,
//                     //   // color: Colors.pink,
//                     //   child: DefaultTabController(
//                     //       length: 4,
//                     //       child: Container(
//                     //           width: MediaQuery.of(context).size.width,
//                     //           height:
//                     //               MediaQuery.of(context).size.height * 0.312,
//                     //           // color: Colors.pink,
//                     //           child: Column(children: [
//                     //             Container(
//                     //               color: Color.fromRGBO(90, 60, 98, 0.15),
//                     //               child: TabBar(
//                     //                 labelColor: Color0,
//                     //                 indicatorColor: Color0,
//                     //                 unselectedLabelColor:
//                     //                     Color.fromRGBO(5, 0, 0, 0.5),
//                     //                 tabs: [
//                     //                   Tab(text: 'About'),
//                     //                   Tab(text: 'Services'),
//                     //                   Tab(text: 'Gallery'),
//                     //                   Tab(text: 'Review'),
//                     //                 ],
//                     //               ),
//                     //             ),
//                     //             Expanded(
//                     //               child: TabBarView(
//                     //                 children: [
//                     //                   Screen1(),
//                     //                   Screen2(),
//                     //                   Screen3(),
//                     //                   Screen4()
//                     //                 ],
//                     //               ),
//                     //             ),
//                     //           ]))),
//                     // ),
//                   ],
//                 ),
//               ),
//             ),
//             /////////////////
//             SizedBox(
//               height: 60,
//               child: Container(color: Colors.transparent),
//             )
//           ]),
//         ),
//       ),
//     );
//   }
// }
