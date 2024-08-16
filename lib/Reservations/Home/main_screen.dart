// ignore_for_file: must_be_immutable

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:thi/Reservations/Filter/filters.dart';
import 'package:thi/Reservations/Home/cubit/main_screen_cubit.dart';
import 'package:thi/Reservations/Search/searchPage.dart';
import 'package:thi/component/Widght.dart';

import 'package:thi/component/conset/Const.dart';
import 'package:thi/menu/Drwer/DrwerPage.dart';
import 'package:thi/notifaction/noyifaction.dart';

class MainScreen extends StatelessWidget {
  MainScreen({
    Key? key,
    this.pagep,
  }) : super(key: key);
  final int? pagep;
  int m = 2;
  // ignore: unused_field
  int _page = 0;

  int selected_page = 0;
  bool shimmer = true;
  bool about = true;
  bool chat = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainScreenCubit()..configurePusher(),
      child: BlocConsumer<MainScreenCubit, MainScreenState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = MainScreenCubit.getObject(context);
          // ignore: unused_local_variable
          double width = MediaQuery.of(context).size.width;
          // ignore: unused_local_variable
          double height = MediaQuery.of(context).size.height;
          return Scaffold(
              body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(imageBackground), fit: BoxFit.cover)),
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                leading: IconButton(
                    onPressed: () {
                      Navigator.push<void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => DrwerPage(),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.dehaze_outlined,
                      size: 30,
                      color: Color0,
                    )),
                title: text(
                  title: 'THI',
                  textAlign: TextAlign.center,
                  color: Color0,
                  fontSize: 46,
                  fontWeight: FontWeight.w700,
                ),
                actions: [
                  // Stack(
                  //   alignment: Alignment.centerRight,
                  //   children: [
                  //     Container(
                  //       width: width * 0.11,
                  //       child: IconButton(
                  //           onPressed: () {
                  //             Navigator.push<void>(
                  //               context,
                  //               MaterialPageRoute<void>(
                  //                 builder: (BuildContext context) =>
                  //                     Notifaction(),
                  //               ),
                  //             );
                  //           },
                  //           icon: Icon(
                  //             Icons.notifications_none_outlined,
                  //             color: Color0,
                  //             size: 33,
                  //           )),
                  //     ),
                  //     Stack(
                  //       alignment: Alignment.center,
                  //       children: [
                  //         CircleAvatar(
                  //           radius: 7,
                  //           backgroundColor: LinearGradientColor02,
                  //         ),
                  //         CircleAvatar(
                  //           radius: 5,
                  //           backgroundColor: Colors.red,
                  //         ),
                  //       ],
                  //     )
                  //   ],
                  // ),
                  // IconButton(
                  //     onPressed: () {
                  //       Navigator.of(context)
                  //           .push(MaterialPageRoute(builder: (_) => Filters()));
                  //     },
                  //     icon: Icon(
                  //       Icons.filter_alt,
                  //       color: Color0,
                  //       size: 32,
                  //     )),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => SearchPage()));
                      },
                      icon: Icon(
                        Icons.search,
                        color: Color0,
                        size: 32,
                      )),
                  SizedBox(
                    width: 10,
                  )
                ],
              ),
              backgroundColor: Colors.transparent,
              body: cubit.ListWidght[cubit.index],
              // drawer: Drawer(),
              bottomNavigationBar: CurvedNavigationBar(
                height: 60.0,

                items: cubit.iconNav(),

                color: Color.fromRGBO(71, 181, 255, 0.678), // Colors.black,
                buttonBackgroundColor: Color0,
                backgroundColor: Color.fromRGBO(71, 181, 255,
                    0.185), // Colors.transparent.withOpacity(0.0),
                animationCurve: Curves.easeInOutQuart,
                index: cubit.index,
                animationDuration: Duration(milliseconds: 600),
                onTap: (index) {
                  cubit.chaingindex(index);
                  print(index.toString() +
                      "PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP");
                  // cubit.chaingindex(index);
                },
                // letIndexChange: (index) => false,
              ),
            ),
          ));
        },
      ),
    );
  }
}
  // body: cubit.index == 0
              //     ? cubit.about
              //         ? shimmer == false
              //             ? ShimmerWidght(width: width, height: height)
              //             : Home1()
              //         : NearbyScreen()
              //     : selected_page == 1
              //         ? Local1()
              //         : selected_page == 2
              //             ? ChatListScreen()
              //             : selected_page == 3
              //                 ? Profile2()
              //                 : selected_page == 10
              //                     ? ServieseScreen()
              //                     : Container(),
  // setState(() {
                  //   _page = index;
                  //   print("LLLLLLLLLLLLLLLLLLLLLL");
                  //   print(index);
                  // });
       // Container(
              //     padding: EdgeInsets.symmetric(vertical: 10),
              //     width: double.infinity,
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Builder(
              //             builder: (context) => IconButton(
              //                 onPressed: () {
              //                   // Scaffold.of(context).openDrawer();

              //                   Navigator.push<void>(
              //                     context,
              //                     MaterialPageRoute<void>(
              //                       builder: (BuildContext context) =>
              //                           DrwerPage(),
              //                     ),
              //                   );
              //                 },
              //                 icon: const Icon(
              //                   Icons.dehaze_rounded,
              //                   color: Colors.black,
              //                 ))),
              //         Container(
              //           padding: EdgeInsets.only(top: 15),
              //           alignment: Alignment.center,
              //           child: Text(
              //             'THI',
              //             textAlign: TextAlign.center,
              //             style: TextStyle(
              //               color: Color0,
              //               fontSize: 46,
              //               fontFamily: 'Inter',
              //               fontWeight: FontWeight.w700,
              //               height: 0,
              //             ),
              //           ),
              //         ),
              //         Container(
              //           child: Row(
              //             children: [

              //         )
              //       ],
              //     ),
              //   ),
    // bottomNavigationBar: CurvedNavigationBar(
              //   // ignore: unnecessary_null_comparison
              //   index: selected_page == null ? 0 : selected_page,
              //   height: 70.0,
              //   items: <Widget>[
              //     Padding(
              //       padding: const EdgeInsets.symmetric(vertical: 5),
              //       child: Column(
              //         children: [
              //           // SizedBox(
              //           //   height: 6,
              //           // ),
              //           IconButton(
              //             icon: Icon(
              //               Icons.home_outlined,
              //               size: 30,
              //               color: Color3,
              //             ),
              //             onPressed: () {
              //               setState(() {
              //                 selected_page = 0;
              //                 about = true;
              //               });
              //             },
              //           ),
              //           text(
              //               title: "Home",
              //               fontSize: 8,
              //               fontWeight: FontWeight.w600,
              //               color: Colors.white)
              //         ],
              //       ),
              //     ),
              //     Padding(
              //       padding: const EdgeInsets.symmetric(vertical: 5),
              //       child: Column(
              //         children: [
              //           // SizedBox(
              //           //   height: 6,
              //           // ),
              //           IconButton(
              //             icon: Icon(
              //               Icons.location_on_outlined,
              //               size: 30,
              //               color: Color3,
              //             ),
              //             onPressed: () {
              //               setState(() {
              //                 selected_page = 1;
              //               });
              //             },
              //           ),
              //           text(
              //               title: "Near by",
              //               fontSize: 8,
              //               fontWeight: FontWeight.w600,
              //               color: Colors.white)
              //         ],
              //       ),
              //     ),
              //     selected_page == 2
              //         ? IconButton(
              //             onPressed: () {
              //               print("llllllll");
              //               setState(() {
              //                 // selected_page = 3;
              //               });
              //             },
              //             icon: Icon(
              //               Icons.close,
              //               color: Color3,
              //               size: 30,
              //             ))
              //         : Padding(
              //             padding: const EdgeInsets.symmetric(vertical: 5),
              //             child: Column(
              //               children: [
              //                 IconButton(
              //                     onPressed: () {
              //                       print("llllllll");
              //                       setState(() {
              //                         selected_page = 2;

              //                         chat = false;
              //                       });
              //                     },
              //                     icon: Icon(
              //                       Icons.chat_bubble_outline_outlined,
              //                       color: Color3,
              //                       size: 30,
              //                     )),
              //                 text(
              //                     title: "chat",
              //                     fontSize: 8,
              //                     fontWeight: FontWeight.w600,
              //                     color: Colors.white)
              //               ],
              //             ),
              //           ),
              //     // Padding(
              //     //   padding: const EdgeInsets.symmetric(vertical: 5),
              //     //   child: Column(
              //     //     children: [
              //     //       IconButton(
              //     //         onPressed: () {
              //     //           setState(() {
              //     //             selected_page = 3;
              //     //           });
              //     //         },
              //     //         icon: Icon(
              //     //           Icons.book,
              //     //           size: 30,
              //     //           color: Color3,
              //     //         ),
              //     //       ),
              //     //       text(
              //     //           title: "Booking",
              //     //           fontSize: 8,
              //     //           fontWeight: FontWeight.w600,
              //     //           color: Colors.white)
              //     //     ],
              //     //   ),
              //     // ),
              //     GestureDetector(
              //       onTap: () {
              //         print("objectLLLL");
              //       },
              //       child: Padding(
              //         padding: const EdgeInsets.symmetric(vertical: 5),
              //         child: Column(
              //           children: [
              //             IconButton(
              //               onPressed: () {
              //                 setState(() {
              //                   selected_page = 3;
              //                 });
              //               },
              //               icon: Icon(
              //                 Icons.person,
              //                 size: 30,
              //                 color: Color3,
              //               ),
              //             ),
              //             text(
              //                 title: "Profile",
              //                 fontSize: 8,
              //                 fontWeight: FontWeight.w600,
              //                 color: Colors.white)
              //           ],
              //         ),
              //       ),
              //     ),
              //   ],
              //   color: Colors.black,
              //   buttonBackgroundColor: Color0,
              //   backgroundColor: Colors.transparent.withOpacity(0.0),
              //   animationCurve: Curves.easeInOutQuart,
              //   animationDuration: Duration(milliseconds: 600),
              //   onTap: (index) {
              //     setState(() {
              //       _page = index;
              //       print("LLLLLLLLLLLLLLLLLLLLLL");
              //       print(index);
              //     });
              //   },
              //   // letIndexChange: (index) => false,
              // ),