import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thi/Reservations/Detils/W9.dart';
import 'package:thi/Reservations/Details_Club/cubit/home_stable_cubit.dart';
import 'package:thi/component/Widght.dart';
import 'package:thi/component/conset/Const.dart';

// ignore: must_be_immutable
class Screen2 extends StatelessWidget {
  final HomeStableCubit cubit;

  Screen2({super.key, required this.cubit});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeStableCubit()..getDataServic(cubit.clubIDModel!.club!.id!),
      child: BlocConsumer<HomeStableCubit, HomeStableState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = HomeStableCubit.getObject(context);
          double width = MediaQuery.of(context).size.width;
          double height = MediaQuery.of(context).size.height;

          return Scaffold(
            body: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(71, 181, 255, 0.623), // اللون الأصلي
                    Color.fromRGBO(199, 255, 255, 1), // اللون المتناسق
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                children: [
                  // SizedBox(
                  //   height: 15,
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  //   child: ToggleButtons(
                  //     isSelected: cubit.isSelected,
                  //     fillColor: LinearGradientColor03,
                  //     onPressed: (int index) {
                  //       cubit.seclectPage(index);
                  //     },
                  //     children: [
                  //       Container(
                  //         width: width * 0.4,
                  //         alignment: Alignment.center,
                  //         child: text(
                  //             title: "Services",
                  //             fontSize: 14,
                  //             fontWeight: FontWeight.w400,
                  //             color: Color.fromRGBO(33, 35, 39, 1)),
                  //       ),
                  //       Container(
                  //         width: width * 0.4,
                  //         alignment: Alignment.center,
                  //         child: text(
                  //             title: "Package & Offers",
                  //             fontSize: 14,
                  //             fontWeight: FontWeight.w400,
                  //             color: Color.fromRGBO(0, 0, 0, 0.5)),
                  //       ),
                  //       // Container(
                  //       //   width: 90,
                  //       //   alignment: Alignment.center,
                  //       //   child: text(
                  //       //       title: "Services",
                  //       //       fontSize: 14,
                  //       //       fontWeight: FontWeight.w400,
                  //       //       color: Color.fromRGBO(0, 0, 0, 0.5)),
                  //       // ),
                  //       // if(false){print("object");}

                  //       // SizedBox(height: ,)
                  //     ],
                  //   ),
                  // ),
                  cubit.getServicClubModel == null
                      ? Container()
                      : Container(
                          width: width,
                          height: height * 0.4,
                          child: ListView.separated(
                            itemCount:
                                cubit.getServicClubModel!.services!.length,
                            separatorBuilder: (context, index) {
                              return Divider();
                            },
                            // قم بتعيين عدد عناصر القائمة الخاصة بك
                            itemBuilder: (context, index) {
                              // ignore: unused_local_variable
                              // bool isChecked =
                              //     false; // تحديد حالة التحديد بقيمة افتراضية
                              // if (cubit.checkedItems.length < index + 1) {
                              //   cubit.checkedItems.add(
                              //       false); // إضافة قيمة افتراضية للتحديد إذا لم يتم تعريفها بعد
                              // }
                              return ListTile(
                                leading: Container(
                                  width: 50,
                                  height: 80,
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
                                        scale: 1,
                                        image: NetworkImage(
                                          ImagesPath +
                                              cubit.getServicClubModel!
                                                  .services![index].image!,
                                        ),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                title: text(
                                  title: cubit.getServicClubModel!
                                      .services![index].name!,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w600,
                                  color: Color0,
                                ),
                                subtitle: text(
                                  title: cubit.getServicClubModel!
                                      .services![index].description!,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(3, 2, 3, 1),
                                ),
                                // trailing: Checkbox(
                                //   value: cubit.checkedItems[index],
                                //   onChanged: (bool? value) {
                                //     // cubit.chaingcheckedItems(
                                //     //     value,
                                //     //     index,
                                //     //     cubit.getServicClubModel!
                                //     //         .services![index].id!);
                                //   },
                                // ),
                                onTap: () {
                                  // تنفيذ الإجراء عند النقر على السطر
                                  print('تم النقر على السطر');
                                },
                              );
                            },
                          ),
                        ),
                  // SizedBox(height: 10),
                  // ListTile(
                  //   leading: Container(
                  //     width: 50,
                  //     height: 50,
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(8.0),
                  //       // gradient: LinearGradient(
                  //       //   colors: [
                  //       //     Color0,
                  //       //     Color0
                  //       //     // const Color(0xFFFF80AB), // زهري فاتح
                  //       //     // const Color(0xFFFF4081), // زهري غامق
                  //       //   ],
                  //       //   begin: Alignment.topLeft,
                  //       //   end: Alignment.bottomRight,
                  //       // ),
                  //       boxShadow: [
                  //         BoxShadow(
                  //           color: Color0.withOpacity(0.5),
                  //           spreadRadius: 2.0,
                  //           blurRadius: 10.0,
                  //           offset: Offset(-1, 6),
                  //         ),
                  //       ],
                  //       image: DecorationImage(
                  //           scale: 1,
                  //           image: AssetImage(
                  //             'assets/images/paralympic equestrian-amico.png',
                  //           )),
                  //     ),
                  //     // child: Image.asset(
                  //     //   'assets/images/main/image 69.png',
                  //     //   // fit: BoxFit.cover,
                  //     //   width: MediaQuery.of(context).size.width,
                  //     //   height: MediaQuery.of(context).size.height,
                  //     // ),
                  //   ),
                  //   title: text(
                  //       title: "Training",
                  //       fontSize: 16,
                  //       fontWeight: FontWeight.w400,
                  //       color: Color.fromRGBO(3, 2, 3, 1)),
                  //   trailing: text(
                  //       title: "View",
                  //       fontSize: 16,
                  //       fontWeight: FontWeight.w400,
                  //       color: Color0),
                  //   // subtitle: Text('النص الفرعي للسطر'),
                  //   onTap: () {
                  //     // تنفيذ الإجراء عند النقر على السطر
                  //     print('تم النقر على السطر');
                  //   },
                  // ),
                  // SizedBox(height: 10),
                  // ListTile(
                  //   leading: Container(
                  //     width: 50,
                  //     height: 50,
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(8.0),
                  //       // gradient: LinearGradient(
                  //       //   colors: [
                  //       //     Color.fromRGBO(90, 0, 114, 1),
                  //       //     Color.fromRGBO(90, 0, 114, 1)
                  //       //     // const Color(0xFFFF80AB), // زهري فاتح
                  //       //     // const Color(0xFFFF4081), // زهري غامق
                  //       //   ],
                  //       //   begin: Alignment.topLeft,
                  //       //   end: Alignment.bottomRight,
                  //       // ),
                  //       boxShadow: [
                  //         BoxShadow(
                  //           color: Color0.withOpacity(0.5),
                  //           spreadRadius: 2.0,
                  //           blurRadius: 10.0,
                  //           offset: Offset(-1, 6),
                  //         ),
                  //       ],
                  //       image: DecorationImage(
                  //           scale: 1,
                  //           image: AssetImage(
                  //             'assets/images/horse jumping-pana.png',
                  //           )),
                  //     ),
                  //     // child: Image.asset(
                  //     //   'assets/images/main/image 69.png',
                  //     //   // fit: BoxFit.cover,
                  //     //   width: MediaQuery.of(context).size.width,
                  //     //   height: MediaQuery.of(context).size.height,
                  //     // ),
                  //   ),
                  //   title: text(
                  //       title: "Training",
                  //       fontSize: 16,
                  //       fontWeight: FontWeight.w400,
                  //       color: Color.fromRGBO(3, 2, 3, 1)),
                  //   trailing: text(
                  //       title: "View",
                  //       fontSize: 16,
                  //       fontWeight: FontWeight.w400,
                  //       color: Color0),
                  //   // subtitle: Text('النص الفرعي للسطر'),
                  //   onTap: () {
                  //     // تنفيذ الإجراء عند النقر على السطر
                  //     print('تم النقر على السطر');
                  //   },
                  // ),

                  ///////////////////////////////////////////
                  // secrbool1 == false
                  //     ? Container()
                  //     : Column(
                  //         children: [
                  //           SizedBox(height: 10),
                  //           ListTile(
                  //             leading: Container(
                  //               width: 50,
                  //               height: 50,
                  //               decoration: BoxDecoration(
                  //                 borderRadius: BorderRadius.circular(8.0),
                  //                 gradient: LinearGradient(
                  //                   colors: [
                  //                     Color.fromRGBO(90, 0, 114, 1),
                  //                     Color.fromRGBO(90, 0, 114, 1)
                  //                     // const Color(0xFFFF80AB), // زهري فاتح
                  //                     // const Color(0xFFFF4081), // زهري غامق
                  //                   ],
                  //                   begin: Alignment.topLeft,
                  //                   end: Alignment.bottomRight,
                  //                 ),
                  //                 boxShadow: [
                  //                   BoxShadow(
                  //                     color: Color.fromRGBO(90, 0, 114, 1)
                  //                         .withOpacity(0.5),
                  //                     spreadRadius: 2.0,
                  //                     blurRadius: 10.0,
                  //                     offset: Offset(-1, 6),
                  //                   ),
                  //                 ],
                  //                 image: DecorationImage(
                  //                     scale: 1,
                  //                     image: AssetImage(
                  //                       'assets/images/main/horse (1) (1).png',
                  //                     )),
                  //               ),
                  //               // child: Image.asset(
                  //               //   'assets/images/main/image 69.png',
                  //               //   // fit: BoxFit.cover,
                  //               //   width: MediaQuery.of(context).size.width,
                  //               //   height: MediaQuery.of(context).size.height,
                  //               // ),
                  //             ),
                  //             title: text(
                  //                 title: "Jumping",
                  //                 fontSize: 16,
                  //                 fontWeight: FontWeight.w400,
                  //                 color: Color.fromRGBO(3, 2, 3, 1)),
                  //             trailing: Container(
                  //               width: 168,
                  //               height: 60,
                  //               decoration: BoxDecoration(
                  //                 color: Color.fromRGBO(190, 140, 206, 1),
                  //                 borderRadius: BorderRadius.circular(10),
                  //                 border: Border.all(
                  //                   color: Colors.white,
                  //                   width: 2.0,
                  //                 ),
                  //               ),
                  //               child: Column(
                  //                 mainAxisAlignment: MainAxisAlignment.center,
                  //                 children: [
                  //                   DropdownButton<String>(
                  //                     underline: null,
                  //                     value: selectedOption,
                  //                     onChanged: (String? newValue) {
                  //                       setState(() {
                  //                         selectedOption = newValue;
                  //                       });
                  //                     },
                  //                     items: <String>[
                  //                       '1000',
                  //                       '2000',
                  //                       '3000',
                  //                       '4000'
                  //                     ].map<DropdownMenuItem<String>>(
                  //                         (String value) {
                  //                       return DropdownMenuItem<String>(
                  //                         value: value,
                  //                         child: Row(
                  //                           children: [
                  //                             text(
                  //                                 title: "price",
                  //                                 fontSize: 14,
                  //                                 fontWeight: FontWeight.w400,
                  //                                 color: Color.fromRGBO(
                  //                                     0, 0, 0, 0.87)),
                  //                             SizedBox(
                  //                               width: 15,
                  //                             ),
                  //                             text(
                  //                                 title: value,
                  //                                 fontSize: 14,
                  //                                 fontWeight: FontWeight.w400,
                  //                                 color: Color.fromRGBO(
                  //                                     0, 0, 0, 0.87)),
                  //                           ],
                  //                         ),
                  //                       );
                  //                     }).toList(),
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //             // subtitle: Text('النص الفرعي للسطر'),
                  //             onTap: () {
                  //               // تنفيذ الإجراء عند النقر على السطر
                  //               print('تم النقر على السطر');
                  //             },
                  //           ),
                  //           SizedBox(height: 10),
                  //           ListTile(
                  //             leading: Container(
                  //               width: 50,
                  //               height: 50,
                  //               decoration: BoxDecoration(
                  //                 borderRadius: BorderRadius.circular(8.0),
                  //                 gradient: LinearGradient(
                  //                   colors: [
                  //                     Color.fromRGBO(90, 0, 114, 1),
                  //                     Color.fromRGBO(90, 0, 114, 1)
                  //                     // const Color(0xFFFF80AB), // زهري فاتح
                  //                     // const Color(0xFFFF4081), // زهري غامق
                  //                   ],
                  //                   begin: Alignment.topLeft,
                  //                   end: Alignment.bottomRight,
                  //                 ),
                  //                 boxShadow: [
                  //                   BoxShadow(
                  //                     color: Color.fromRGBO(90, 0, 114, 1)
                  //                         .withOpacity(0.5),
                  //                     spreadRadius: 2.0,
                  //                     blurRadius: 10.0,
                  //                     offset: Offset(-1, 6),
                  //                   ),
                  //                 ],
                  //                 image: DecorationImage(
                  //                     scale: 1,
                  //                     image: AssetImage(
                  //                       'assets/images/main/horse-riding.png',
                  //                     )),
                  //               ),
                  //               // child: Image.asset(
                  //               //   'assets/images/main/image 69.png',
                  //               //   // fit: BoxFit.cover,
                  //               //   width: MediaQuery.of(context).size.width,
                  //               //   height: MediaQuery.of(context).size.height,
                  //               // ),
                  //             ),
                  //             title: text(
                  //                 title: "Cleaning",
                  //                 fontSize: 16,
                  //                 fontWeight: FontWeight.w400,
                  //                 color: Color.fromRGBO(3, 2, 3, 1)),
                  //             trailing: Container(
                  //               width: 168,
                  //               height: 60,
                  //               decoration: BoxDecoration(
                  //                 color: Color.fromRGBO(190, 140, 206, 1),
                  //                 borderRadius: BorderRadius.circular(10),
                  //                 border: Border.all(
                  //                   color: Colors.white,
                  //                   width: 2.0,
                  //                 ),
                  //               ),
                  //               child: Column(
                  //                 mainAxisAlignment: MainAxisAlignment.center,
                  //                 children: [
                  //                   DropdownButton<String>(
                  //                     underline: null,
                  //                     value: selectedOption1,
                  //                     onChanged: (String? newValue) {
                  //                       setState(() {
                  //                         selectedOption1 = newValue;
                  //                       });
                  //                     },
                  //                     items: <String>[
                  //                       '1000',
                  //                       '2000',
                  //                       '3000',
                  //                       '4000'
                  //                     ].map<DropdownMenuItem<String>>(
                  //                         (String value) {
                  //                       return DropdownMenuItem<String>(
                  //                         value: value,
                  //                         child: Row(
                  //                           children: [
                  //                             text(
                  //                                 title: "Select type",
                  //                                 fontSize: 14,
                  //                                 fontWeight: FontWeight.w400,
                  //                                 color: Color.fromRGBO(
                  //                                     0, 0, 0, 0.4)),
                  //                             SizedBox(
                  //                               width: 15,
                  //                             ),
                  //                             text(
                  //                                 title: value,
                  //                                 fontSize: 14,
                  //                                 fontWeight: FontWeight.w400,
                  //                                 color: Color.fromRGBO(
                  //                                     0, 0, 0, 0.87)),
                  //                           ],
                  //                         ),
                  //                       );
                  //                     }).toList(),
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //             // subtitle: Text('النص الفرعي للسطر'),
                  //             onTap: () {
                  //               // تنفيذ الإجراء عند النقر على السطر
                  //               print('تم النقر على السطر');
                  //             },
                  //           ),
                  //           SizedBox(height: 10),
                  //           ListTile(
                  //             leading: Container(
                  //               width: 50,
                  //               height: 50,
                  //               decoration: BoxDecoration(
                  //                 borderRadius: BorderRadius.circular(8.0),
                  //                 gradient: LinearGradient(
                  //                   colors: [
                  //                     Color.fromRGBO(90, 0, 114, 1),
                  //                     Color.fromRGBO(90, 0, 114, 1)
                  //                     // const Color(0xFFFF80AB), // زهري فاتح
                  //                     // const Color(0xFFFF4081), // زهري غامق
                  //                   ],
                  //                   begin: Alignment.topLeft,
                  //                   end: Alignment.bottomRight,
                  //                 ),
                  //                 boxShadow: [
                  //                   BoxShadow(
                  //                     color: Color.fromRGBO(90, 0, 114, 1)
                  //                         .withOpacity(0.5),
                  //                     spreadRadius: 2.0,
                  //                     blurRadius: 10.0,
                  //                     offset: Offset(-1, 6),
                  //                   ),
                  //                 ],
                  //                 image: DecorationImage(
                  //                     scale: 1,
                  //                     image: AssetImage(
                  //                       'assets/images/main/horse.png',
                  //                     )),
                  //               ),
                  //               // child: Image.asset(
                  //               //   'assets/images/main/image 69.png',
                  //               //   // fit: BoxFit.cover,
                  //               //   width: MediaQuery.of(context).size.width,
                  //               //   height: MediaQuery.of(context).size.height,
                  //               // ),
                  //             ),
                  //             title: text(
                  //                 title: "Cleaning",
                  //                 fontSize: 16,
                  //                 fontWeight: FontWeight.w400,
                  //                 color: Color.fromRGBO(3, 2, 3, 1)),
                  //             trailing: Container(
                  //               width: 168,
                  //               height: 60,
                  //               decoration: BoxDecoration(
                  //                 color: Color.fromRGBO(190, 140, 206, 1),
                  //                 borderRadius: BorderRadius.circular(10),
                  //                 border: Border.all(
                  //                   color: Colors.white,
                  //                   width: 2.0,
                  //                 ),
                  //               ),
                  //               child: Column(
                  //                 mainAxisAlignment: MainAxisAlignment.center,
                  //                 children: [
                  //                   DropdownButton<String>(
                  //                     underline: null,
                  //                     value: selectedOption2,
                  //                     onChanged: (String? newValue) {
                  //                       setState(() {
                  //                         selectedOption2 = newValue;
                  //                       });
                  //                     },
                  //                     items: <String>[
                  //                       '1000',
                  //                       '2000',
                  //                       '3000',
                  //                       '4000'
                  //                     ].map<DropdownMenuItem<String>>(
                  //                         (String value) {
                  //                       return DropdownMenuItem<String>(
                  //                         value: value,
                  //                         child: Row(
                  //                           children: [
                  //                             text(
                  //                                 title: "Select type",
                  //                                 fontSize: 14,
                  //                                 fontWeight: FontWeight.w400,
                  //                                 color: Color.fromRGBO(
                  //                                     0, 0, 0, 0.4)),
                  //                             SizedBox(
                  //                               width: 15,
                  //                             ),
                  //                             text(
                  //                                 title: value,
                  //                                 fontSize: 14,
                  //                                 fontWeight: FontWeight.w400,
                  //                                 color: Color.fromRGBO(
                  //                                     0, 0, 0, 0.87)),
                  //                           ],
                  //                         ),
                  //                       );
                  //                     }).toList(),
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //             // subtitle: Text('النص الفرعي للسطر'),
                  //             onTap: () {
                  //               // تنفيذ الإجراء عند النقر على السطر
                  //               print('تم النقر على السطر');
                  //             },
                  //           ),
                  //         ],
                  //       ),

                  //////////////////////////////////////
                  ///
                  secrbool1
                      ? Container()
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              SizedBox(
                                height: height * 0.01,
                              ),
                              GestureDetector(
                                onTap: (() {
                                  Navigator.push<void>(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                          Detiels(
                                              imagename:
                                                  'assets/images/img_21.png'),
                                    ),
                                  );
                                }),
                                child: Container(
                                  width: width,
                                  height: height * 0.4,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    color: Colors.yellow,
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/images/img_21.png',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              Row(
                                children: [
                                  text(
                                      title: "Jumping Package ",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black),
                                  Spacer(),
                                  text(
                                    title: "Book Now",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(190, 140, 206, 1),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  text(
                                      title:
                                          "Completed Package Offer till Sep 18, 2023",
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(0, 0, 0, 0.5)),
                                  Spacer(),
                                  text(
                                      title: "450 AED",
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black),
                                ],
                              ),
                            ],
                          ),
                        )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
