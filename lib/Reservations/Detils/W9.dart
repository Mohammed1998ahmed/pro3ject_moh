import 'package:flutter/material.dart';
import 'package:thi/component/Widght.dart';
import 'package:thi/component/conset/Const.dart';

class Detiels extends StatelessWidget {
  Detiels({Key? key, required this.imagename}) : super(key: key);
  final String imagename;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, -6),
                  ),
                ],
              ),
              // color: Colors.yellow,
              child: Stack(children: [
                Container(
                  child: Image.asset(
                    imagename,
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                    // height: MediaQuery.of(context).size.height,
                    height: 230,
                  ),
                ),
                Scaffold(
                  backgroundColor: Colors.transparent,
                  appBar: AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0.0,
                    leading: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        )),
                  ),
                  body: Column(
                    children: [
                      SizedBox(
                        height: 120,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.723,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          child: SingleChildScrollView(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  text(
                                      title: "Jumping Package",
                                      color: Color0,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  text(
                                      title:
                                          "Jumping Package elps people train to ride horses properly and learn the movements.",
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Row(
                                    children: [
                                      text(
                                          title: "Service",
                                          color: Color0,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700),
                                      Spacer(),
                                      Container(
                                        child: Row(children: [
                                          text(
                                              title: "Total:",
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                          text(
                                              title: " 450 AED",
                                              color: Color0,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                        ]),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 27,
                                  ),
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            'assets/images/main/Component 47 – 1.png',
                                            // fit: BoxFit.cover,
                                            width: 20,
                                            height: 20,
                                          ),
                                          text(
                                              title: " Juice",
                                              color: Color0,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400),
                                        ],
                                      ),
                                      Spacer(),
                                      Row(
                                        children: [
                                          Image.asset(
                                            'assets/images/main/Component 47 – 1.png',
                                            // fit: BoxFit.cover,
                                            width: 20,
                                            height: 20,
                                          ),
                                          text(
                                              title: " Break 10 munites",
                                              color: Color0,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 24,
                                  ),
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            'assets/images/main/Component 47 – 1.png',
                                            // fit: BoxFit.cover,
                                            width: 20,
                                            height: 20,
                                          ),
                                          text(
                                              title: " Water",
                                              color: Color0,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400),
                                        ],
                                      ),
                                      Spacer()
                                    ],
                                  ),
                                  SizedBox(
                                    height: 193,
                                  ),
                                  Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        // يتم تنفيذ هذا الكود عند النقر على الزر
                                        print('تم النقر على الزر!');
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.80,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                          gradient: LinearGradient(
                                            colors: [
                                              Color0,
                                              Color0
                                              // const Color(0xFFFF80AB), // زهري فاتح
                                              // const Color(0xFFFF4081), // زهري غامق
                                            ],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color0.withOpacity(0.5),
                                              spreadRadius: 2.0,
                                              blurRadius: 10.0,
                                              offset: Offset(-1, 6),
                                            ),
                                          ],
                                        ),
                                        child: Center(
                                          child: text(title: 
                                            "Book now",
                                         
                                              color: Colors.black,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold,
                                        
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ])),
          // Container(
          //   width: MediaQuery.of(context).size.width,
          //   height: 400,
          //   color: Colors.yellow,
          // )
        ],
      ),
    );
  }
}
